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
                    {!! Form::model($film, ['method'=>'PATCH', 'files' => true, 'url'=> 'films/'.$film->id]) !!}
                    @else
                    {!! Form::open(['url'=> 'films', 'files' => true]) !!}
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
                    @if(Request::is('*/create') || Request::is('*/edit'))
                    {!! Form::submit('Submit', ['class'=>'btn btn-primary']) !!}
                    @endif

                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        @if (!Request::is('*/create') && !Request::is('*/edit'))
            $.each($('form').serializeArray(), function (index, value) {
                $('[name="' + value.name + '"]').prop('disabled', true);
            });
        @endif

        $("form").submit(function (e) {
            var url = $(this).attr("action");
            var msg_error = "Error insert film!!";
            var element_error = $(".panel-body");
            
            $.ajax({
                type: "POST",
                url: url,
                data: new FormData(this),
                dataType: "json",
                contentType: false,
                processData: false,
                success: function (data){
                    if (data.id != undefined && data.id != "")
                        show_message(element_error, true, "Film inserted successfully!!", true);
                    else
                    {
                        if (data.msg != undefined)
                            msg_error = get_msg_errror(data.msg);
                        
                        show_message(element_error, true, msg_error, false);
                    }
                        
                },
                error: function(data){
                   show_message(element_error, true, msg_error, false); 
                }
            });
            e.preventDefault();
        });
    });
    
    function random(){
        $("[name='name']").val("Film " + caracters(7));
        $("[name='description']").val(caracters(40));
        $("[name='release_date']").val(random_date());
        $("[name='ticket_price']").val(random_monetary());
        $("[name='rating'][value=1]").prop("checked", true);
        $("[name='country_id']").val("L");
        $("[name='genre_id']").val("L");
    }

    function caracters(size){
        var letters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz';
        var randomstr = '';
        for (var i = 0; i < size; i++) {
            var rnum = Math.floor(Math.random() * letters.length);
            randomstr += letters.substring(rnum, rnum + 1);
        }
        return randomstr;
    }

    function random_date(){
        date = new Date( + (new Date()) - Math.floor(Math.random() * 10000000000));
        var d = date.getDate();
        var m = date.getMonth() + 1;
        var y = date.getFullYear();
        return '' + y + '-' + (m <= 9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d);
    }

    function random_monetary(){
        return Math.random().toFixed(2);
    }
    
    function show_message(element, prepend, msg, success){
        var class_alert = (success) ? "success": "danger";
        var div = $("<div>").addClass("alert").addClass("alert-"+class_alert).attr("role", "alert").html(msg);
        if (prepend)
            $(element).prepend(div);
        else 
            $(element).append(div);
        
        setTimeout(function(){
            $(div).remove();
        }, 10000);
    }
    
    function get_msg_errror(msg){
        if (typeof msg == "string")
            return msg;
        
        if (typeof msg == "object"){
            
            var temp_msg = "<ul class='list-group'>";
            
            $.each(msg, function(field, msgs){
                if (typeof msgs == "string")
                    temp_msg += "<li class='list-group-item'>"+msgs+"</li>";
                else 
                    $.each(msgs, function(index, value){
                        temp_msg += "<li class='list-group-item'>"+value+"</li>";
                    });
            });
            
            temp_msg += "</ul>";
            
            return temp_msg;
        }
        
        return msg;
    }

</script>

@endsection
