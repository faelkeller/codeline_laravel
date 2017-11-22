@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Infos Film
                    @if(Request::is('admin/*'))
                    <a href="{{url('admin/films')}}" class="pull-right">List Films</a>
                    @else
                    <a href="{{url('films')}}" class="pull-right">List Films</a>
                    @endif
                </div>

                <div class="panel-body">

                    @if(!Request::is('*/create'))
                    {!! Form::model($film, ['method'=>'PATCH', 'files' => true, 'url'=> 'admin/films/'.$film->id]) !!}
                    @else
                    {!! Form::open(['url'=> 'films', 'files' => true, 'type'=>'create']) !!}
                    @endif


                    {!! Form::label('name', 'Name') !!}
                    {!! Form::input('text', 'name', null, ['class'=>'form-control', 'autofocus', 'placeholder'=>'Name']) !!}
                    
                    {!! Form::label('slug', 'Slug') !!}
                    {!! Form::input('text', 'slug', null, ['class'=>'form-control', 'placeholder'=>'Slug']) !!}

                    {!! Form::label('description', 'Description') !!}
                    {!! Form::textarea('description', null, ['class'=>'form-control', 'placeholder'=>'Description']) !!}

                    {!! Form::label('release_date', 'Release Date') !!}
                    {!! Form::date('release_date', null, ['class'=>'form-control', 'placeholder'=>'Release Date']) !!}

                    {!! Form::label('rating', 'Rating') !!}
                    <br/>
                    
                    @foreach(\App\Film::ratings() as $key=>$value)
                        {!! Form::radio('rating', $key, ['class'=>'form-control']) !!} {{$value}}
                    @endforeach
                    <br/>

                    {!! Form::label('ticket_price', 'Ticket Price') !!}
                    {!! Form::input('text', 'ticket_price', null, ['class'=>'form-control', 'placeholder'=>'Ticket Price']) !!}                    

                    {!! Form::label('country_id', 'Country') !!}
                    {!! Form::select('country_id', $countries, null, ['class'=>'form-control', 'placeholder'=>'Country']) !!}

                    {!! Form::label('genres[]', 'Genre') !!}
                    {!! Form::select('genres[]', $genres, null, ['multiple'=> true, 'class'=>'form-control', 'placeholder'=>'Genre']) !!}

                    {!! Form::label('photo', 'Photo') !!}
                    {!! Form::file('photo', ['class'=>'form-control']) !!}

                    <br/>
                    @if(Request::is('*/create') || Request::is('*/edit'))
                    {!! Form::submit('Submit', ['class'=>'btn btn-primary']) !!}
                    @endif

                    {!! Form::close() !!}
                </div>
            </div>

            @if (!Request::is('*/create') && !Request::is('*/edit'))
            <div class="panel panel-default">
                <div class="panel-heading">
                    Comments
                </div>

                <div class="panel-body">
                    @foreach($film->comments as $comment)
                    <div class="row">
                        <div class="col-sm-1">
                            <div class="thumbnail">
                                <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                            </div>
                            <!-- /thumbnail -->
                        </div>
                        <!-- /col-sm-1 -->
                        <div class="col-sm-10">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <strong>{{$comment->user->name}}</strong> <span class="text-muted">commented at {{$comment->created_at}}</span>
                                </div>
                                <div class="panel-body">
                                    {{$comment->commentary}}
                                </div>
                                <!-- /panel-body -->
                            </div>
                            <!-- /panel panel-default -->
                        </div>
                    </div>
                    @endforeach
                </div>
                
                <div class="panel-body">
                    <div class="col-sm-1">
                        &nbsp;
                    </div>
                    <!-- /col-sm-1 -->
                    <div class="col-sm-10">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <strong>New commentary</strong>
                            </div>
                            <div class="panel-body">
                                {!! Form::open(['url'=> 'comments']) !!}
                                    {!! Form::textarea('commentary', null, ['class'=>'form-control', 'rows' => 2, 'placeholder'=>'Commentary']) !!}
                                    {!! Form::input('hidden', 'film_id', $film->id) !!}
                                    <br/>
                                    {!! Form::submit('Submit', ['class'=>'btn btn-primary']) !!}
                                {!! Form::close() !!}
                            </div>
                            <!-- /panel-body -->
                        </div>
                        <!-- /panel panel-default -->
                    </div>
                </div>
            </div>
            
            
            
            @endif
        </div>
    </div>
</div>
@if (!Request::is('*/create') && !Request::is('*/edit'))
<script src="{{ asset('js/codeline_laravel_disabled.js') }}"></script>
@endif
@endsection
