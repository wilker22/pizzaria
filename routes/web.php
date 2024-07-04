<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('/', [App\Http\Controllers\FrontendController::class, 'index'])->name('frontpage');
Route::get('/pizza/{id}', [App\Http\Controllers\FrontendController::class, 'show'])->name('pizza.show');
Route::post('/order/store', [App\Http\Controllers\FrontendController::class, 'store'])->name('order.store');

Route::middleware(['auth', 'admin'])->prefix('admin')->group(function () {
    Route::get('/pizza', [App\Http\Controllers\PizzaController::class, 'index'])->name('pizza.index');
    Route::get('/pizza/create', [App\Http\Controllers\PizzaController::class, 'create'])->name('pizza.create');
    Route::post('/pizza/store', [App\Http\Controllers\PizzaController::class, 'store'])->name('pizza.store');
    Route::get('/pizza/{id}/edit', [App\Http\Controllers\PizzaController::class, 'edit'])->name('pizza.edit');
    Route::put('/pizza/{id}/update', [App\Http\Controllers\PizzaController::class, 'update'])->name('pizza.update');
    Route::delete('/pizza/{id}/destroy', [App\Http\Controllers\PizzaController::class, 'destroy'])->name('pizza.destroy');

    //Pedidos
    Route::get('/user/order', [App\Http\Controllers\UserOrderController::class, 'index'])->name('user.order');
    Route::post('/order/{id}/status', [App\Http\Controllers\UserOrderController::class, 'changeStatus'])->name('order.status');
});
