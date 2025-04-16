<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Post>
 */
class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    // database/factories/PostFactory.php

public function definition(): array
{
    return [
        'user_id' => \App\Models\User::factory(),
        'title' => fake()->sentence(),
        'content' => fake()->paragraph(5),
        'image' => null,
        'visibility' => fake()->randomElement(['public', 'private']),
    ];
}

}
