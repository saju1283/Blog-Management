<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\Post;
use Illuminate\Database\Eloquent\Factories\Factory;

class CommentFactory extends Factory
{
    protected $model = \App\Models\Comment::class;

    public function definition(): array
    {
        return [
            'user_id' => User::inRandomOrder()->first()?->id ?? User::factory(),
            'post_id' => Post::inRandomOrder()->first()?->id ?? Post::factory(),
            'parent_id' => null,
            'content' => $this->faker->sentence(),
        ];
    }
}
