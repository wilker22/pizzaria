@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header">Menu</div>

                    <div class="card-body">
                        @if (Auth::check())
                            <form action="{{ route('order.store') }}" method="POST">
                                @csrf
                                <div class="form-group">
                                    <input type="hidden" name="pizza_id" value="{{ $pizza->id }}">
                                    <input type="hidden" name="created_at" value="{{ $pizza->created_at }}">

                                    <p>Nome: {{ auth()->user()->name }}</p>
                                    <p>E-mail: {{ auth()->user()->email }}</p>
                                    <p>Telefone: <input type="number" placeholder="Apenas números com DDD"
                                            class="form-control" name="phone"></p>
                                    <p>Pequena: <input type="number" placeholder="Pizza Pequena - Qtd" class="form-control"
                                            name="small_pizza" value="0"></p>
                                    <p>Média: <input type="number" hint="Pizza Média - Qtd" class="form-control"
                                            name="medium_pizza" value="0"></p>
                                    <p>Grande: <input type="number" placeholder="Pizza Grande - Qtd" class="form-control"
                                            name="large_pizza" value="0"></p>
                                    <!--<p><input type="datetime-local" class="form-control" name="date_time"></p>-->
                                    <p><input type="text" class="form-control" name="body"></p>
                                    <p>
                                        <button type="submit" class="form-control btn btn-danger">Comprar</button>
                                    </p>
                                    @if (session('message'))
                                        <div class="alert alert-success" role="alert">
                                            {{session('message')}}
                                        </div>
                                    @endif
                                    @if (session('errmessage'))
                                        <div class="alert alert-danger" role="alert">
                                            {{session('errmessage')}}
                                        </div>
                                    @endif
                                </div>

                            </form>
                        @else
                            <p><a href="{{ route('login') }}" class="btn btn-danger">Para efetuar a compra, click para fazer
                                    Login.</a></p>
                        @endif
                    </div>
                </div>

               

            </div>

            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">{{ $pizza->name }}</div>

                        <div class="card-body">
                            <img src="{{ asset('storage/' . $pizza->image) }}" class="card-img-top" width="50"
                                alt="pizza">
                            <p>
                            <h3>{{ $pizza->description }}</h3>
                            </p>
                            <p>
                            <h3>Pequena: R$ {{ $pizza->small_pizza_price }}</h3>
                            </p>
                            <p>
                            <h3>Média: R$ {{ $pizza->medium_pizza_price }}</h3>
                            </p>
                            <p>
                            <h3>Grande: R$ {{ $pizza->large_pizza_price }}</h3>
                            </p>
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
