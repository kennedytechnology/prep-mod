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
        Awesomplete.$$("input.awesomplete").forEach(function (input) {
            new Awesomplete(input);
        });
        return event.preventDefault();
    });

    addFormField('.addClinicDate', '.clinicFieldsContainer');
    removeFormField('.removeClinicDatefield', '.nestedClinicDate');
});

function addFormField(klassContainer, fieldsContainer) {
    $('form').on('click', klassContainer, function (event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $(fieldsContainer).append($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });
}

function removeFormField(buttonKlass, fieldContainer) {
    $('form').on('click', buttonKlass, function (event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest(fieldContainer).hide();
        return event.preventDefault();
    });
}