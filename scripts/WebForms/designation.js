var id = 0;
var items = [];

$(document).ready(function () {
    get();
});

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("designations.aspx/get", {

    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {
                var isActive = item.DateDeleted == "" ? "Activated" : "Not Activated";

                var active = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Rank + "\" class=\"fa fa-remove remove\">" +
                                   "<span class=\"tooltiptext\">Click to deactivate</span>" +
                               "</i>";
                var inactive = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Rank + "\" class=\"fa fa-check-circle activate\">" +
                                   "<span class=\"tooltiptext\">Click to activate</span>" +
                               "</i>";

                var statusAction = isActive == "Not Activated" ? inactive : active;

                var html = "<tr>" +
                           "<td>" + item.ID + "</td>" +
                           "<td>" + item.Rank + "</td>" +
                           "<td>" + item.Code + "</td>" +
                           "<td>" + item.DesignationType + "</td>" +
                           "<td>" + item.Order + "</td>" +
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

    if (isInputValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("designations.aspx/insert", {
            name: $('#name').val(),
            code: $('#code').val(),
            type: parseInt($('#type').val()),
            order: parseInt($('#order').val()),
            group: parseInt($('#group').val()),
            level: parseInt($('#level').val()),
            desc: $('#description').val(),
            stcw: $('#stcw').val(),
            regulation: $('#regulation').val(),
            capacity: $('#capacity').val()
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

    (new http).post("designations.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#code-view').val(item.Code);
        $('#name-view').val(item.Rank);
        $('#type-view').val(item.DesignationTypeID).change();
        $('#order-view').val(item.Order);
        $('#group-view').val(item.GroupID).change();
        $('#level-view').val(item.LevelID).change();
        $('#description-view').val(item.Description);
        $('#stcw-view').val(item.STCW);
        $('#regulation-view').val(item.Regulation);
        $('#capacity-view').val(item.Capacity);

        $('#viewModal .form-control').prop('disabled', true);
    }).run();
});

$(document).on('click', '.edit', function () {
    id = $(this).data('id');

    (new http).post("designations.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#code-edit').val(item.Code);
        $('#name-edit').val(item.Rank);
        $('#type-edit').val(item.DesignationTypeID).change();
        $('#order-edit').val(item.Order);
        $('#group-edit').val(item.GroupID).change();
        $('#level-edit').val(item.LevelID).change();
        $('#description-edit').val(item.Description);
        $('#stcw-edit').val(item.STCW);
        $('#regulation-edit').val(item.Regulation);
        $('#capacity-edit').val(item.Capacity);

    }).run();
});

$(document).on('click', '#saveChanges', function () {
    if (isInputEditValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("designations.aspx/update", {
            id: id,
            name: $('#name-edit').val(),
            code: $('#code-edit').val(),
            type: parseInt($('#type-edit').val()),
            order: parseInt($('#order-edit').val()),
            group: parseInt($('#group-edit').val()),
            level: parseInt($('#level-edit').val()),
            desc: $('#description-edit').val(),
            stcw: $('#stcw-edit').val(),
            regulation: $('#regulation-edit').val(),
            capacity: $('#capacity-edit').val()
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
            (new http).post("designations.aspx/delete", {
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
    var b = $("#code").validate(['required']).displayErrorOn($("#error-code"));
    var c = $("#name").validate(['required']).displayErrorOn($("#error-name"));
    var d = $("#order").validate(['required']).displayErrorOn($("#error-order"));

    return b && c && d;
}

function isInputEditValid() {
    var b = $("#code-edit").validate(['required']).displayErrorOn($("#error-code-edit"));
    var c = $("#name-edit").validate(['required']).displayErrorOn($("#error-name-edit"));
    var d = $("#order-edit").validate(['required']).displayErrorOn($("#error-order-edit"));

    return b && c && d;
}