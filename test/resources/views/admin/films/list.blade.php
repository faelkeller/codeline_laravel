@extends('layouts.admin.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Films
                    <a href="{{url('admin/films/create')}}" class="pull-right">New film</a>
                </div>

                <div class="panel-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Release Date</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($films as $film)
                            <tr id='{{$film->id}}'>
                                <td>{{$film->id}}</td>
                                <td>{{$film->name}}</td>
                                <td>{{$film->release_date}}</td>
                                <td>
                                    <a href="{{url('admin/films/')}}/{{$film->id}}/edit" class="btn btn-default btn-sm">Edit</a>
                                    {!! Form::open(['method'=>'DELETE', 'url'=>'admin/films/'.$film->id, 'style'=>'display:inline;']) !!}
                                    <button type="submit" class="btn btn-default btn-sm">Delete</button>
                                    {!! Form::close() !!}
                                    <a href="{{url('admin/films/')}}/{{$film->id}}" class="btn btn-default btn-sm">Show</a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
