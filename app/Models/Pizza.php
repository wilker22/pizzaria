<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Pizza extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'small_pizza_price',
        'medium_pizza_price',
        'large_pizza_price',
        'category',
        'image',

    ];

    public function orders(): HasMany
    {
        return $this->hasMany(Order::class);
    }
}
