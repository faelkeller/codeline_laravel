@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Infos Film
                    <a href="{{url('films')}}" class="pull-right">List Films</a>
                </div>

                <div class="panel-body">
                    
                    @if(Request::is('*/edit'))
                        {!! Form::model($film, ['method'=>'PATCH', 'url'=> 'films/'.$film->id]) !!}
                    @else
                        {!! Form::open(['url'=> 'films']) !!}
                    @endif
                    
                    
                    {!! Form::label('name', 'Name') !!}
                    {!! Form::input('text', 'name', null, ['class'=>'form-control', 'autofocus', 'placeholder'=>'Name']) !!}
                    
                    {!! Form::label('description', 'Description') !!}
                    {!! Form::textarea('description', null, ['class'=>'form-control', 'placeholder'=>'Description']) !!}
                    
                    {!! Form::label('release_date', 'Release Date') !!}
                    {!! Form::date('release_date', null, ['class'=>'form-control', 'placeholder'=>'Release Date']) !!}
                    
                    {!! Form::label('rating', 'Rating') !!}
                    <br/>
                    {!! Form::radio('rating', '1', ['class'=>'form-control']) !!} 1
                    {!! Form::radio('rating', '2', ['class'=>'form-control']) !!} 2
                    {!! Form::radio('rating', '3', ['class'=>'form-control']) !!} 3
                    {!! Form::radio('rating', '4', ['class'=>'form-control']) !!} 4
                    {!! Form::radio('rating', '5', ['class'=>'form-control']) !!} 5  
                    <br/>
                    
                    {!! Form::label('ticket_price', 'Ticket Price') !!}
                    {!! Form::input('text', 'ticket_price', null, ['class'=>'form-control', 'placeholder'=>'Ticket Price']) !!}                    
                    
                    {!! Form::label('country_id', 'Country') !!}
                    {!! Form::select('country_id', array('' => 'Country', 'L' => 'Large', 'S' => 'Small'), null, ['class'=>'form-control', 'placeholder'=>'Country']) !!}
                    
                    {!! Form::label('genre_id', 'Genre') !!}
                    {!! Form::select('genre_id', array('' => 'Genre', 'L' => 'Large', 'S' => 'Small'), null, ['class'=>'form-control', 'placeholder'=>'Genre']) !!}
                    
                    {!! Form::label('photo', 'Photo') !!}
                    {!! Form::file('photo', ['class'=>'form-control']) !!}
                    
                    <br/>
                    {!! Form::submit('Submit', ['class'=>'btn btn-primary']) !!}
                    
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
