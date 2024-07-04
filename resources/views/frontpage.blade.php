@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-3">
            <div class="card">
                <div class="card-header">Menu</div>

                <div class="card-body">
                    <ul class="list-group">
                        <form action="{{ route('frontpage') }}" method="get">
                            @csrf
                            <a href="{{ route('frontpage') }}" class="list-group-item list-group-item-action">Todas</a>
                            <input type="submit" value="Tradicional" name="category" class="list-group-item list-group-item-action">
                            <input type="submit" value="Vegetariana" name="category" class="list-group-item list-group-item-action">
                            <input type="submit" value="Vegana" name="category" class="list-group-item list-group-item-action">
                            <input type="submit" value="Doce" name="category" class="list-group-item list-group-item-action">
                        </form>
                        <h3 class="text-center mt-2">{{ count($pizzas) }} Pizzas</h3>
                    </ul>
                </div>
            </div>

            @if (count($errors) > 0)
            <div class="card mt-5">
                <div class="card-body">
                    <div class="alert alert-danger">
                        @foreach ($errors->all() as $error)
                        <p>{{ $error }}</p>
                        @endforeach
                    </div>
                </div>
            </div>
            @endif

        </div>
        <div class="col-md-9">
            <div class="card">
                <div class="card-header">Casa da Pizza</div>
                <div class="card-body">
                    <div class="row">
                        @forelse ($pizzas as $pizza)
                        <div class="card" style="width: 18rem;">
                            <img src="{{ asset('storage/' . $pizza->image) }}" class="card-img-top" width="80" alt="pizza">

                            <div class="card-body">
                                <h5 class="card-title">{{ $pizza->name }}</h5>
                                <p>{{ $pizza->description }}</p>
                                <a href={{ route('pizza.show', $pizza->id) }} class="btn btn-danger">Detalhar</a>
                                <a href="#" class="btn btn-primary">Comprar</a>
                            </div>
                        </div>

                        @empty
                        <p>Não há pizzas disponíveis!</p>
                        @endforelse

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    a.list-group-item {
        font-size: 18px;
    }

    a.list-group-item:hover {
        background-color: red;
        color: #fff;
    }

    .card-header {
        background-color: red;
        color: #fff;
        font-size: 20px;

    }
</style>
@endsection