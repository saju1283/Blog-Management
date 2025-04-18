<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function store(Request $request)
    {
        // Convert comma-separated string to array
        $request->merge([
            'tags' => array_filter(array_map('trim', explode(',', $request->tags)))
        ]);

        // Validation
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'tags' => 'nullable|array',
            'visibility' => 'required|in:Public,Private',
            'image' => 'nullable|image|max:2048',
        ]);

        // Store image if exists
        $path = $request->file('image')?->store('posts', 'public');

        // Create post
        Post::create([
            'user_id' => Auth::id(),
            'title' => $validated['title'],
            'content' => $validated['content'],
            'tags' => $validated['tags'],
            'visibility' => $validated['visibility'],
            'image' => $path ? "/storage/{$path}" : null,
        ]);

        return redirect('/posts');
    }
}
