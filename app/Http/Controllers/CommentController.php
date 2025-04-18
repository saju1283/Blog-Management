<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    public function store(Request $request, $postId)
    {
        $request->validate([
            'body' => 'required|string'
        ]);

        Comment::create([
            'user_id' => Auth::id(),
            'post_id' => $postId,
            'body' => $request->body,
            'parent_id' => $request->parent_id // nullable
        ]);

        return back();
    }
}
