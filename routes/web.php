<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\LikeController;
use App\Http\Controllers\BookmarkController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\NotificationController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Home and Welcome Routes
Route::get('/', function () {
    return inertia('Home', [
        'featuredPosts' => \App\Models\Post::with(['user', 'tags'])
            ->where('visibility', 'public')
            ->latest()
            ->take(3)
            ->get(),
        'popularTags' => \App\Models\Tag::withCount('posts')
            ->orderBy('posts_count', 'desc')
            ->take(10)
            ->get()
    ]);
})->name('home');

// Authentication Routes
Route::middleware('guest')->group(function () {
    Route::get('/register', [AuthController::class, 'showRegister'])->name('register');
    Route::post('/register', [AuthController::class, 'register']);
    Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
    Route::post('/login', [AuthController::class, 'login']);
});

Route::post('/logout', [AuthController::class, 'logout'])->name('logout')->middleware('auth');

// Authenticated Routes
Route::middleware('auth')->group(function () {
    // Profile Routes
    Route::get('/profile', [ProfileController::class, 'show'])->name('profile.show');
    Route::get('/profile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');

    // Post Routes
    Route::resource('posts', PostController::class)->except(['index', 'show']);
    Route::get('/my-posts', [PostController::class, 'userPosts'])->name('posts.user');

    // Comment Routes
    Route::post('/posts/{post}/comments', [CommentController::class, 'store'])->name('comments.store');
    Route::delete('/comments/{comment}', [CommentController::class, 'destroy'])->name('comments.destroy');

    // Like Routes
    Route::post('/posts/{post}/like', [LikeController::class, 'toggle'])->name('posts.like');

    // Bookmark Routes
    Route::post('/posts/{post}/bookmark', [BookmarkController::class, 'toggle'])->name('posts.bookmark');
    Route::get('/bookmarks', [BookmarkController::class, 'index'])->name('bookmarks.index');

    // Notification Routes
    //Route::get('/notifications', [NotificationController::class, 'index'])->name('notifications.index');
    //Route::put('/notifications/{notification}/read', [NotificationController::class, 'markAsRead'])->name('notifications.read');
    //Route::put('/notifications/mark-all-read', [NotificationController::class, 'markAllAsRead'])->name('notifications.readAll');
});

// Public Post Routes (accessible to everyone)
Route::get('/posts', [PostController::class, 'index'])->name('posts.index');
Route::get('/posts/{post}', [PostController::class, 'show'])->name('posts.show');

// Error Routes
Route::inertia('/404', 'Errors/NotFound')->name('404');
Route::fallback(function () {
    return inertia('Errors/NotFound');
});