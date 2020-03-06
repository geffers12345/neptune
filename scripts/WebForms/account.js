var id = 0;

$(document).ready(function () {
    get();
});

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("accounts.aspx/get", {

    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {
                var isActive = item.DateDeleted == "" ? "Activated" : "Not Activated";

                var active = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Firstname + "\" class=\"fa fa-remove remove\">" +
                                   "<span class=\"tooltiptext\">Click to deactivate</span>" +
                               "</i>";
                var inactive = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Firstname + "\" class=\"fa fa-check-circle activate\">" +
                                   "<span class=\"tooltiptext\">Click to activate</span>" +
                               "</i>";

                var statusAction = isActive == "Not Activated" ? inactive : active;

                var html = "<tr>" +
                           "<td>" + item.ID + "</td>" +
                           "<td><img src='content/img/avatars/" + item.ImagePath + "'/></td>" +
                           "<td>" + item.Firstname + " " + item.Lastname + "</td>" +
                           "<td>" + item.Email + "</td>" +
                           "<td>" + item.Contact + "</td>" +
                           "<td>" + item.Role + "</td>" +
                           "<td>" + item.Position + "</td>" +
                           "<td>" + item.DateCreated + "</td>" +
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

$(document).on('click', '#save', function (e) {
    e.preventDefault();

    var image = "";

    if (isInputValid()) {
        $('.fa-spin').removeClass('hidden');

        if ($('#ContentPlaceHolder1_image').val() != "") {
            image = $('#ContentPlaceHolder1_image').val().split('\\')[$('#ContentPlaceHolder1_image').val().split('\\').length - 1]
        }

        (new http).post("accounts.aspx/insert", {
            firstname: $('#firstname').val(),
            lastname: $('#lastname').val(),
            email: $('#email').val(),
            password: $('#password').val(),
            contact: $('#contact').val(),
            gender: $('#gender').val(),
            role: $('#role').val(),
            image: image,
            position: $('#position').val()
        }).then(function (response) {

            if ($('#ContentPlaceHolder1_image').val() != "") {
                $('#ContentPlaceHolder1_saveImage').trigger('click');
            } else {
                swal('Successfully Saved!', 'User has been successfully saved.', 'success');
                get();
                $('.close').click();
                $('.fa-spin').addClass('hidden');
            }

        }).run();
    }

});

$(document).on('click', '.view', function () {
    id = $(this).data('id');

    (new http).post("accounts.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#firstname-view').val(item.Firstname);
        $('#lastname-view').val(item.Lastname);
        $('#email-view').val(item.Email);
        $('#contact-view').val(item.Contact);
        $('#gender-view').val(item.Gender).change();
        $('#role-view').val(item.RoleID).change();
        $('#position-view').val(item.Position);

        $('#viewModal .form-control').prop('disabled', true);
    }).run();
});

$(document).on('click', '.edit', function () {
    id = $(this).data('id');

    (new http).post("accounts.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#firstname-edit').val(item.Firstname);
        $('#lastname-edit').val(item.Lastname);
        $('#email-edit').val(item.Email);
        $('#contact-edit').val(item.Contact);
        $('#gender-edit').val(item.Gender).change();
        $('#role-edit').val(item.RoleID).change();
        $('#image-edit').text(item.ImagePath);
        $('#position-edit').val(item.Position);

    }).run();
});

$('#image-edit').click(function () {
    $('#ContentPlaceHolder1_modifyImage').trigger('click');
});

$('#ContentPlaceHolder1_modifyImage').change(function () {
    $('#image-edit').text($('#ContentPlaceHolder1_modifyImage').val().split('\\')[$('#ContentPlaceHolder1_modifyImage').val().split('\\').length - 1]);
});

$(document).on('click', '#saveChanges', function (e) {
    e.preventDefault();

    if (isInputEditValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("accounts.aspx/update", {
            id: id,
            firstname: $('#firstname-edit').val(),
            lastname: $('#lastname-edit').val(),
            email: $('#email-edit').val(),
            contact: $('#contact-edit').val(),
            gender: $('#gender-edit').val(),
            role: $('#role-edit').val(),
            image: $('#image-edit').text(),
            position: $('#position-edit').val()
        }).then(function (response) {

            if ($('#ContentPlaceHolder1_modifyImage').val() != "") {
                $('#ContentPlaceHolder1_saveChangeOnImage').click();
            } else {
                swal('Successfully Updated!', 'Item has been successfully updated.', 'success');
                get();
                $('.fa-spin').addClass('hidden');
                $('.close').click();
            }

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
            (new http).post("accounts.aspx/delete", {
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
    var a = $("#firstname").validate(['required']).displayErrorOn($("#error-firstname"));
    var b = $("#lastname").validate(['required']).displayErrorOn($("#error-lastname"));
    var c = $("#email").validate(['email']).displayErrorOn($("#error-email"));
    var d = $("#password").validate(['required']).displayErrorOn($("#error-password"));
    var e = $("#contact").validate(['required']).displayErrorOn($("#error-contact"));
    var f = $("#gender").validate(['required']).displayErrorOn($("#error-gender"));
    var g = $("#role").validate(['required']).displayErrorOn($("#error-role"));
    var h = $("#position").validate(['required']).displayErrorOn($("#error-position"));

    return a && b && c && d && e && f && g && h;
}

function isInputEditValid() {
    var a = $("#firstname-edit").validate(['required']).displayErrorOn($("#error-firstname-edit"));
    var b = $("#lastname-edit").validate(['required']).displayErrorOn($("#error-lastname-edit"));
    var c = $("#email-edit").validate(['email']).displayErrorOn($("#error-email-edit"));
    var e = $("#contact-edit").validate(['required']).displayErrorOn($("#error-contact-edit"));
    var f = $("#gender-edit").validate(['required']).displayErrorOn($("#error-gender-edit"));
    var g = $("#role-edit").validate(['required']).displayErrorOn($("#error-role-edit"));
    var h = $("#position-edit").validate(['required']).displayErrorOn($("#error-position-edit"));

    return a && b && c && e && f && g && h;
}