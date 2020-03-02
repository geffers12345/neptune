var id = 0;
var items = new Map();
var index = 1;
var total = 0;

$(document).ready(function () {
    get();
    types();
    principals();
    unions();
    flags();
    routes();
    gears();
    ranks();

    multiple_select();
});

function multiple_select() {
    $('#enrolled').select2();
    $('#flags').select2();
    $('#owned').select2();
}

function types() {
    (new http).post("vessels.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#type').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#type-view').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#type-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
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

function unions() {
    (new http).post("unions.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#union').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#union-view').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#union-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function flags() {
    (new http).post("flags.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#flags').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#flags-view').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#flags-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function routes() {
    (new http).post("routes.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#route').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#route-view').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#route-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function gears() {
    (new http).post("gears.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#gear_type').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#gear_type-view').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#gear_type-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

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

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"15\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("_vessels.aspx/get", {

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
                           "<td>" + item.VesselType + "</td>" +
                           "<td>" + item.Principal + "</td>" +
                           "<td>" + item.ContactPerson + "</td>" +
                           "<td>" + item.Manager + "</td>" +
                           "<td>" + item.DateCreated + "</td>" +
                           "<td>" +
                               "<i data-id=\"" + item.ID + "\" class=\"fa fa-search view\"> " +
                                   "<span class=\"tooltiptext\">Click to view details</span>" +
                               "</i>";
                html += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\">" +
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

        (new http).post("_vessels.aspx/insert", {
            name: $('#name').val(),
            sign: $('#sign').val(),
            code: $('#code').val(),
            type: $('#type').val(),
            principal: $('#principal').val(),
            current: $('#current').val(),
            destination: $('#destination').val(),
            enrolled: $('#enrolled').val().join(', '),
            enroll_date: $('#enroll-date').val(),
            route: $('#route').val(),
            gear: $('#gear_type').val(),
            contract: $('#contract').val(),
            person: $('#person').val(),
            manager: $('#manager').val(),
            personnumber: $('#person-number').val()
        }).then(function (response) {

            var item_id = response.d;

            insert_union(item_id, $('#union').val(), $('#effective').val(), $('#expiry').val());

            insert_flag(item_id, $('#flags').val());

            swal('Successfully Added!', 'Vessel has been successfully added.', 'success');
            get();
            $('.fa-spin').addClass('hidden');
            $('.close').click();

            setTimeout(function () {
                $(window.location).attr('href', '/vessel?_kslvwmkdls=' + item_id);
            }, 2000);

        }).run();
    }

});

function insert_union(item_id, union, effective, expiry) {
     (new http).post("_vessels.aspx/insert_union", {
        vessel: item_id,
        union: union,
        effective: effective,
        expiry: expiry
    }).then(function (response) {

    }).run();
}

function insert_flag(item_id, flags) {

    (new http).post("_vessels.aspx/insert_flags", {
        vessel: item_id,
        flags: flags
    }).then(function (response) {

        (new http).post("_vessels.aspx/insert_specs", {
            vessel: item_id,
            port: $('#port').val(),
            built: $('#built').val(),
            owned: $('#owned').val().join(', '),
            owner: $('#owner').val(),
            exname: $('#ex-owner-name').val(),
            official: $('#official').val(),
            imo: $('#imo').val(),
            engine: $('#main-engine').val(),
            capacity: $('#capacity').val(),
            propulsion: $('#power').val(),
            grt: $('#gtr').val(),
            dwt: $('#dwt').val(),
            power: $('#out').val(),
            nrt: $('#nrt').val(),
            particular: $('#particulars').val(),
            exflag: $('#ex-flag').val()
        }).then(function (response) {

            items.forEach(function (item) {
                (new http).post('_vessels.aspx/insert_ranks', {
                    principalID: parseInt($('#principal').val()),
                    vessel: item_id,
                    rankID: item.rank,
                    bsactual: parseFloat(item.bsactual),
                    bspoea: parseFloat(item.bspoea),
                    otactual: parseFloat(item.otactual),
                    otpoea: parseFloat(item.otpoea),
                    bonusactual: parseFloat(item.bonusactual),
                    bonuspoea: parseFloat(item.bonuspoea),
                    leave: item.vacation,
                    currency: item.currency
                }).then(function (data) {

                }).run();
            });

        }).run();

    }).run();
}

$(document).on('click', '#add-row', function (e) {
    e.preventDefault();

    if (hasValues()) {

        $('#tbody-items').append('<tr>' +
                                '<td>' + $('#rank :selected').text() + '</td>' +
                                '<td>' + $('#currency').val() + '</td>' +
                                '<td>' + $('#bs-actual').val() + '</td>' +
                                '<td>' + $('#ot-actual').val() + '</td>' +
                                '<td><i data-id="' + index + '" class="fa fa-trash remove-item"></td>' +
                             '</tr>');

        items.set(index, {
            id: index,
            rank: $('#rank').val(),
            currency: $('#currency').val(),
            bsactual: $('#bs-actual').val(),
            bspoea: $('#bs-poea').val(),
            otactual: $('#ot-actual').val(),
            otpoea: $('#ot-poea').val(),
            bonusactual: $('#bonus-actual').val(),
            bonuspoea: $('#bonus-poea').val(),
            vacation: $('#vacation').val()
        });

        index++;

        $("#add-item-modal .form-control").val('');

        $('#add-item-modal .close').click();
    }
});

$(document).on('click', '.remove-item', function () {

    var id = $(this).data('id');

    $(this).closest('tr').remove();

    items.forEach(function (i) {

        if (id == i.id) {

            items.delete(id);
        }
    });
});

$(document).on('click', '.view', function () {
    id = $(this).data('id');

    var url = '/vessel?_kslvwmkdls=' + id;

    $(window.location).attr('href', url);
});

$(document).on('click', '.edit', function () {
    id = $(this).data('id');

    var url = '/vessel?_kslvwmkdls=' + id;

    $(window.location).attr('href', url);
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
            (new http).post("_vessels.aspx/delete", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Deactivated', 'Vessel Has Been Deactivated!', 'success');
                get();
            }).run();
        }
    })
});

