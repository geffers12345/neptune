var id = 0;
var table;
var items = new Map();
var index = 1;
var total = 0;

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

    console.log($(this).val());
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

                var html = "<tr>" +
                           "<td>" + item.Vessel + "</td>" +
                           "<td>" + item.Principal + "</td>" +
                           "<td>" + item.VesselType + "</td>" +
                           "<td>" + item.CrewTypeID + "</td>" +
                           "<td>" + status + "</td>" +
                           "<td>" + item.DateCreated + "</td>" +
                           "<td>" +
                               "<button data-id='" + item.ID + "' data-vessel='" + item.VesselID + "' " +
                               "data-toggle='modal' data-target='#add-lineups-modal' class=\"btn btn-success manage\">Manage Planning " +
                                   "<span class=\"tooltiptext\">Click to manage planning</span>" +
                               "</button></td>" +
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

$(document).on('click', '.manage', function () {
    var jID = $(this).data('id');
    var vesselID = $(this).data('vessel');

    $(window.location).attr('href', '/crew-planning-gantt?_jsdofisokjs='+ jID +'&_yjsodiaewadasdc='+ vesselID +'');
});

$(document).on('click', '.view-documents', function () {
    var crewID = $(this).data('id');

    license(crewID);
    flag(crewID);
    travel(crewID);
    training_courses(crewID);
    libraries(crewID);
});

function license(applicantID) {
    $('#license-tbody').text('');

    $('#license-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/licenses", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.License + "</td>" +
                           "<td>" + item.Number + "</td>" +
                           "<td>" + item.DateIssue + "</td>" +
                           "<td>" + item.DateExpire + "</td>" +
                           "<td><a href='content/img/licenses/" + item.Attachment + "' target='_blank'>View File</a></td>" +
                           "</tr>";

                $('#license-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
        });
    }).run();
}

function flag(applicantID) {
    $('#flag-tbody').text('');

    $('#flag-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/flags", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Flag + "</td>" +
                           "<td>" + item.License + "</td>" +
                           "<td>" + item.DocumentNo + "</td>" +
                           "<td>" + item.Rank + "</td>" +
                           "<td>" + item.IssueDate + "</td>" +
                           "<td>" + item.ExpiryDate + "</td>" +
                           "<td><a href='content/attachments/flags/" + item.Attachment + "' target='_blank'>View File</a></td>" +
                           "</tr>";

                $('#flag-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
        });
    }).run();
}

function travel(applicantID) {
    $('#travel-tbody').text('');

    $('#travel-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/travels", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Document + "</td>" +
                           "<td>" + item.DocumentNo + "</td>" +
                           "<td>" + item.IssueDate + "</td>" +
                           "<td>" + item.ExpiryDate + "</td>" +
                           "<td>" + item.PlaceIssued + "</td>" +
                           "<td><a href='content/attachments/travels/" + item.Attachment + "' target='_blank'>View File</a></td>" +
                           "</tr>";

                $('#travel-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
        });
    }).run();
}

function training_courses(applicantID) {
    $('#cert-tbody').text('');

    $('#cert-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/trainings", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Training + "</td>" +
                           "<td>" + item.CertificateNo + "</td>" +
                           "<td>" + item.IssueDate + "</td>" +
                           "<td>" + item.ExpiryDate + "</td>" +
                           "<td>" + item.Center + "</td>" +
                           "<td>" + item.Place + "</td>" +
                           "<td>" + item.STCW + "</td>" +
                           "<td>" + item.Mlc + "</td>" +
                           "<td><a href='content/attachments/trainings/" + item.Attachment + "' target='_blank'>View File</a></td>" +
                           "</tr>";

                $('#cert-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
        });
    }).run();
}

function libraries(applicantID) {
    $('#library-tbody').text('');

    $('#library-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/libraries", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.DocumentName + "</td>" +
                           "<td><a href='content/attachments/libraries/" + item.Attachment + "' target='_blank'>View File</a></td>" +
                           "</tr>";

                $('#library-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
        });
    }).run();
}
