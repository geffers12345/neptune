var id = 0;

$(document).ready(function () {
    $('#description').richText();
    $('#description-view').richText();
    $('#description-edit').richText();

    get();

    ranks();
    principals();
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

function principals() {
    (new http).post("principals.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#principal').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
            $('#principal-view').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
            $('#principal-edit').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
        });
    }).run();
}

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("openings.aspx/get", {

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

                var status = item.Status == 1 ? "Open" : "Close";

                var html = "<tr>" +
                           "<td>" + item.ID + "</td>" +
                           "<td>" + item.Rank + "</td>" +
                           "<td>" + item.Principal + "</td>" +
                           "<td>" + item.Slot + "</td>" +
                           "<td></td>" +
                           "<td>" + status + "</td>" +
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

        (new http).post("openings.aspx/insert", {
            rankID: $('#rank').val(),
            gender: $('#gender').val(),
            age: $('#age').val(),
            slot: $('#slot').val(),
            range: $('#range').val(),
            principalID: $('#principal').val(),
            status: $('#status').val(),
            description: $('#description').val()
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

    (new http).post("openings.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#rank-view').val(item.RankID).change();
        $('#gender-view').val(item.Gender).change();
        $('#age-view').val(item.MinimumAge);
        $('#slot-view').val(item.Slot);
        $('#range-view').val(item.SalaryRange);
        $('#principal-view').val(item.PrincipalID).change();
        $('#status-view').val(item.Status).change();
        $('#viewModal .richText-editor').html(item.Description);

        $('#viewModal .form-control').prop('disabled', true);
    }).run();
});

$(document).on('click', '.edit', function () {
    id = $(this).data('id');

    (new http).post("openings.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#rank-edit').val(item.RankID).change();
        $('#gender-edit').val(item.Gender).change();
        $('#age-edit').val(item.MinimumAge);
        $('#slot-edit').val(item.Slot);
        $('#range-edit').val(item.SalaryRange);
        $('#principal-edit').val(item.PrincipalID).change();
        $('#status-edit').val(item.Status).change();
        $('#editModal .richText-editor').html(item.Description);


    }).run();
});

$(document).on('click', '#saveChanges', function () {
    if (isInputEditValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("openings.aspx/update", {
            id: id,
            rankID: $('#rank-edit').val(),
            gender: $('#gender-edit').val(),
            age: $('#age-edit').val(),
            slot: $('#slot-edit').val(),
            range: $('#range-edit').val(),
            principalID: $('#principal-edit').val(),
            status: $('#status-edit').val(),
            description: $('#description-edit').val()
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
            (new http).post("openings.aspx/delete", {
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
    var a = $("#rank").validate(['required']).displayErrorOn($("#error-rank"));
    var b = $("#gender").validate(['required']).displayErrorOn($("#error-gender"));
    var c = $("#age").validate(['required']).displayErrorOn($("#error-age"));
    var d = $("#slot").validate(['required']).displayErrorOn($("#error-slot"));
    var e = $("#range").validate(['required']).displayErrorOn($("#error-range"));
    var f = $("#principal").validate(['required']).displayErrorOn($("#error-principal"));

    return a && b && c && d && e && f;
}

function isInputEditValid() {
    var a = $("#rank-edit").validate(['required']).displayErrorOn($("#error-rank-edit"));
    var b = $("#gender-edit").validate(['required']).displayErrorOn($("#error-gender-edit"));
    var c = $("#age-edit").validate(['required']).displayErrorOn($("#error-age-edit"));
    var d = $("#slot-edit").validate(['required']).displayErrorOn($("#error-slot-edit"));
    var e = $("#range-edit").validate(['required']).displayErrorOn($("#error-range-edit"));
    var f = $("#principal-edit").validate(['required']).displayErrorOn($("#error-principal-edit"));

    return a && b && c && d && e && f;
}