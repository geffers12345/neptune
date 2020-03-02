var id = 0;
var table;
var items = new Map();
var index = 1;
var total = 0;
var new_embarkID = 0;

$(document).ready(function () {
    embark_principals();
    airports();
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

function get(id) {
    $('#embark-tbody').text('');

    $('#embark-tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("embarkations.aspx/embarkation_crew_lists", {
        id: parseInt(id)
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
                               "<td>Ready to go</td>";

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

$(document).on('click', '.view', function () {
    var embarkID = $(this).data('id');

    var url = '/embark?_xkwhd=' + embarkID;

    $(window.location).attr('href', url);
});

$(document).on('click', '.edit', function () {
    var embarkID = $(this).data('id');

    var url = '/embark?_xkwhd=' + embarkID;

    $(window.location).attr('href', url);
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

        var primary = $('#primary').val() != '' ? $('#primary').val() : 0;
        var secondary = $('#secondary').val() != '' ? $('#secondary').val() : 0;

        (new http).post('embarkations.aspx/insert', {
            crewID: applicantID,
            status: parseInt($('#status-embark').val()),
            principalID: parseInt($('#embark-principal').val()),
            vesselID: $('#embark-vessel').val(),
            positionID: $('#embark-rank').val(),
            proposed: $('#proposed').val(),
            term: $('#term').val(),
            embark: $('#embarkation').val(),
            disembark: $('#disembarkation').val(),
            origin: $('#origin').val(),
            joining: $('#joining').val(),
            airportID: parseInt($('#airport').val()),
            etd: $('#etd').val(),
            engaged: $('#engage').val(),
            promotion: $('#promotion').val(),
            hire: $('#hire').val(),
            departure: $('#departure').val(),
            nbo: $('#nbo').val(),
            filed: $('#filed').val(),
            released: $('#released').val(),
            availability: $('#avail-from').val() + ' to ' + $('#avail-from').val(),
            primary: primary,
            secondary: secondary,
            remarks: $('#remarks').val(),
            arrival: $('#arrival-vessel').val()
        }).then(function (data) {

            swal('Successfully Saved!', 'Item Has Been Saved!', 'success');
            $('.fa-spin').addClass('hidden');
            $('.close').click();

            get(applicantID);

        }).run();
    }
});

function hasValues() {
    var a = $("#embark-principal").validate(['required']).displayErrorOn($("#error-principal"));
    var b = $("#embark-vessel").validate(['required']).displayErrorOn($("#error-vessel"));
    var c = $("#embark-rank").validate(['required']).displayErrorOn($("#error-rank"));

    var d = $("#term").validate(['required']).displayErrorOn($("#error-term"));
    var e = $("#embarkation").validate(['required']).displayErrorOn($("#error-embark"));
    var f = $("#disembarkation").validate(['required']).displayErrorOn($("#error-disembark"));
    var g = $("#origin").validate(['required']).displayErrorOn($("#error-origin"));
    var h = $("#joining").validate(['required']).displayErrorOn($("#error-joining"));
    var i = $("#joining").validate(['required']).displayErrorOn($("#error-joining"));
    var j = $("#joining").validate(['required']).displayErrorOn($("#error-joining"));
    var k = $("#status-embark").validate(['required']).displayErrorOn($("#error-status"));
    var l = $("#arrival-vessel").validate(['required']).displayErrorOn($("#error-arrival-vessel"));

    return a && b && c && d && e && f && g && h && i && j && k && l;
}

function hasDisembark() {
    var a = $("#actual").validate(['required']).displayErrorOn($("#error-actual"));
    var b = $("#disembarkation-place").validate(['required']).displayErrorOn($("#error-disembarkation-place"));
    var c = $("#arrival").validate(['required']).displayErrorOn($("#error-arrival"));
    var d = $("#home-leave").validate(['required']).displayErrorOn($("#error-home-leave"));

    return a && b && c && d;
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
        });
    }).run();
}

