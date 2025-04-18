<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Like;

class LikeController extends Controller
{
    public function toggle($postId)
    {
        $userId = Auth::id();

        $like = Like::where('post_id', $postId)->where('user_id', $userId)->first();

        if ($like) {
            $like->delete();
        } else {
            Like::create([
                'post_id' => $postId,
                'user_id' => $userId,
            ]);
        }

        return back();
    }
}
