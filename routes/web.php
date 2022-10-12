<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/products', [\App\Http\Controllers\ProductController::class, 'index'])->name('products.index');
// Route::get('/create', [\App\Http\Controllers\ProductController::class, 'create'])->name('create');
Route::get('/show/{id}', [\App\Http\Controllers\ProductController::class, 'show'])->name('show');
// Route::get('/edit/{id}', [\App\Http\Controllers\ProductController::class, 'edit'])->name('edit');
// Route::post('/update/{id}', [\App\Http\Controllers\ProductController::class, 'update'])->name('update');
// Route::post('/store', [\App\Http\Controllers\ProductController::class, 'store'])->name('store');
// Route::post('/delete/{id}', [\App\Http\Controllers\ProductController::class, 'destroy'])->name('delete');
Route::get('cart', [\App\Http\Controllers\ProductController::class,'cart'])->name('cart-list');
Route::get('add-to-cart/{id}', [\App\Http\Controllers\ProductController::class,'addToCart'])->name('add-cart');
Route::get('checkout', [\App\Http\Controllers\ProductController::class,'checkout'])->name('checkout');
Route::get('paynow', [\App\Http\Controllers\StripeController::class, 'stripe'])->middleware('auth');
Route::post('stripe', [\App\Http\Controllers\StripeController::class, 'payStripe'])->name('stripe.post')->middleware('auth');
Route::get('myorders', [\App\Http\Controllers\ProductController::class, 'myorders'])->name('myorders')->middleware('auth');

Route::get('inbox', [\App\Http\Controllers\MailboxController::class, 'index'])->name('mail.indox')->middleware('auth');
Route::get('sent', [\App\Http\Controllers\MailboxController::class, 'sentlist'])->name('mail.sent')->middleware('auth');
Route::get('create', [\App\Http\Controllers\MailboxController::class, 'create'])->name('mail.create')->middleware('auth');
Route::post('store', [\App\Http\Controllers\MailboxController::class, 'store'])->name('mail.store')->middleware('auth');



Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