function embark_ranks(vesselID) {

    $('#embark-rank').text('');

    $('#embark-rank').append('<option value="">--SELECT RANK--</option>');

    (new http).post("ranks.aspx/get_by_vessel", {
        id: vesselID
    }).then(function (response) {
        var items = response.d.map(item => {
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

function embark_crew(rankID) {

    $('#primary, #secondary').text('');

    $('#primary, #secondary').append('<option value="">--SELECT CREW--</option>');

    (new http).post("applicants.aspx/get_by_rank", {
        statusID: 7, //available
        rankID: $('#embark-rank').val()
    }).then(function (response) {

        var items = response.d.map(item => {
            $('#primary').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
            $('#secondary').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
        });
    }).run();
}

function embarkationcrew(rankID) {

    $('#primary, #secondary').text('');

    $('#primary, #secondary').append('<option value="">--SELECT CREW--</option>');

    (new http).post("applicants.aspx/get_by_rank", {
        statusID: 7, //available
        rankID: parseInt(rankID)
    }).then(function (response) {

        var items = response.d.map(item => {
            $('#primary').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
            $('#secondary').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
        });
    }).run();
}

function airports() {
    (new http).post("airports.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#airport').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function find(embarkID) {

    (new http).post("embarkations.aspx/find", {
        id: embarkID
    }).then(function (response) {

        var item = response.d[0];

        applicant(item.CrewID);

        $('#status-embark').val(item.StatusID).change();

        embark_vessels(item.PrincipalID);
        embark_ranks(item.VesselID);
        embarkationcrew(item.PositionID);

        setTimeout(function () {
            
            $('#embark-principal').val(item.PrincipalID).change();
            $('#embark-vessel').val(item.VesselID).change();
            $('#embark-rank').val(item.PositionID).change();

            $('#primary').val(item.PrimaryReplacement).change();
            $('#secondary').val(item.SecondaryReplacement).change();
        }, 3000);


        $('#proposed').val(item.ProposedVessel);
        $('#term').val(item.ContractTerm);
        $('#embarkation').val(item.EmbarkationDate);
        $('#disembarkation').val(item.DisembarkationDate);
        $('#arrival-vessel').val(item.ArrivalVesselDate);
        $('#origin').val(item.PointOfOrigin);
        $('#joining').val(item.JoiningPort);
        $('#airport').val(item.AirportID).change();
        $('#etd').val(item.ETD);
        $('#engage').val(item.Engage);
        $('#promotion').val(item.PromotionDate);
        $('#hire').val(item.Hire).change();
        $('#departure').val(item.DepartureDate);
        $('#nbo').val(item.NBO);
        $('#filed').val(item.POEAContractFiled);
        $('#released').val(item.POEAReleased);
        $('#avail-from').val(item.AvailabilityDate.split(' to ')[0]);
        $('#avail-from').val(item.AvailabilityDate.split(' to ')[1]);

        $('#remarks').val(item.Remarks);

        applicantID = item.CrewID;
        
    }).run();
}

$(document).on('click', '#save-embark-changes', function (e) {
    e.preventDefault();

    if (hasValues()) {

        var primary = $('#primary').val() != '' ? $('#primary').val() : 0;
        var secondary = $('#secondary').val() != '' ? $('#secondary').val() : 0;

        (new http).post('embarkations.aspx/update', {
            id: embarkID,
            status: parseInt($('#status-embark').val()),
            principalID: parseInt($('#embark-principal').val()),
            vesselID: $('#embark-vessel').val(),
            positionID: $('#embark-rank').val(),
            proposed: $('#proposed').val(),
            term: $('#term').val(),
            embark: $('#embarkation').val(),
            disembark: $('#disembarkation').val(),
            origin: $('#origin').val(),
            joining: $('#joining').val(),
            airportID: parseInt($('#airport').val()),
            etd: $('#etd').val(),
            engaged: $('#engage').val(),
            promotion: $('#promotion').val(),
            hire: $('#hire').val(),
            departure: $('#departure').val(),
            nbo: $('#nbo').val(),
            filed: $('#filed').val(),
            released: $('#released').val(),
            availability: $('#avail-from').val() + ' to ' + $('#avail-from').val(),
            primary: primary,
            secondary: secondary,
            remarks: $('#remarks').val(),
            arrival: $('#arrival-vessel').val()
        }).then(function (data) {

            swal('Successfully Updated!', 'Item Has Been Updated!', 'success');
            $('.fa-spin').addClass('hidden');
            $('.close').click();

            get(applicantID);

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

        if(response.d.length == 0) {
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

$(document).on('click', '#save-embark', function (e) {
    e.preventDefault();

    if (hasDisembark()) {

        (new http).post('embarkations.aspx/insert_disembarkation', {
            embarkID: new_embarkID,
            actual: $('#actual').val(),
            place: $('#disembarkation-place').val(),
            arrival: $('#arrival').val(),
            home: $('#home-leave').val(),
            reason: $('#reason').val(),
            remarks: $('#dis-remarks').val()
        }).then(function (data) {

            swal('Successfully Saved!', 'Disembarkation Has Been Added!', 'success');
            $('.fa-spin').addClass('hidden');
            $('.close').click();

            get(applicantID);

        }).run();
    }
});