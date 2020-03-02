var id = 0;
var jobID = 0;
var rankID = 0;

$(document).ready(function () {
    get();
    ranks();
});

function ranks() {
    (new http).post("ranks.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#position').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#license-rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#flag-rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#work-rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

$(document).on('click', '#save', function (e) {
    e.preventDefault();

    if (isInputValid()) {
        $('.fa-spin').removeClass('hidden');

        var picture = "";

        if ($('#picture').val() != "") {
            picture = $('#picture').val().split('\\')[$('#picture').val().split('\\').length - 1];
        }

        (new http).post("careers.aspx/insert", {
            positionID: rankID,
            status: 1,
            lastname: $('#lastname').val(),
            firstname: $('#firstname').val(),
            middlename: $('#middlename').val(),
            email: $('#email').val(),
            password: $('#password').val(),
            picture: picture,
            address: $('#address').val(),
            contact: $('#contact').val(),
            no_bldg: $('#no-bldg').val(),
            street_brgy: $('#street-brgy').val(),
            city: $('#city').val(),
            province: $('#province').val(),
            zip: $('#zip').val(),
            telephone: $('#telephone').val(),
            country: $('#country').val(),
            cellphone: $('#cellphone').val(),
            birthdate: $('#birthdate').val(),
            birthplace: $('#birthplace').val(),
            civil: $('#civil-status').val(),
            sex: $('#sex').val(),
            height: $('#height').val() + $('#height-suffix').val(),
            weight: $('#weight').val() + $('#weight-suffix').val(),
            blood: $('#blood').val(),
            eye: $('#eye-color').val(),
            nationality: $('#nationality').val(),
            religion: $('#religion').val(),
            race: $('#race').val(),
            languages: $('#languages').val()
        }).then(function (response) {

            if ($('#picture').val() != "") {
                $('#save_picture').trigger('click');
            }

        }).run();
    }
});

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("openings.aspx/get", {

    }).then(function (response) {

        var items = response.d.map(item => {
            $("#jobs").append("<div class=\"col-sm-4 job\">" +
                          "<h3>" + item.Rank + "</h3>" +
                          "<p>Gender:  " + item.Gender + "</p>" +
                          "<p>Minimum Age:  " + item.MinimumAge + "</p>" +
                          "<p>Slot:  " + item.Slot + "</p>" +
                          "<p>Salary Range:  " + item.SalaryRange + "</p>" +
                          "<p style='height: 22px; overflow: auto;'>Job Descriptions: " + item.Description + "</p>" +
                          "<div class=\"pull-right\">" +
                          "<a href=\"#\" data-toggle=\"modal\" data-id=\"" + item.ID + "\" data-rank='" + item.RankID + "' id=\"add\" data-target=\"#addModal\">Apply Now!</a>" +
                          "</div>" +
                        "</div>");
        });
    }).run();
}

$(document).on('click', '#add', function () {
    rankID = $(this).data('rank');
});

function isInputValid() {
    var c = $("#lastname").validate(['required']).displayErrorOn($("#error-lastname"));
    var d = $("#firstname").validate(['required']).displayErrorOn($("#error-firstname"));
    var e = $("#address").validate(['required']).displayErrorOn($("#error-address"));
    var f = $("#email").validate(['email']).displayErrorOn($("#error-email"));
    var g = $("#password").validate(['required']).displayErrorOn($("#error-password"));
    var h = $("#picture").validate(['required']).displayErrorOn($("#error-picture"));

    return c && d && e && f && g && h;
}