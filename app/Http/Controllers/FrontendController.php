<?php

namespace App\Http\Controllers;

use App\Models\Pizza;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    public function index()
    {
        $pizzas = Pizza::latest()->get();
        return view('frontpage', compact('pizzas'));
    }


    public function show($id)
    {
        $pizza = Pizza::findOrFail($id);
        return view('show', compact('pizza'));
    }

    public function store(Request $request)
    {
        if ($request->small_pizza == 0 && $request->small_pizza == 0 && $request->small_pizza == 0) {
            return;
        }
    }
}
