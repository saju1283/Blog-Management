<?php

namespace App\Http\Controllers;

use App\Models\Bookmark;
use App\Models\Post;
use Illuminate\Http\Request;
use Inertia\Inertia;

class BookmarkController extends Controller
{
    public function index()
    {
        $bookmarks = auth()->user()->bookmarks()
            ->with(['post.user', 'post.tags'])
            ->latest()
            ->paginate(10);

        return Inertia::render('Bookmarks/Index', [
            'bookmarks' => $bookmarks
        ]);
    }

    public function toggle(Post $post)
    {
        $user = auth()->user();
        
        $bookmark = $post->bookmarks()->where('user_id', $user->id)->first();

        if ($bookmark) {
            $bookmark->delete();
            return back()->with('success', 'Post removed from bookmarks!');
        } else {
            $bookmark = new Bookmark();
            $bookmark->user_id = $user->id;
            $bookmark->post_id = $post->id;
            $bookmark->save();
            return back()->with('success', 'Post bookmarked!');
        }
    }
}