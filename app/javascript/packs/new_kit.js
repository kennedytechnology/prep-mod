$(document).on('turbolinks:load', function () {

    $('form').on('click', '.remove_record', function (event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('.clinic_new_personnel').hide();
        return event.preventDefault();
    });

    $('form').on('click', '.add_fields', function (event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $('.fields').append($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });

    $('form').on('click', '.remove_test_kit_record', function (event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('.new_test_kit_row').hide();
        return event.preventDefault();
    });

    $('form').on('click', '.add_test_kit_fields', function (event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $('#testKits').append($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });

});