$.each($('form').not($("form[action*='comments']")).serializeArray(), function (index, value) {
    $('[name="' + value.name + '"]').prop('disabled', true);
});