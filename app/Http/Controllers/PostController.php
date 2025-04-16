<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;

class PostController extends Controller
{
    public function index(Request $request)
    {
        $query = Post::with(['user', 'tags', 'likes', 'comments'])
            ->where('visibility', 'public')
            ->latest();

        if ($request->has('search')) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('title', 'like', "%$search%")
                  ->orWhere('content', 'like', "%$search%")
                  ->orWhereHas('user', function($q) use ($search) {
                      $q->where('username', 'like', "%$search%");
                  })
                  ->orWhereHas('tags', function($q) use ($search) {
                      $q->where('name', 'like', "%$search%");
                  });
            });
        }

        $posts = $query->paginate(10);

        return Inertia::render('Posts/Index', [
            'posts' => $posts,
            'search' => $request->search ?? ''
        ]);
    }

    public function create()
    {
        $tags = Tag::all();
        return Inertia::render('Posts/Create', ['tags' => $tags]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'tags' => 'nullable|array',
            'visibility' => 'required|in:public,private'
        ]);

        $post = new Post();
        $post->user_id = auth()->id();
        $post->title = $request->title;
        $post->content = $request->content;
        $post->visibility = $request->visibility;

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('posts', 'public');
            $post->image = $path;
        }

        $post->save();

        if ($request->tags) {
            $post->tags()->sync($request->tags);
        }

        return redirect()->route('posts.show', $post->id)->with('success', 'Post created successfully!');
    }

    public function show(Post $post)
    {
        // Check if post is private and not owned by current user
        if ($post->visibility === 'private' && (!auth()->check() || auth()->id() !== $post->user_id)) {
            abort(403);
        }

        $post->load([
            'user', 
            'tags', 
            'likes', 
            'comments' => function($query) {
                $query->with(['user', 'replies' => function($q) {
                    $q->with('user');
                }]);
            },
            'bookmarks'
        ]);

        return Inertia::render('Posts/Show', [
            'post' => $post
        ]);
    }

    public function edit(Post $post)
    {
        $this->authorize('update', $post);

        $tags = Tag::all();
        $post->load('tags');

        return Inertia::render('Posts/Edit', [
            'post' => $post,
            'tags' => $tags
        ]);
    }

    public function update(Request $request, Post $post)
    {
        $this->authorize('update', $post);

        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'tags' => 'nullable|array',
            'visibility' => 'required|in:public,private',
            'remove_image' => 'nullable|boolean'
        ]);

        $post->title = $request->title;
        $post->content = $request->content;
        $post->visibility = $request->visibility;

        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($post->image) {
                Storage::disk('public')->delete($post->image);
            }
            $path = $request->file('image')->store('posts', 'public');
            $post->image = $path;
        } elseif ($request->remove_image && $post->image) {
            Storage::disk('public')->delete($post->image);
            $post->image = null;
        }

        $post->save();

        if ($request->tags) {
            $post->tags()->sync($request->tags);
        } else {
            $post->tags()->detach();
        }

        return redirect()->route('posts.show', $post->id)->with('success', 'Post updated successfully!');
    }

    public function destroy(Post $post)
    {
        $this->authorize('delete', $post);

        if ($post->image) {
            Storage::disk('public')->delete($post->image);
        }

        $post->delete();

        return redirect()->route('home')->with('success', 'Post deleted successfully!');
    }
}