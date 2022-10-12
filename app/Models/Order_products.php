<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order_products extends Model
{
    use HasFactory;
    public function orders()
    {
        return $this->belongsToMany(Orders::class,'id','order_id');
    }

}
