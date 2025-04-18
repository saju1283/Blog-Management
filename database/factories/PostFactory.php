<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class PostFactory extends Factory
{
    protected $model = \App\Models\Post::class;

    public function definition(): array
    {
        return [
            'user_id' => User::inRandomOrder()->first()?->id ?? User::factory(),
            'title' => $this->faker->sentence(),
            'content' => $this->faker->paragraph(4),
            'image' => null,
            'visibility' => $this->faker->randomElement(['public', 'private']),
        ];
    }
}
