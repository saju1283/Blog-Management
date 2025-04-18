<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Bookmark;
use Inertia\Inertia;

class BookmarkController extends Controller
{
    public function index()
    {
        $bookmarks = Bookmark::with('post.user')
            ->where('user_id', Auth::id())
            ->latest()
            ->paginate(10)
            ->withQueryString();

        return Inertia::render('Bookmarks', [
            'bookmarks' => $bookmarks
        ]);
    }

    public function toggle(Request $request)
    {
        $bookmark = Bookmark::where('user_id', Auth::id())
            ->where('post_id', $request->post_id)
            ->first();

        if ($bookmark) {
            $bookmark->delete();
        } else {
            Bookmark::create([
                'user_id' => Auth::id(),
                'post_id' => $request->post_id
            ]);
        }

        return back();
    }
}
