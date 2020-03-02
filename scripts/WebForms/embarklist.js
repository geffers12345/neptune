var id = 0;
var table;

$(document).ready(function () {
    $('#id-number').val(Math.floor(Math.random() * 123123123));

    get();
    principals();
    users();
});

function users() {
    (new http).post("accounts.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#user').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
        });
    }).run();
}


function vessels(principalID) {

    $('#vessel').text('');

    (new http).post("_vessels.aspx/get_by_principal", {
        id: principalID
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#vessel').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}


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

$('#vessel').change(function () {
    ranks($(this).val());
});

$('#rank').change(function () {
    crew($(this).val());
});

function ranks(vesselID) {

    $('#rank').text('');

    $('#rank').append('<option value="">--SELECT CREW--</option>');

    (new http).post("ranks.aspx/get_by_vessel", {
        id: vesselID
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function crew(rankID) {

    $('#crew').text('');

    (new http).post("applicants.aspx/get_by_rank", {
        statusID: 7, //available
        rankID: $('#rank').val()
    }).then(function (response) {

        var items = response.d.map(item => {
            $('#crew').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
        });
    }).run();
}

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("joborders.aspx/get_approved", {}).then(function (response) {

        var items = response.d.map(item => {

            return new Promise(function (resolve, reject) {

                var p_status = item.PrincipalStatus == 0 ? '<button class="btn btn-warning send-jo" data-id="' + item.ID + '">Send' +
                                                    '<span class="tooltiptext">Click to send to principal</span></button>' : '<button class="btn btn-success">Sent</button>';

                var approve = item.Approved == 0 ? '<button class="btn btn-warning">Pending</button>' : '<button class="btn btn-success">Approved</button>';

                var status = item.Status == 0 ? 'Active' : 'Not Active';

                var html = "<tr>" +
                           "<td>" + item.Number + "</td>" +
                           "<td>" + item.Vessel + "</td>" +
                           "<td>" + item.Principal + "</td>" +
                           "<td><a class='view' role='button' data-toggle='modal' " +
                           "data-target='#list-modal' data-id='" + item.ID + "' data-vessel='" + item.VesselID + "'>View List</a></td>" +
                           "<td>" + item.DateCreated + "</td>" +
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

$(document).on('click', '.view', function () {
    var jID = $(this).data('id');
    var vID = $(this).data('vessel');

    lineups(jID, vID);
});


function lineups(joID, vesselID) {
    $('#lineups-tbody').text('');

    $('#lineups-tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("crew-planning.aspx/find", {
        joID: joID,
        vesselID: vesselID
    }).then(function (response) {

        var crews = [];

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Firstname + ' ' + item.Lastname + "</td>" +
                           "<td>" + item.EmbarkationDate + "</td>" +
                           "<td>" + item.DisembarkationDate + "</td>" +
                           "<td>" +
                                "<a href='/embarkations?_mbrckns=" + item.CrewID + "' target='_blank'>" +
                                    "<i class=\"fa fa-anchor view-embarkations\">" +
                                    "<span class=\"tooltiptext\">Click to change embarkations</span>" +
                                "</i></a></td>" +
                           "</tr>";

                $('#lineups-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#lineups-table').DataTable();
        });
    }).run();
}