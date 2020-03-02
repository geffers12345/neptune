$(document).ready(function () {
    principals();
});

function principals() {
    (new http).post("principals.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#principal').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
        });
    }).run();
}


$('#principal').change(function () {
    vessels($(this).val());
});

function vessels(principalID) {

    $('#vessel').text('');

    $('#vessel').append('<option value="">--SELECT VESSEL--</option>');

    (new http).post("_vessels.aspx/get_by_principal", {
        id: principalID
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#vessel').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function get(principal, vessel) {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("incidents.aspx/find", {
        principal: principal,
        vessel: vessel
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
                           "<td>" + item.Principal + "</td>" +
                           "<td>" + item.Vessel + "</td>" +
                           "<td>" + item.Crew + "</td>" +
                           "<td>" + item.Remarks + "</td>" +
                           "<td>" + item.Name + "</td>" +
                           "<td>" + item.DateCreated + "</td></tr>";

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

$(document).on('click', '#view-report', function () {
    if (isInputValid()) {
        get($("#principal").val(), $("#vessel").val());
    }

});

function isInputValid() {
    var a = $("#principal").validate(['required']).displayErrorOn($("#error-principal"));
    var b = $("#vessel").validate(['required']).displayErrorOn($("#error-vessel"));

    return a && b;
}

$('#generateExcel').click(function (e) {
    e.preventDefault();

    var d = new Date();
    var date = d.toString().split(" ").slice(0, 4).join(" ");

    $("#table").table2excel({
        filename: "Incidents (" + date + ").xls",
        exclude: ".noExl"
    });
});