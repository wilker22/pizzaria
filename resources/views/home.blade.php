@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">Pedidos </li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-header"> Pedidos de {{ auth()->user()->name }}</div>

                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Cliente</th>
                                <th scope="col">Tel/E-mail</th>
                                <th scope="col">Data/Hora</th>
                                <th scope="col">Pizza</th>
                                <th scope="col">P</th>
                                <th scope="col">M</th>
                                <th scope="col">G</th>
                                <th scope="col">Total do Pedido</th>
                                <th scope="col">Mensagem</th>
                                <th scope="col">Status</th>
                                

                            </tr>
                        </thead>
                        <tbody>
                            @if (count($orders) > 0)
                            @foreach ($orders as $key => $order)
                            <tr>
                                <th scope="row">{{ $order->user->name }}</th>
                                <td scope="row">
                                    {{ $order->phone }}
                                    {{ $order->user->email }}
                                </td>
                                <td scope="row">{{ $order->created_at }}</td>
                                <td scope="row">{{ $order->pizza->name }}</td>
                                <td scope="row">{{ $order->small_pizza }}</td>
                                <td scope="row">{{ $order->medium_pizza }}</td>
                                <td scope="row">{{ $order->large_pizza }}</td>
                                <td scope="row">
                                    R$
                                    {{ $order->pizza->small_pizza_price * $order->small_pizza +
                                                    $order->pizza->medium_pizza_price * $order->medium_pizza +
                                                    $order->pizza->large_pizza_price * $order->large_pizza }},00
                                </td>
                                <td scope="row">{{ $order->body }}</td>
                                <td scope="row">{{ $order->status }}</td>
                                
                            </tr>
                            @endforeach
                            @else
                            <p>Não existem dados a ser exibidos!</p>
                            @endif
                        </tbody>
                    </table>
                    {{ $orders->links() }}
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