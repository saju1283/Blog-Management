<?php

namespace App\Providers;

use App\Models\Comment;
use App\Models\Post;
use App\Policies\CommentPolicy;
use App\Policies\PostPolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        Post::class => PostPolicy::class,
        Comment::class => CommentPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        // Define gates for additional authorization checks
        Gate::define('delete-comment', function ($user, Comment $comment) {
            return $user->id === $comment->user_id || $user->id === $comment->post->user_id;
        });

        Gate::define('view-private-post', function ($user, Post $post) {
            return $post->visibility === 'public' || 
                  ($user && ($user->id === $post->user_id || $user->isAdmin()));
        });

        // Optional: Admin gate if you need admin functionality
        Gate::define('isAdmin', function ($user) {
            return $user->role === 'admin'; // Assuming you have a 'role' column in users table
        });
    }
}