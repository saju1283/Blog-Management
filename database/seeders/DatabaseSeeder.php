<?php

namespace Database\Seeders;
use App\Models\User;
use App\Models\Post;
use App\Models\Tag;
use App\Models\Comment;
use App\Models\Like;
use App\Models\Bookmark;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
{
    // Create users
    User::factory(10)->create();

    // Create tags
    $tags = Tag::factory(5)->create();

    // Create posts
    $posts = Post::factory(20)->create();

    // Attach random tags to posts
    foreach ($posts as $post) {
        $post->tags()->attach(
            $tags->random(rand(1, 3))->pluck('id')->toArray()
        );
    }

    // Create comments
    Comment::factory(30)->create();

    // Add likes and bookmarks
    foreach ($posts as $post) {
        $users = User::inRandomOrder()->take(rand(1, 5))->get();
        foreach ($users as $user) {
            $post->likes()->create(['user_id' => $user->id]);
            $post->bookmarks()->create(['user_id' => $user->id]);
        }
    }
}
}
