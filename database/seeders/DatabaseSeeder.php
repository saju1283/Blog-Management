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
            // 1. Users
            User::factory(10)->create();

            // 2. Tags
            $tags = Tag::factory(5)->create();

            // 3. Posts
            $posts = Post::factory(20)->create();

            // 4. Attach tags to posts
            foreach ($posts as $post) {
                $post->tags()->attach(
                    $tags->random(rand(1, 3))->pluck('id')->toArray()
                );
            }

            // 5. Comments
            Comment::factory(30)->create();

            // 6. Likes and bookmarks
            foreach ($posts as $post) {
                $users = User::inRandomOrder()->take(rand(1, 5))->get();

                foreach ($users as $user) {
                    \App\Models\Like::create([
                        'user_id' => $user->id,
                        'post_id' => $post->id,
                    ]);

                    \App\Models\Bookmark::create([
                        'user_id' => $user->id,
                        'post_id' => $post->id,
                    ]);
                }
            }
    }

}
