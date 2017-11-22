$.each($('form').not($("form[action*='comments']")).not($("form[action*='login']")).serializeArray(), function (index, value) {
    $('[name*="' + value.name + '"]').prop('disabled', true);
});