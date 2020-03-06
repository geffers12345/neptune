var id = 0;
var table;
var items = new Map();
var index = 1;
var total = 0;
var new_embarkID = 0;
var vesselID = 0;

$(document).ready(function () {
    get();
    embark_principals();
    disembarkations();
    airports();

    $('#code').val('00' + Math.floor(Math.random() * 12345) + '-E');
    $('#dis-code').val('00' + Math.floor(Math.random() * 12345) + '-D');
});

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

function get() {
    $('#embark-tbody').text('');

    $('#embark-tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("embarkations.aspx/get", {
    }).then(function (response) {

        var items = response.d.map(item => {

            return new Promise(function (resolve, reject) {

                var isActive = item.DateDeleted == "" ? "Activated" : "Not Activated";

                var active = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Vessel + "\" class=\"fa fa-remove remove\">" +
                                   "<span class=\"tooltiptext\">Click to deactivate</span>" +
                               "</i>";
                var inactive = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Vessel + "\" class=\"fa fa-check-circle activate\">" +
                                   "<span class=\"tooltiptext\">Click to activate</span>" +
                               "</i>";

                var statusAction = isActive == "Not Activated" ? inactive : active;

                var status = statuses(item.StatusID);

                var html = "<tr>" +
                           "<td>" + item.Code + "</td>" +
                           "<td>" + item.Principal + "</td>" +
                           "<td>" + item.Vessel + "</td>" +
                           "<td>" + item.DepartureDate + "</td>" +
                           "<td>" + item.DepartureAirport + "</td>" +
                           "<td>" + item.EmbarkationPort + "</td>" +
                           "<td>" + item.EmbarkationDate + "</td>" +
                           "<td>" + item.Duration + "</td>" +
                           "<td><a class='add-view-crew' data-vessel='" + item.VesselID + "' role='button' data-id='" + item.ID + "' data-toggle='modal'" +
                            "data-target='#list-modal'>Add/View Crews</a></td>" +
                           "<td>";
                html += "<i data-id='" + item.ID + "' class=\"fa fa-edit edit\" data-toggle='modal' data-target='#edit-embark-modal'>" +
                            "<span class=\"tooltiptext\">Click to edit</span>" +
                        "</i>" +
                        "<i data-id='" + item.ID + "' class=\"fa fa-remove delete\">" +
                            "<span class=\"tooltiptext\">Click to remove</span>" +
                        "</i></td>" +
                    "</tr>";

                if (item.EmbarkationDate != 0)
                $('#embark-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#embark-table').DataTable();
        });
    }).run();
}

function disembarkations() {
    $('#disembark-tbody').text('');

    $('#disembark-tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("embarkations.aspx/get", {
    }).then(function (response) {

        var items = response.d.map(item => {

            return new Promise(function (resolve, reject) {

                var isActive = item.DateDeleted == "" ? "Activated" : "Not Activated";

                var active = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Vessel + "\" class=\"fa fa-remove remove\">" +
                                   "<span class=\"tooltiptext\">Click to deactivate</span>" +
                               "</i>";
                var inactive = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Vessel + "\" class=\"fa fa-check-circle activate\">" +
                                   "<span class=\"tooltiptext\">Click to activate</span>" +
                               "</i>";

                var statusAction = isActive == "Not Activated" ? inactive : active;

                var status = statuses(item.StatusID);

                var html = "<tr>" +
                           "<td>" + item.Code.replace(/E/g, 'D') + "</td>" +
                           "<td>" + item.Principal + "</td>" +
                           "<td>" + item.Vessel + "</td>" +
                           "<td>" + item.ArrivalDate + "</td>" +
                           "<td>" + item.AirportArrival + "</td>" +
                           "<td>" + item.DisembarkationPort + "</td>" +
                           "<td>" + item.DisembarkationDate + "</td>" +
                           "<td><a class='add-view-crew' data-vessel='" + item.VesselID + "' role='button' data-id='" + item.ID + "' data-toggle='modal'" +
                            "data-target='#list-modal'>View all crew</a></td></tr>";

                $('#disembark-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#disembark-table').DataTable();
        });
    }).run();
}

function embarkation_crew_lists() {
    $('#lineups-tbody').text('');

    $('#lineups-tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("embarkations.aspx/embarkation_crews", {
        id: id
    }).then(function (response) {

        var items = response.d.map(item => {

            return new Promise(function (resolve, reject) {

                var isActive = item.DateDeleted == "" ? "Activated" : "Not Activated";

                var active = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Vessel + "\" class=\"fa fa-remove remove\">" +
                                   "<span class=\"tooltiptext\">Click to deactivate</span>" +
                               "</i>";
                var inactive = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Vessel + "\" class=\"fa fa-check-circle activate\">" +
                                   "<span class=\"tooltiptext\">Click to activate</span>" +
                               "</i>";

                var statusAction = isActive == "Not Activated" ? inactive : active;

                var status = statuses(item.StatusID);

                var html = "<tr>" +
                           "<td>" + item.ID + "</td>" +
                           "<td>" + item.Crew + "</td>" +
                           "<td>" + item.Rank + "</td>" +
                           "<td>" + item.Remarks + "</td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.Crew + "\" class=\"fa fa-trash remove-crew-embark\">" +
                           "<span class=\"tooltiptext\">Click to remove</span>" +
                                       "</i></td>" +
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

$(document).on('click', '.add-view-crew', function () {
    vesselID = $(this).data('vessel');
    var embarkID = $(this).data('id');

    id = embarkID;

    embark_ranks(vesselID);

    embarkation_crew_lists(embarkID);
});

$(document).on('click', '.edit', function () {
    var embarkID = $(this).data('id');

    id = embarkID;

    find(embarkID);
});

$(document).on('click', '.delete', function () {
    id = $(this).data('id');
    var name = $(this).data('name');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "Click Confirm to Delete!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Confirm!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("embarkations.aspx/deactivate", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Deactivated', 'Embarkation Has Been Deleted!', 'success');
                get();
            }).run();
        }
    })
});


$(document).on('click', '#save-embark', function (e) {
    e.preventDefault();

    if (hasValues()) {

        (new http).post('embarkations.aspx/insert', {
            code: $('#code').val(),
            principalID: $('#embark-principal').val(),
            vesselID: $('#embark-vessel').val(),
            departureDate: $('#departure-date').val(),
            departureAirport: $('#departure-airport').val(),
            embarkationPort: $('#embarkation-port').val(),
            embarkationDate: $('#embarkation-date').val(),
            arrivalDate: $('#arrival-date').val(),
            airportArrival: $('#arrival-airport').val(),
            disembarkationPort: $('#disembarkation-port').val(),
            disembarkationDate: $('#disembarkation-date').val(),
            remarks: $('#remarks').val(),
            duration: $('#duration').val(),
            point: $('#point').val()
        }).then(function (data) {

            swal('Successfully Saved!', 'Item Has Been Saved!', 'success');
            $('.fa-spin').addClass('hidden');
            $('.close').click();

            get();

        }).run();
    }
});

function hasValues() {
    var a = $("#embark-principal").validate(['required']).displayErrorOn($("#error-principal"));
    var b = $("#embark-vessel").validate(['required']).displayErrorOn($("#error-vessel"));

    var d = $("#departure-date").validate(['required']).displayErrorOn($("#error-departure-date"));
    var e = $("#departure-airport").validate(['required']).displayErrorOn($("#error-departure-airport"));
    var f = $("#embarkation-port").validate(['required']).displayErrorOn($("#error-embarkation"));
    var g = $("#embarkation-date").validate(['required']).displayErrorOn($("#error-embarkation-date"));
    var h = $("#disembarkation-port").validate(['required']).displayErrorOn($("#error-disembarkation"));
    var i = $("#disembarkation-date").validate(['required']).displayErrorOn($("#error-disembark-date"));
    var j = $("#duration").validate(['required']).displayErrorOn($("#error-duration"));

    return a && b && d && e && f && g && h && i && j;
}

function hasValuesEdit() {
    var a = $("#embark-principal-edit").validate(['required']).displayErrorOn($("#error-principal-edit"));
    var b = $("#embark-vessel-edit").validate(['required']).displayErrorOn($("#error-vessel-edit"));

    var d = $("#departure-date-edit").validate(['required']).displayErrorOn($("#error-departure-date-edit"));
    var e = $("#departure-airport-edit").validate(['required']).displayErrorOn($("#error-departure-airport-edit"));
    var f = $("#embarkation-port-edit").validate(['required']).displayErrorOn($("#error-embarkation-edit"));
    var g = $("#embarkation-date-edit").validate(['required']).displayErrorOn($("#error-embarkation-date-edit"));
    var h = $("#disembarkation-port-edit").validate(['required']).displayErrorOn($("#error-disembarkation-edit"));
    var i = $("#disembarkation-date-edit").validate(['required']).displayErrorOn($("#error-disembark-date-edit"));

    return a && b && d && e && f && g && h && i;
}

function hasDisValues() {
    var a = $("#embark-principal").validate(['required']).displayErrorOn($("#error-principal"));
    var b = $("#embark-vessel").validate(['required']).displayErrorOn($("#error-vessel"));
    var h = $("#disembarkation-port").validate(['required']).displayErrorOn($("#error-disembarkation"));
    var i = $("#disembarkation-date").validate(['required']).displayErrorOn($("#error-disembark-date"));

    return a && b && h && i;
}

function isCrewValid() {
    var a = $("#rank").validate(['required']).displayErrorOn($("#error-rank"));
    var b = $("#crew").validate(['required']).displayErrorOn($("#error-crew"));

    return a && b;
}

function embark_principals() {
    (new http).post("principals.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#embark-principal').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
            $('#embark-principal-edit').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
        });
    }).run();
}

