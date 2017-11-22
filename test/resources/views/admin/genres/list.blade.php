@extends('layouts.admin.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Countries
                    <a href="{{url('admin/genres/create')}}" class="pull-right">New genre</a>
                </div>

                <div class="panel-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>                                
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($genres as $genre)
                             <tr id='{{$genre->id}}'>
                                <td>{{$genre->id}}</td>
                                <td>{{$genre->name}}</td>                                
                                <td>                                    
                                    <a href="{{url('admin/genres/')}}/{{$genre->id}}/edit" class="btn btn-default btn-sm">Edit</a>

                                    {!! Form::open(['method'=>'DELETE', 'url'=>'admin/genres/'.$genre->id, 'style'=>'display:inline;']) !!}
                                    <button type="submit" class="btn btn-default btn-sm">Delete</button>
                                    {!! Form::close() !!}
                                    
                                    <a href="{{url('admin/genres/')}}/{{$genre->id}}" class="btn btn-default btn-sm">Show</a>
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
