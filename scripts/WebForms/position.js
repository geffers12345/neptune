var id = 0;

$(document).ready(function () {
    get();
    ranks();
    depts();
    trainings();
});

function ranks() {
    (new http).post("ranks.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#rank-view').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#rank-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function depts() {
    (new http).post("departments.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#department').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#department-view').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#department-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function trainings() {
    $('#trainings').text('');

    (new http).post("seminars.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#trainings').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#trainings-view').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });

        $('#trainings').select2();
        $('#trainings-view').select2();
    }).run();
}

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("positions.aspx/get", {

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
                           "<td>" + item.Order + "</td>" +
                           "<td>" + item.Department + "</td>" +
                           "<td>" + item.Rank + "</td>" +
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

        (new http).post("positions.aspx/insert", {
            name: $('#name').val(),
            code: $('#code').val(),
            order: $('#order').val(),
            rankID: $('#rank').val(),
            deptID: $('#department').val()
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

    (new http).post("positions.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#name-view').val(item.Name);
        $('#code-view').val(item.Code);
        $('#order-view').val(item.Order);
        $('#department-view').val(item.DepartmentID).change();
        $('#rank-view').val(item.RankID).change();

        (new http).post("positions.aspx/trainings", {
            id: id
        }).then(function (response) {
            var item = response.d[0];

            $('#trainings-view').val(item).change();
        }).run();

        $('#viewModal .form-control').prop('disabled', true);
    }).run();
});

$(document).on('click', '.edit', function () {
    id = $(this).data('id');

    (new http).post("positions.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#name-edit').val(item.Name);
        $('#code-edit').val(item.Code);
        $('#order-edit').val(item.Order);
        $('#department-edit').val(item.DepartmentID).change();
        $('#rank-edit').val(item.RankID).change();

        (new http).post("positions.aspx/trainings", {
            id: id
        }).then(function (response) {
            var item = response.d[0];

            $('#trainings').val(item).change();
        }).run();

    }).run();
});

$(document).on('click', '#saveChanges', function () {
    if (isInputEditValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("positions.aspx/update", {
            id: id,
            name: $('#name-edit').val(),
            code: $('#code-edit').val(),
            order: $('#order-edit').val(),
            rankID: $('#rank-edit').val(),
            deptID: $('#department-edit').val()
        }).then(function (response) {

            (new http).post("positions.aspx/add_trainings", {
                id: id,
                trainings: $('#trainings').val()
            }).then(function (response) {
                swal('Successfully Updated!', 'Item has been successfully updated.', 'success');
                get();
                $('.fa-spin').addClass('hidden');
                $('.close').click();
            }).run();

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
            (new http).post("positions.aspx/delete", {
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
    var c = $("#order").validate(['required']).displayErrorOn($("#error-order"));
    var d = $("#department").validate(['required']).displayErrorOn($("#error-dept"));
    var e = $("#rank").validate(['required']).displayErrorOn($("#error-rank"));

    return a && b && c && d && e;
}

function isInputEditValid() {
    var a = $("#name-edit").validate(['required']).displayErrorOn($("#error-name-edit"));
    var b = $("#code-edit").validate(['required']).displayErrorOn($("#error-code-edit"));
    var c = $("#order-edit").validate(['required']).displayErrorOn($("#error-order-edit"));
    var d = $("#department-edit").validate(['required']).displayErrorOn($("#error-dept-edit"));
    var e = $("#rank-edit").validate(['required']).displayErrorOn($("#error-rank-edit"));

    return a && b && c && d && e;
}