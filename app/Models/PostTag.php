<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PostTag extends Pivot
{
    protected $table = 'post_tag';

    protected $fillable = [
        'post_id',
        'tag_id',
    ];
}