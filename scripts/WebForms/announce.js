var id = 0;

$(document).ready(function () {
    $('#desc').richText();
    $('#descEdit').richText();
    get();
});

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"7\"><img src=\"Content/img/load1.gif\" /></td></tr>");

    (new http).post("announcements.aspx/get", {

    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {
                var isActive = item.DateDeleted == "" ? "Activated" : "Not Activated";

                var active = "<i data-id=\"" + item.AnnouncementID + "\" data-name=\"" + item.Announcement + "\" class=\"fa fa-remove remove\">" +
                    "<span class=\"tooltiptext\">Click to deactivate</span>" +
                    "</i>";
                var inactive = "<i data-id=\"" + item.AnnouncementID + "\" data-name=\"" + item.Announcement + "\" class=\"fa fa-check-circle activate\">" +
                    "<span class=\"tooltiptext\">Click to activate</span>" +
                    "</i>";

                var statusAction = isActive == "Not Activated" ? inactive : active;

                var html = "<tr>" +
                    "<td>" + item.Announcement + "</td>" +
                    "<td><a href=\"Content/attachments/" + item.Attachment + "\" target=\"_blank\">" + item.Attachment + "</a></td>" +
                    "<td>" + item.Firstname + " " + item.Lastname + "</td>" +
                    "<td>" + isActive + "</td>" +
                    "<td>" + item.DateCreated + "</td>" +
                    "<td>" + item.DateUpdated + "</td>" +
                    "<td>" +
                    "<i data-id=\"" + item.AnnouncementID + "\" class=\"fa fa-search view\" data-toggle='modal' data-target='#viewModal'> " +
                    "<span class=\"tooltiptext\">Click to view details</span>" +
                    "</i>";
                html += "<i data-id=\"" + item.AnnouncementID + "\" class=\"fa fa-edit edit\" data-toggle='modal' data-target='#editModal'>" +
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
            $('#myTable').DataTable();
            getActionPermissions(); //calling permissions
        });
    }).run();
}

$(document).on('click', '#save', function (e) {
    e.preventDefault();

    if (isInputValid()) {
        $('.fa-spin').removeClass('hidden');

        var attach = "";

        if ($('#ContentPlaceHolder1_attach').val() != '') {
            attach = $('#ContentPlaceHolder1_attach').val().split('\\')
            [$('#ContentPlaceHolder1_attach').val().split('\\').length - 1];
        }

        (new http).post("announcements.aspx/insert", {
            name: $('#name').val(),
            content: $('#desc').val(),
            attachment: attach
        }).then(function (response) {
            if ($('#ContentPlaceHolder1_attach').val() != '') {
                $('#ContentPlaceHolder1_saveAttach').trigger('click');
            } else {
                swal('Successfully Added!', 'Announcement has been successfully added.', 'success');
                get();
                $('.fa-spin').addClass('hidden');
                $('.close').click();
            }
        }).run();
    }

});

$(document).on('click', '.view', function () {
    id = $(this).data('id');

    (new http).post("announcements.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#nameView').val(item.Announcement);
        $('#descView').html(item.Content);
        $('#attachView').attr('href', 'Content/attachments/' + item.Attachment);


        if (item.Attachment != '') {
            $('#attachView').text(item.Attachment);
        } else {
            $('#attachView').text('No Attachment Found!');
        }

        $('#viewModal .form-control').prop('disabled', true);
    }).run();
});

$(document).on('click', '.edit', function () {
    id = $(this).data('id');

    (new http).post("announcements.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#nameEdit').val(item.Announcement);
        $('#descEdit').val(item.Content);
        $('#editModal .richText-editor').html(item.Content);
        $('#attachLabel').text(item.Attachment);
    }).run();
});

$(document).on('click', '#saveChanges', function (e) {
    e.preventDefault();

    if (isInputEditValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("announcements.aspx/update", {
            id: id,
            name: $('#nameEdit').val(),
            content: $('#descEdit').val(),
            attachment: $('#attachLabel').text()
        }).then(function (response) {

            if ($('#ContentPlaceHolder1_attachEdit').val() != '') {
                $('#ContentPlaceHolder1_saveAttachEdit').trigger('click');
            } else {
                swal('Successfully Updated!', 'Announcement has been successfully updated.', 'success');
                get();
                $('.fa-spin').addClass('hidden');
                $('.close').click();
            }
        }).run();
    }
});

$(document).on('click', '#attachLabel', function () {
    $('#ContentPlaceHolder1_attachEdit').trigger('click');
});

$(document).on('change', '#ContentPlaceHolder1_attachEdit', function () {
    $('#attachLabel').text($('#ContentPlaceHolder1_attachEdit').val().split('\\')
    [$('#ContentPlaceHolder1_attachEdit').val().split('\\').length - 1]);
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
            (new http).post("announcements.aspx/deactivate", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Deactivated', 'Announcement Has Been Deactivated!', 'success');
                setTimeout(function () { window.location.reload(); }, 3000);
            }).run();
        }
    })
});

$(document).on('click', '.activate', function () {
    id = $(this).data('id');
    var name = $(this).data('name');

    swal({
        title: 'Are you sure you want to activate ' + name + '?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Activate!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("announcements.aspx/activate", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Activated', 'Announcement Has Been Activated!', 'success');
                setTimeout(function () { window.location.reload(); }, 3000);
            }).run();
        }
    })
});

function isInputValid() {
    var isNameValid = $("#name").validate(['required']).displayErrorOn($("#errorName"));

    return isNameValid;
}

function isInputEditValid() {
    var isNameValid = $("#nameEdit").validate(['required']).displayErrorOn($("#errorNameEdit"));

    return isNameValid;
}