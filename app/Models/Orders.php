<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Orders extends Model
{
    use HasFactory;
    const PENDING =1;
    const ACCEPT =2;
    const DELIVER =3;
    
    public function orderProducts()
    {
        return $this->belongsTo(Order_products::class);
    }


}
