$(document).ready(function () {

        $("form").submit(function (e) {
            var url = $(this).attr("action");
            
            var method = $("[name='_method']").val();
            
            var operation = "insert";
            var operation_pass = "inserted";
            
            switch(method){
                case 'POST':
                    operation = "insert";
                    operation_pass = "inserted"; 
                    break;
                case 'PATCH':
                    operation = "update";
                    operation_pass = "updated";
                    break;
                case 'DELETE':
                    operation = "delete";
                    operation_pass = "deleted";
                    break;
            }
            
            var msg_error = "Error "+operation+" film!!";
            var element_error = $(".panel-body");
            var type = $(this).attr("type");
            
            var content_type = "application/x-www-form-urlencoded; charset=UTF-8";
            var process_data = true;
            
            var data;
            
            if (type != undefined && type == "create"){
                content_type = false;
                process_data = false;
                data = new FormData(this);
            } else{
                data = $(this).serialize();
            }
                
            
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                dataType: "json",
                contentType: content_type,
                processData: process_data,
                success: function (data){
                    if (data.id != undefined && data.id != ""){
                        show_message(element_error, true, "Register "+operation_pass+" successfully!!", true);
                        
                        if (method == "DELETE")
                            $("tr[id="+data.id+"]").remove();
                        
                    } else {
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
        var date = new Date( + (new Date()) - Math.floor(Math.random() * 10000000000));
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