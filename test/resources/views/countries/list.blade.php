@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Countries
                    <a href="{{url('admin/countries/create')}}" class="pull-right">New country</a>
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
                            @foreach($countries as $country)
                            <tr>
                                <td>{{$country->id}}</td>
                                <td>{{$country->name}}</td>                                
                                <td>                                    
                                    <a href="{{url('admin/countries/')}}/{{$country->id}}/edit" class="btn btn-default btn-sm">Edit</a>

                                    {!! Form::open(['method'=>'DELETE', 'url'=>'admin/countries/'.$country->id, 'style'=>'display:inline;']) !!}
                                    <button type="submit" class="btn btn-default btn-sm">Delete</button>
                                    {!! Form::close() !!}
                                    
                                    <a href="{{url('admin/countries/')}}/{{$country->id}}" class="btn btn-default btn-sm">Show</a>
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
