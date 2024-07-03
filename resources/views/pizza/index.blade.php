@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">

            <div class="col-md-2">
                <div class="card">
                    <div class="card-header">Menu</div>

                    <div class="card-body">
                        <ul class="list-group">
                            <a href="{{ route('pizza.index') }}" class="list-group-item list-group-item-action">Mostrar</a>
                            <a href="{{ route('pizza.create') }}"
                                class="list-group-item list-group-item-action">Cadastrar</a>
                            <a href="{{ route('user.order') }}" class="list-group-item list-group-item-action">Pedido</a>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">Lista de Pizzas <a href="{{ route('pizza.create') }}" class="btn btn-primary"
                            style="float:right">Nova
                            Pizza</a></div>



                    <div class="card-body">
                        @if (session('message'))
                            <div class="alert alert-success" role="alert">
                                {{ session('message') }}
                            </div>
                        @endif

                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Imagem</th>
                                    <th scope="col">Nome</th>
                                    <th scope="col">Descrição</th>
                                    <th scope="col">Categoria</th>
                                    <th scope="col">Preço P</th>
                                    <th scope="col">Preço M</th>
                                    <th scope="col">Preço G</th>
                                    <th scope="col">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if (count($pizzas) > 0)
                                    @foreach ($pizzas as $key => $pizza)
                                        <tr>
                                            <th scope="row">{{ $key + 1 }}</th>
                                            <td><img src="{{ asset('storage/' . $pizza->image) }}" width="80"
                                                    alt="pizza">
                                            </td>
                                            <td>{{ $pizza->name }}</td>
                                            <td>{{ $pizza->description }}</td>
                                            <td>{{ $pizza->category }}</td>
                                            <td>{{ $pizza->small_pizza_price }}</td>
                                            <td>{{ $pizza->medium_pizza_price }}</td>
                                            <td>{{ $pizza->large_pizza_price }}</td>
                                            <td>
                                                <a href="{{ route('pizza.edit', $pizza->id) }}"
                                                    class="btn btn-warning">Editar</a>
                                                <a href="#" class="btn btn-danger" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal{{ $pizza->id }}">Remover</a>

                                                <!-- Modal -->
                                                <div class="modal fade" id="exampleModal{{ $pizza->id }}" tabindex="-1"
                                                    aria-labelledby="exampleModalLabel" aria-hidden="true">

                                                    <form method="POST" action="{{ route('pizza.destroy', $pizza->id) }}">
                                                        @csrf
                                                        @method('DELETE')
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">
                                                                        Confirmação:</h1>
                                                                    <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    O Registro será removido, você confirma?
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary"
                                                                        data-bs-dismiss="modal">Fechar</button>
                                                                    <button type="submit"
                                                                        class="btn btn-danger">Remover</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div>
                                                <!-- fim Modal -->
                                            </td>
                                        </tr>
                                    @endforeach
                                @else
                                    <p>Não existem dados a ser exibidos!</p>
                                @endif
                            </tbody>
                        </table>
                        {{ $pizzas->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
