@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">Pedido</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-header">Pedidos</div>

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
                                    <th scope="col" colspan="2" style="width: 300px">Ações</th>

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
                                            <td scope="row">{{ $order->created_at->format('d/m/Y H:i') }}</td>
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
                                            <form action="{{ route('order.status', $order->id) }}" method="POST">
                                                @csrf
                                                <td>
                                                    <input name="status" type="submit" value="aceito"
                                                        class="btn btn-warning btn-small">
                                                    <input name="status" type="submit" value="pendente"
                                                        class="btn btn-info btn-small mt-2">

                                                </td>
                                                <td>
                                                    <input name="status" type="submit" value="rejeitado"
                                                        class="btn btn-danger btn-small">
                                                    <input name="status" type="submit" value="concluído"
                                                        class="btn btn-success btn-small mt-2">
                                                </td>
                                            </form>

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
@endsection