function isInputValid() {
    var a = $("#name").validate(['required']).displayErrorOn($("#error-name"));
    var b = $("#sign").validate(['required']).displayErrorOn($("#error-sign"));
    var c = $("#code").validate(['required']).displayErrorOn($("#error-code"));
    var d = $("#type").validate(['required']).displayErrorOn($("#error-type"));
    var e = $("#principal").validate(['required']).displayErrorOn($("#error-principal"));
    var f = $("#current").validate(['required']).displayErrorOn($("#error-current"));
    var g = $("#destination").validate(['required']).displayErrorOn($("#error-destination"));
    var h = $("#enroll-date").validate(['required']).displayErrorOn($("#error-enroll-date"));
    var i = $("#union").validate(['required']).displayErrorOn($("#error-union"));
    var j = $("#effective").validate(['required']).displayErrorOn($("#error-effective"));
    var k = $("#expiry").validate(['required']).displayErrorOn($("#error-expiry"));
    var l = $("#flags").validate(['required']).displayErrorOn($("#error-flag"));
    var m = $("#port").validate(['required']).displayErrorOn($("#error-port"));
    var n = $("#owner").validate(['required']).displayErrorOn($("#error-owner"));

    return a && b && c && d && e && f && g && h && i && j && k && l && m && n;
}

function isInputEditValid() {
    var a = $("#name-edit").validate(['required']).displayErrorOn($("#error-name-edit"));

    return a;
}

function hasValues() {
    var a = $("#rank").validate(['required']).displayErrorOn($("#error-rank"));
    var b = $("#currency").validate(['required']).displayErrorOn($("#error-currency"));
    var c = $("#bs-actual").validate(['required']).displayErrorOn($("#error-bs-actual"));
    var d = $("#bs-poea").validate(['required']).displayErrorOn($("#error-bs-poea"));
    var e = $("#ot-actual").validate(['required']).displayErrorOn($("#error-ot-actual"));
    var f = $("#ot-poea").validate(['required']).displayErrorOn($("#error-ot-poea"));
    var g = $("#bonus-actual").validate(['required']).displayErrorOn($("#error-bonus-actual"));
    var h = $("#bonus-poea").validate(['required']).displayErrorOn($("#error-bonus-poea"));

    return a && b && c && d && e && f && g && h;
}