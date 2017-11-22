@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Infos Genre
                   
                    <a href="{{url('admin/genres')}}" class="pull-right">List genres</a>
                   
                </div>

                <div class="panel-body">

                    @if(!Request::is('*/create'))
                    {!! Form::model($genre, ['method'=>'PATCH', 'url'=> 'admin/genres/'.$genre->id]) !!}
                    @else
                    {!! Form::open(['url'=> 'admin/genres', 'type'=>'create']) !!}
                    @endif


                    {!! Form::label('name', 'Name') !!}
                    {!! Form::input('text', 'name', null, ['class'=>'form-control', 'autofocus', 'placeholder'=>'Name']) !!}

                    <br/>
                    @if(Request::is('*/create') || Request::is('*/edit'))
                    {!! Form::submit('Submit', ['class'=>'btn btn-primary']) !!}
                    @endif

                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
</div>
@if (!Request::is('*/create') && !Request::is('*/edit'))
    <script src="{{ asset('js/codeline_laravel_disabled.js') }}"></script>
@endif
@endsection
