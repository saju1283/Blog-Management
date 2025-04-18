<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use App\Models\Post;
use App\Http\Controllers\BookmarkController;
use App\Http\Controllers\LikeController;

require __DIR__.'/auth.php';

Route::middleware(['auth'])->group(function () {
    Route::get('/dashboard', fn() => Inertia::render('Dashboard'))->name('dashboard');

    Route::get('/profile', fn() => Inertia::render('Profile', [
        'user' => Auth::user(),
    ]));

    Route::get('/posts', function () {
        $posts = Post::with(['user', 'likes', 'bookmarks'])
            ->when(request('visibility'), fn($q) => $q->where('visibility', request('visibility')))
            ->latest()
            ->paginate(10)
            ->withQueryString();

        $posts->getCollection()->transform(function ($post) {
            $post->liked_by_user = $post->likes->contains('user_id', Auth::id());
            $post->bookmarked_by_user = $post->bookmarks->contains('user_id', Auth::id());
            return $post;
        });

        return Inertia::render('Posts/Index', [
            'posts' => $posts
        ]);
    });

    Route::get('/posts/create', fn() => Inertia::render('Posts/Create'));

    Route::get('/bookmarks', [BookmarkController::class, 'index'])->name('bookmarks.index');
    Route::post('/bookmarks', [BookmarkController::class, 'toggle'])->name('bookmarks.toggle');

    Route::post('/posts/{post}/like', [LikeController::class, 'toggle'])->name('posts.like');
});
