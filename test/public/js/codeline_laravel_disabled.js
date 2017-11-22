$.each($('form').serializeArray(), function (index, value) {
    $('[name="' + value.name + '"]').prop('disabled', true);
});