﻿var id = 0;

$(document).ready(function () {
    get();
});

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("airports.aspx/get", {

    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {
                var isActive = item.DateDeleted == "" ? "Activated" : "Not Activated";

                var active = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Name + "\" class=\"fa fa-remove remove\">" +
                                   "<span class=\"tooltiptext\">Click to deactivate</span>" +
                               "</i>";
                var inactive = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Name + "\" class=\"fa fa-check-circle activate\">" +
                                   "<span class=\"tooltiptext\">Click to activate</span>" +
                               "</i>";

                var statusAction = isActive == "Not Activated" ? inactive : active;

                var html = "<tr>" +
                           "<td>" + item.ID + "</td>" +
                           "<td>" + item.Name + "</td>" +
                           "<td>" + item.Code + "</td>" +
                           "<td>" + item.Country + "</td>" +
                           "<td>" + item.DateCreated + "</td>" +
                           "<td>" + item.DateUpdated + "</td>" +
                           "<td>" +
                               "<i data-id=\"" + item.ID + "\" class=\"fa fa-search view\" data-toggle='modal' data-target='#viewModal'> " +
                                   "<span class=\"tooltiptext\">Click to view details</span>" +
                               "</i>";
                html += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\" data-toggle='modal' data-target='#editModal'>" +
                        "<span class=\"tooltiptext\">Click to modify details</span>" +
                    "</i>";

                html += statusAction;

                html += "</td>" +
               "</tr>";

                $('#tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#table').DataTable();
        });
    }).run();
}

$(document).on('click', '#save', function () {
    if (isInputValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("airports.aspx/insert", {
            name: $('#name').val(),
            code: $('#code').val(),
            country: $('#country').val()
        }).then(function (response) {

            swal('Successfully Added!', 'Item has been successfully added.', 'success');
            get();
            $('.fa-spin').addClass('hidden');
            $('.close').click();

        }).run();
    }

});

$(document).on('click', '.view', function () {
    id = $(this).data('id');

    (new http).post("airports.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#name-view').val(item.Name);
        $('#code-view').val(item.Code);
        $('#country-view').val(item.Country).change();

        $('#viewModal .form-control').prop('disabled', true);
    }).run();
});

$(document).on('click', '.edit', function () {
    id = $(this).data('id');

    (new http).post("airports.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#name-edit').val(item.Name);
        $('#code-edit').val(item.Code);
        $('#country-edit').val(item.Country).change();

    }).run();
});

$(document).on('click', '#saveChanges', function () {
    if (isInputEditValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("airports.aspx/update", {
            id: id,
            name: $('#name-edit').val(),
            code: $('#code-edit').val(),
            country: $('#country-edit').val()
        }).then(function (response) {

            swal('Successfully Updated!', 'Item has been successfully updated.', 'success');
            get();
            $('.fa-spin').addClass('hidden');
            $('.close').click();

        }).run();
    }

});

$(document).on('click', '.remove', function () {
    id = $(this).data('id');
    var name = $(this).data('name');

    swal({
        title: 'Are you sure you want to deactivate ' + $(this).data('name') + '?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Deactivate!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("airports.aspx/delete", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Deactivated', 'Item Has Been Deactivated!', 'success');
                get();
            }).run();
        }
    })
});

function isInputValid() {
    var a = $("#name").validate(['required']).displayErrorOn($("#error-name"));
    var b = $("#code").validate(['required']).displayErrorOn($("#error-code"));
    var c = $("#country").validate(['required']).displayErrorOn($("#error-country"));

    return a && b && c;
}

function isInputEditValid() {
    var a = $("#name-edit").validate(['required']).displayErrorOn($("#error-name-edit"));
    var b = $("#code-edit").validate(['required']).displayErrorOn($("#error-code-edit"));
    var c = $("#country-edit").validate(['required']).displayErrorOn($("#error-country-edit"));

    return a && b && c;
}