function embark_vessels(principalID) {

    $('#embark-vessel').text('');

    $('#embark-vessel').append('<option value="">--SELECT VESSEL--</option>');

    (new http).post("_vessels.aspx/get_by_principal", {
        id: principalID
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#embark-vessel').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#embark-vessel-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function embark_ranks(vesselID) {

    $('#embark-rank, #crew-rank').text('');

    $('#embark-rank, #crew-rank').append('<option value="">--SELECT RANK--</option>');

    (new http).post("ranks.aspx/get_by_vessel", {
        id: vesselID
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#crew-rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#embark-rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

$('#embark-principal').change(function () {
    embark_vessels($(this).val());
});

$('#embark-vessel').change(function () {
    embark_ranks($(this).val());
});

$('#embark-rank').change(function () {
    embark_crew($(this).val());
});

$('#crew-rank').change(function () {
    embark_crew($(this).val());
});

function embark_crew(rankID) {

    $('#crew-primary, #crew-secondary, #crew').text('');

    $('#crew-primary, #crew-secondary, #crew').append('<option value="">--SELECT CREW--</option>');

    (new http).post("applicants.aspx/get_by_rank", {
        statusID: 7, //available
        rankID: $('#crew-rank').val()
    }).then(function (response) {

        var items = response.d.map(item => {
            $('#crew').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
            $('#crew-primary').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
            $('#crew-secondary').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
        });
    }).run();
}

function embarkationcrew(rankID) {

    $('#crew-primary, #crew-secondary, #crew').text('');

    $('#crew-primary, #crew-secondary, #crew').append('<option value="">--SELECT CREW--</option>');

    (new http).post("applicants.aspx/get_by_rank", {
        statusID: 7, //available
        rankID: parseInt(rankID)
    }).then(function (response) {

        var items = response.d.map(item => {
            $('#crew').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
            $('#crew-primary').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
            $('#crew-secondary').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
        });
    }).run();
}

function airports() {
    (new http).post("airports.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#crew-airport').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#disembarkation-port, #embarkation-port, #embarkation-port-edit, #disembarkation-port-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function find(embarkID) {

    (new http).post("embarkations.aspx/find", {
        id: embarkID
    }).then(function (response) {

        var item = response.d[0];

        embark_vessels(item.PrincipalID);
        embark_ranks(item.VesselID);

        setTimeout(function () {
            $('#embark-principal-edit').val(item.PrincipalID).change();
            $('#embark-vessel-edit').val(item.VesselID).change();
        }, 2000);


        $('#code-edit').val(item.Code);
        $('#departure-date-edit').val(item.DepartureDate);
        $('#departure-airport-edit').val(item.DepartureAirport);
        $('#embarkation-port-edit').val(item.EmbarkationPortID).change();
        $('#embarkation-date-edit').val(item.EmbarkationDate);
        $('#arrival-date-edit').val(item.ArrivalDate);
        $('#arrival-airport-edit').val(item.AirportArrival);
        $('#disembarkation-port-edit').val(item.DisembarkationPortID).change();
        $('#disembarkation-date-edit').val(item.DisembarkationDate);
        $('#remarks-edit').val(item.Remarks);
        $('#duration-edit').val(item.Duration);
        $('#point-edit').val(item.PointofHire);

        applicantID = item.CrewID;

    }).run();
}

$(document).on('click', '#save-embark-changes', function (e) {
    e.preventDefault();

    if (hasValuesEdit()) {

        (new http).post('embarkations.aspx/update', {
            id: id,
            code: $('#code-edit').val(),
            principalID: $('#embark-principal-edit').val(),
            vesselID: $('#embark-vessel-edit').val(),
            departureDate: $('#departure-date-edit').val(),
            departureAirport: $('#departure-airport-edit').val(),
            embarkationPort: $('#embarkation-port-edit').val(),
            embarkationDate: $('#embarkation-date-edit').val(),
            arrivalDate: $('#arrival-date-edit').val(),
            airportArrival: $('#arrival-airport-edit').val(),
            disembarkationPort: $('#disembarkation-port-edit').val(),
            disembarkationDate: $('#disembarkation-date-edit').val(),
            remarks: $('#remarks-edit').val(),
            duration: $('#duration-edit').val(),
            point: $('#point-edit').val()
        }).then(function (data) {

            swal('Successfully Updated!', 'Item Has Been Updated!', 'success');
            $('.fa-spin').addClass('hidden');
            $('.close').click();

            get();

        }).run();
    }
});

$(document).on('click', '.add-view-disembark', function () {
    new_embarkID = $(this).data('id');

    disembarkation(new_embarkID);
});

function disembarkation(embarkID) {

    (new http).post("embarkations.aspx/disembarkation", {
        id: embarkID
    }).then(function (response) {

        if (response.d.length == 0) {
            swal('Oops!', 'No Disembarkation Yet.', 'error');
        }

        $('#add-disembarkation-modal .form-control').val('');

        var item = response.d[0];

        $('#actual').val(item.ActualDisembarkation);
        $('#disembarkation-place').val(item.DisembarkationPlace);
        $('#arrival').val(item.ArrivalToManila);
        $('#home-leave').val(item.HomeLeave);
        $('#reason').val(item.Reason);
        $('#dis-remarks').val(item.DisRemarks);

    }).run();
}

$(document).on('click', '#save-crew', function (e) {
    e.preventDefault();

    if (hasCrewValues()) {

        var crew = $('#crew').val() != '' ? $('#crew').val() : 0;
        var primary = $('#crew-primary').val() != '' ? $('#crew-primary').val() : 0;
        var secondary = $('#crew-secondary').val() != '' ? $('#crew-secondary').val() : 0;

        (new http).post('embarkations.aspx/insert_crew', {
            embarkID: id,
            crewID: crew,
            status: $('#crew-status').val(),
            positionID: $('#crew-rank').val(),
            airportID: 0,
            engaged: 0,
            promotion: '',
            hire: 0,
            departure: '',
            filed: '',
            released: '',
            primary: primary,
            secondary: secondary,
            remarks: $('#crew-remarks').val(),
            arrival: ''
        }).then(function (data) {

            swal('Successfully Saved!', 'Crew Has Been Saved!', 'success');
            $('.fa-spin').addClass('hidden');
            $('.close').click();

            get();

        }).run();
    }
});

function hasCrewValues() {
    var a = $("#crew-status").validate(['required']).displayErrorOn($("#error-status-crew"));
    var b = $("#crew-rank").validate(['required']).displayErrorOn($("#error-rank-rank"));

    return a && b;
}

$(document).on('click', '#save-disembark', function (e) {
    e.preventDefault();

    if (hasDisValues()) {

        (new http).post('embarkations.aspx/insert', {
            code: $('#dis-code').val(),
            principalID: $('#embark-principal').val(),
            vesselID: $('#embark-vessel').val(),
            departureDate: '',
            departureAirport: '',
            embarkationPort: 0,
            embarkationDate: 0,
            arrivalDate: $('#arrival-date').val(),
            airportArrival: $('#arrival-airport').val(),
            disembarkationPort: $('#disembarkation-port').val(),
            disembarkationDate: $('#disembarkation-date').val(),
            remarks: $('#remarks').val()
        }).then(function (data) {

            swal('Successfully Saved!', 'Item Has Been Saved!', 'success');
            $('.fa-spin').addClass('hidden');
            $('.close').click();

            disembarkations();

        }).run();
    }
});

$(document).on('click', '.remove-crew-embark', function () {
    id = $(this).data('id');
    var name = $(this).data('name');

    swal({
        title: 'Are you sure you want to delete this crew?',
        text: "Click Delete to Confirm!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("embarkations.aspx/removeCrew", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Deleted', 'Crew Has Been Deleted!', 'success');
                setTimeout(function () { window.location.reload(); }, 2000);
            }).run();
        }
    })
});


$('#duration').keyup(function () {
    var dateSrt = new Date($('#embarkation-date').val());
    var currentDay = dateSrt.getDate();

    for (var i = 0; i <= parseInt($(this).val()) - 1; i++) {
        var currentMonth = dateSrt.getMonth();
        dateSrt.setMonth(currentMonth + 1, currentDay);

        if (dateSrt.getMonth() > currentMonth + 1) {
            dateSrt.setDate(0);
        }

        var txtDay = $.datepicker.formatDate('yy-mm-dd', dateSrt);
        
        $('#disembarkation-date').val(txtDay);
    }

});