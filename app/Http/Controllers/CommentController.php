<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class CommentController extends Controller
{
    public function store(Request $request, Post $post)
    {
        $request->validate([
            'content' => 'required|string|max:1000',
            'parent_id' => 'nullable|exists:comments,id'
        ]);

        $comment = new Comment();
        $comment->user_id = auth()->id();
        $comment->post_id = $post->id;
        $comment->content = $request->content;
        
        if ($request->parent_id) {
            $comment->parent_id = $request->parent_id;
        }

        $comment->save();

        return back()->with('success', 'Comment added successfully!');
    }

    public function destroy(Comment $comment)
    {
        // Only comment owner or post owner can delete
        if (!Gate::allows('delete-comment', $comment)) {
            abort(403);
        }

        $comment->delete();

        return back()->with('success', 'Comment deleted successfully!');
    }
}