@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">Clientes</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-header">
                        Clientes
                        <a style="float:right;" href="{{ route('pizza.index') }}"><button class="bnt btn-secondary btn-sm"
                                style="margin-left: 5px;">Listar Pizza's</button></a>
                        <a style="float:right;" href="{{ route('pizza.create') }}"><button
                                class="bnt btn-secondary btn-sm">Nova Pizza</button></a>
                    </div>

                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">Nome</th>
                                    <th scope="col">E-mail</th>
                                    <th scope="col">Cliente desde:</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if (count($customers) > 0)
                                    @foreach ($customers as $key => $customer)
                                        <tr>
                                            <th scope="row">{{ $customer->name }}</th>
                                            <td scope="row">{{ $customer->email }}</td>
                                            <td scope="row">
                                                {{ \Carbon\Carbon::parse($customer->created_at)->format('d M Y') }}</td>

                                        </tr>
                                    @endforeach
                                @else
                                    <p>Não existem dados a ser exibidos!</p>
                                @endif
                            </tbody>
                        </table>
                        {{ $customers->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
