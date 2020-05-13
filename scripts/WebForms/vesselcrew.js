var id = 0;
var table;
var items = new Map();
var index = 1;
var total = 0;
var new_embarkID = 0;
var vesselID = 0;
var depart = "";
var disembark = "";
var html = "";

$(document).ready(function () {
    embark_principals();
});

function crewEmbark(crewID, vesselID, lastname, firstname, rank, vessel,
    passport, seaman, eregistration) {

    (new http).post("embarkations.aspx/crewEmbark", {
        crewID: crewID,
        vesselID: vesselID
    }).then(function (response) {

        depart = response.d[0].DepartureDate;
        disembark = response.d[0].DisembarkationDate;

        html += '<tr>' +
            '<td class=report>' + lastname + '</td>' +
            '<td class=report>' + firstname + '</td>' +
            '<td class=report><font face=arial style="font-size:smaller">' + rank + '</td>' +
            '<td class=report>' + vessel + '</td>' +
            '<td class=report><font face=arial style="font-size:smaller">' + passport + '</td>' +
            '<td class=report><font face=arial style="font-size:smaller">' + seaman + '</td>' +
            '<td class=report><font face=arial style="font-size:smaller">E-Reg#' + eregistration + '</td>' +
            '<td class=report><font face=arial style="font-size:smaller">' + depart + '</td>' +
            '<td class=report><font face=arial style="font-size:smaller">' + disembark + '</td>' +
            '</tr>';

        $('#tbody').append(html);
    }).run();
}

function statuses(value) {
    var status = "";

    switch (value) {
        case 1:
            status = "New Applicant";
            break;
        case 2:
            status = "On Board";
            break;
        case 3:
            status = "On Vacation";
            break;
        case 4:
            status = "On Training";
            break;
        case 5:
            status = "Old Crew/Resigned";
            break;
        case 6:
            status = "Rejected";
            break;
        case 7:
            status = "Available";
            break;
        default:
        // code block
    }

    return status;
}

function embark_principals() {
    (new http).post("principals.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#principal').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
        });
    }).run();
}

function embark_vessels(principalID) {

    $('#vessel').empty().append("<option value=''>--SELECT VESSEL--</option>");

    (new http).post("_vessels.aspx/get_by_principal", {
        id: principalID
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#vessel').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function embark_ranks(vesselID) {

    $('#rank').empty();

    (new http).post("ranks.aspx/get_by_vessel", {
        id: vesselID
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

$('#principal').change(function () {
    embark_vessels($(this).val());
});

$('#vessel').change(function () {
    embark_ranks($(this).val());
});

$('#create-report').click(function () {

    var url = '/reportvesselcrews?principal=' + $('#principal').val() + '&vessel=' + $('#vessel').val() +
        '&rank=' + $('#rank').val() + '&status=' + $('#status').val();

    $(window.location).attr('href', url);
});

$('#generateExcel').click(function () {

    get($('#principal').val(), $('#vessel').val(), $('#rank').val(), $('#status').val());

});

function get(principal, vessel, rank, stats) {
    $('#tbody').empty().append("<tr class=\"loading\"><td colspan=\"20\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("vessel-crews.aspx/vesselcrews", {
        principal: principal,
        vessel: vessel,
        rank: rank,
        status: stats
    }).then(function (response) {

        if (response.d.length == 0) {
            swal('Oops', 'No Data Found!', 'error');
        }

        response.d.map(item => {

            var html = "";
            //getting numbers

            var today = getManilaTime().split(',')[0];
            var d = today.split('/');

            var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
            var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

            var formattedDate = d[2] + '-' + d0 + '-' + d1;

            (new http).post("applicant.aspx/numbers", {
                id: item.ID,
                date: formattedDate
            }).then(function (response) {

                var items = response.d.map(n => {

                    return new Promise(function (resolve, reject) {

                        status = statuses(item.StatusID);

                        html += "<tr>" +
                            "<td><a href='/applicant?_hsdlwhx=" + item.ID + "'>" + item.Lastname + ', ' + item.Firstname + "</a></td>" +
                            "<td class='noExl'><img src='content/img/crews/" + item.ImagePath + "' class='img-responsive img-circle img-thumbnail'/></td>" +
                            "<td>" + item.Rank + "</td>" +
                            "<td>" + item.Cellphone + "</td>" +
                            "<td>" + item.Principal + "</td>" +
                            "<td>" + item.Vessel + "</td>";

                        html += "<td>" + n.Passport + "</td>" +
                            "<td>" + n.Seaman + "</td>" +
                            "<td>" + n.SRC + "</td>" +
                            "<td>" + n.Eregistration + "</td>" +
                            "<td>" + n.Age + "</td>" +
                            "<td>" + status + "</td>";

                        html += "<td>" + item.DateUpdated + "</td>" +
                            "<td class='noExl'>" +
                            "<a href='/applicant?_hsdlwhx=" + item.ID + "'><i data-id=\"" + item.ID + "\" class=\"fa fa-search view\"> " +
                            "<span class=\"tooltiptext\">Click to view details</span>" +
                            "</i></a>";
                        html += "<a href='/applicant?_hsdlwhx=" + item.ID + "'><i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\">" +
                            "<span class=\"tooltiptext\">Click to modify details</span>" +
                            "</i></a>";

                        html += "</td>" +
                            "</tr>";

                        $('#tbody').append(html);

                        resolve();
                    });
                });

                Promise.all(items).then(function () {
                    $('.loading').remove();
                    table = $('#table').DataTable();

                    var d = new Date();
                    var date = d.toString().split(" ").slice(0, 4).join(" ");

                    $("#table").table2excel({
                        filename: "Crews (" + date + ").xls",
                        exclude: ".noExl"
                    });
                });

            }).run();
        });
    }).run();
}

function getManilaTime() {
    var options = {
        timeZone: 'Asia/Manila',
        year: 'numeric', month: 'numeric', day: 'numeric',
        hour: 'numeric', minute: 'numeric', second: 'numeric',
    },

    formatter = new Intl.DateTimeFormat([], options);
    return formatter.format(new Date());
}


function report(principal, vessel, rank, stats) {
    $('#tbody').empty();

    (new http).post("vessel-crews.aspx/vesselcrews", {
        principal: principal,
        vessel: vessel,
        rank: rank,
        status: stats
    }).then(function (response) {

        response.d.map(item => {

            var today = getManilaTime().split(',')[0];
            var d = today.split('/');

            var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
            var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

            var formattedDate = d[2] + '-' + d0 + '-' + d1;

            (new http).post("applicant.aspx/numbers", {
                id: item.ID,
                date: formattedDate
            }).then(function (response) {

                var items = response.d.map(n => {

                    return new Promise(function (resolve, reject) {

                        crewEmbark(item.ID, item.VesselID, item.Lastname, item.Firstname, item.Rank, item.Vessel,
                        n.Passport, n.Seaman, n.Eregistration);

                        resolve();
                    });
                });

                Promise.all(items).then(function () {
                    $('.loading').remove();

                    var d = new Date();
                    var date = d.toString().split(" ").slice(0, 4).join(" ");
                });

            }).run();
        });
    }).run();
}