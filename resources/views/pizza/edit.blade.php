@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">Menu</div>

                    <div class="card-body">
                        <ul class="list-group">
                            <a href="{{ route('pizza.index') }}" class="list-group-item list-group-item-action">Listar</a>
                            <a href="{{ route('pizza.create') }}"
                                class="list-group-item list-group-item-action">Cadastrar</a>
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

            <div class="col-md-8">
                <div class="card">

                    <div class="card-header">Editar Pizza</div>



                    <form method="POST" action="{{ route('pizza.update', $pizza->id) }}" class="form-control"
                        enctype="multipart/form-data">
                        @method('PUT')
                        @csrf
                        <div class="card-body">
                            <div class="form-group">
                                <label for="name">Nome da Pizza</label>
                                <input type="text" name="name" class="form-control" value="{{ $pizza->name }}">
                            </div>

                            <div class="form-group">
                                <label for="description">Descrição</label>
                                <textarea name="description" id="" cols="30" rows="10" value="{{ $pizza->description }}"
                                    class="form-control">
                                    {{ $pizza->description }}
                                </textarea>
                            </div>

                            <div class="row">
                                <label>Preço (R$)</label>
                                <div class="col">
                                    <input type="number" name="small_pizza_price" value="{{ $pizza->small_pizza_price }}"
                                        class="form-control" placeholder="Preço da Pizza Pequena">
                                </div>
                                <div class="col">
                                    <input type="number" name="medium_pizza_price" value="{{ $pizza->medium_pizza_price }}"
                                        class="form-control" placeholder="Preço da Pizza Média">
                                </div>
                                <div class="col">
                                    <input type="number" name="large_pizza_price" value="{{ $pizza->large_pizza_price }}"
                                        class="form-control" placeholder="Preço da Pizza Grande">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="category">Categorias</label>
                                <select name="category" id="" class="form-control">
                                    <option value="tradicional">Tradicional</option>
                                    <option value="vegana">Vegana</option>
                                    <option value="vegetariana">Vegetariana</option>
                                </select>
                            </div>

                            <div class="form-group mb-5">
                                <label for="">Imagem</label>
                                <input type="file" class="form-control" name="image">
                                <img src="{{ asset('storage/' . $pizza->image) }}" width="80">
                            </div>

                            <div class="form-group text-center ">
                                <button type="submit" class="btn btn-primary mt-3">
                                    Atualizar
                                </button>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
