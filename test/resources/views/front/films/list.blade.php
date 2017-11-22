@extends('layouts.front.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Films
                    <a href="{{url('films/create')}}" class="pull-right">New film</a>
                </div>

                <div class="panel-body">
                    @foreach($films as $film)
                    <div class="media">
                        <div class="media-left media-top">
                            <a href="#">
                                <img class="media-object" width="350" height="auto" src="{{ asset('avatars/') }}/{{$film->photo}}" alt="{{$film->name}}">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">{{$film->name}}</h4>
                            {{$film->description}}
                        </div>
                    </div>
                     @endforeach


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
                                    <a href="{{url('films/')}}/{{$film->id}}" class="btn btn-default btn-sm">Show</a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <div class="pagination">{!! str_replace('/?', '?', $films->render()) !!}</div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
