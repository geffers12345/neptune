var id = 0;
var items = [];
var action = "";
var sender_password = "";
var api_code = "";
var currentStatus = 0;
var currentVessel = 0;
var currentRank = 0;
var totalAlottee = 0;

$(document).ready(function () {
    ranks();
    senders();
    filter_ranks();
    hire_principals();
    find_required_travel_documents();
    find_required_training_documents();
    find_required_vaccines();
    incident_vessels();

    $("#password").val('CREW' + Math.floor(Math.random() * 123456789));
});

function filter_ranks() {
    (new http).post("ranks.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#filter-rank').append("<option value=\"rank-" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

$('#filter-rank').change(function () {

    if ($(this).val() != "") {
        $('#applicants .card').not('.' + $(this).val() + '').hide();
    } else {
        $('#applicants .card').show();
    }

});

function ranks() {
    (new http).post("ranks.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#position').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#license-rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#flag-rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#work-rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#eval-rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#incident-rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function all_vessels() {
    (new http).post("_vessels.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#eval-vessel').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
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
        case 8:
            status = "Pool";
            break;
        case 9:
            status = "Operation";
            break;
        case 10:
            status = "On Sick Leave";
            break;
        default:
            // code block
    }

    return status;
}

function get(statusID) {
    $('#applicants').append("<center><div class=\"loading\"><img src=\"content/img/overlay-loader.gif\" /></div></center>");

    (new http).post("applicants.aspx/get", {
        statusID: statusID
    }).then(function (response) {

        if(response.d.length == 0) {
            $('#applicants').append('<div class="col-md-12" style="background-color: #d5d5d5"><h3 class="text-danger">No Data Found!</h3></div>');
        }

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                $('#box-title').text(statuses(item.StatusID));

                status = statuses(item.StatusID);

                var html = '<div class="col-md-4 card rank-' + item.RankID + '">' +
                                '<img src="content/img/crews/' + item.ImagePath + '" class="img-circle img-thumbnail"/>' +
                                '<h3>' + item.Firstname + ' ' + item.Lastname + '</h3>' +
                                '<table>' +
                                    '<tr>' +
                                        '<td><i class="fa fa-anchor"></i></td>' +
                                        '<td>Applied For: ' + item.Rank + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td><i class="fa fa-envelope"></i></td>' +
                                        '<td>' + item.Email + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td><i class="fa fa-phone"></i></td>' +
                                        '<td>' + item.Cellphone + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td><i class="fa fa-globe"></i></td>' +
                                        '<td>' + item.Nationality + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td><i class="fa fa-file-o"></i></td>' +
                                        '<td>' + status + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td colspan="2">' +
                                            '<a href="/applicant?_hsdlwhx=' + item.ID + '" class="button">View Profile</a>' +
                                        '</td>' +
                                    '</tr>' +
                                '</table>' +
                            '</div>';

                $('#applicants').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
        });
    }).run();
}

$(document).on('click', '#save', function (e) {
    e.preventDefault();

    if (isInputValid()) {
        $('.fa-spin').removeClass('hidden');

        var picture = "";

        if ($('#ContentPlaceHolder1_picture').val() != "") {
            picture = $('#ContentPlaceHolder1_picture').val().split('\\')[$('#ContentPlaceHolder1_picture').val().split('\\').length - 1];
        }

        (new http).post("add_applicant.aspx/insert", {
            date: $('#date').val(),
            positionID: $('#position').val(),
            status: $('#status').val(),
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

            var rID = response.d;

            (new http).post("add_applicant.aspx/insert_kin", {
                crewID: rID,
                name: $('#kin-name').val(),
                relationship: $('#relationship').val(),
                contact: $('#kin-phone').val(),
                birthdate: $('#kin-bday').val(),
                hp: $('#kin-hp').val(),
                address: $('#kin-address').val()
            }).then(function (response) {

                (new http).post("add_applicant.aspx/insert_uniform", {
                    crewID: rID,
                    cover: '',
                    shoes: '',
                    polo: '',
                    blackpants: '',
                    jacket: '',
                    winterpants: '',
                    raincoat: ''
                }).then(function (response) {

                    (new http).post("add_applicant.aspx/insert_number", {
                        id: rID,
                        passport: $('#passport').val(),
                        seaman: $('#seamans').val(),
                        src: $('#src').val(),
                        ereg: $('#eregistration').val()
                    }).then(function (response) {

                        if ($('#ContentPlaceHolder1_picture').val() != "") {
                            $('#ContentPlaceHolder1_save_picture').trigger('click');
                        }

                    }).run();

                }).run();

            }).run();

        }).run();
    }
});

function isInputValid() {
    //var a = $("#date").validate(['required']).displayErrorOn($("#error-date"));
    var b = $("#position").validate(['required']).displayErrorOn($("#error-position"));
    var c = $("#lastname").validate(['required']).displayErrorOn($("#error-lname"));
    var d = $("#firstname").validate(['required']).displayErrorOn($("#error-fname"));
    var f = $("#email").validate(['email']).displayErrorOn($("#error-email"));
    var g = $("#birthdate").validate(['required']).displayErrorOn($("#error-birthdate"));
    //var h = $("#ContentPlaceHolder1_picture").validate(['required']).displayErrorOn($("#error-picture"));

    return b && c && d && f && g;
}

function isInputValidForUpdate() {
    var b = $("#position").validate(['required']).displayErrorOn($("#error-position"));
    var c = $("#lastname").validate(['required']).displayErrorOn($("#error-lastname"));
    var d = $("#firstname").validate(['required']).displayErrorOn($("#error-firstname"));
    var f = $("#email").validate(['email']).displayErrorOn($("#error-email"));

    return b && c && d && f;
}

function applicant(id) {
    (new http).post("applicants.aspx/applicant", {
        id: id
    }).then(function (response) {

        var item = response.d[0];

        var status = [1, 8, 9];

        if (!status.includes(item.StatusID)) {
            $('.accept-reject').remove();
            $('.box-title').text('Crew Information');
        } else {
            $('.crew-only').remove();
            $('.box-title').text('Applicant Information');
        }

        if(item.StatusID != 9) {
            $('#accept-reject').prop('disabled', true);
        }

        currentVessel = item.VesselID;
        currentRank = item.RankID;

        vessel_info(item.VesselID);

        crewGroup();

        $('#imageHere').attr('src', 'content/img/crews/' + item.ImagePath);
        $('#name').text(item.Lastname + ', ' + item.Firstname);
        $('#remark-name').val(item.Lastname + ', ' + item.Firstname);
        $('#incident-name').val(item.Lastname + ', ' + item.Firstname);
        $('#email-view').text(item.Email);
        $('#receiver').val(item.Email);
        $('#rank-view').text(item.Rank);
        $('#contact-view').text(item.Cellphone);
        $('#receiver-number').val(item.Cellphone);
        $('#status-view').text(statuses(item.StatusID));

        currentStatus = item.StatusID;

        $('#date').val(item.ApplicationDate);
        $('#position').val(item.RankID).change();
        $('#status').val(item.StatusID).change();
        $('#lastname').val(item.Lastname);
        $('#firstname').val(item.Firstname);
        $('#middlename').val(item.Middlename);
        $('#email').val(item.Email);
        $('#address').val(item.Address);
        $('#contact').val(item.Contact);
        $('#no-bldg').val(item.NoOrBldg);
        $('#street-brgy').val(item.StreetOrBrgy);
        $('#city').val(item.Municipality);
        $('#province').val(item.Province);
        $('#zip').val(item.ZipCode);
        $('#telephone').val(item.Telephone);
        $('#country').val(item.Domicile).change();
        $('#cellphone').val(item.Cellphone);
        $('#birthdate').val(item.Birthdate);
        $('#birthplace').val(item.Birthplace);
        $('#civil-status').val(item.CivilStatus).change();
        $('#sex').val(item.Sex);
        $('#height').val(item.Height);
        $('#weight').val(item.Weight);
        $('#blood').val(item.BloodType);
        $('#eye-color').val(item.EyeColor);
        $('#nationality').val(item.Nationality);
        $('#religion').val(item.Religion);
        $('#race').val(item.Race);
        $('#languages').val(item.Languages);

        $('#content .form-control').prop('disabled', true);

        numbers();

        kin(id);

        uniform(id);

        benefit(id);

        philhealth(id);

        family(id);

        children(id);

        beneficiary(id);

        education(id);

        license();

        flag();

        travel();

        training_courses();

        libraries();

        crew_medicals();

        crew_vaccines();

        crew_works();

        crew_exps();

        histories(id);

        evaluations();

        remarks();

        incidents();
        //all_timesheets();

        allotees();

        find_required_documents(item.VesselID);

    }).run();
}

function kin(id) {
    (new http).post("applicant.aspx/kin", {
        id: id
    }).then(function (response) {

        var item = response.d[0];

        $('#kin-name').val(item.Name);
        $('#relationship').val(item.Relationship);
        $('#kin-phone').val(item.Contact);
        $('#kin-bday').val(item.Birthdate);
        $('#kin-hp').val(item.HP);
        $('#kin-address').val(item.Address);

        $('#kin .form-control').prop('disabled', true);

    }).run();
}

function uniform(id) {
    (new http).post("applicant.aspx/uniform", {
        id: id
    }).then(function (response) {

        var item = response.d[0];

        $('#cover-all').val(item.CoverAll);
        $('#shoes').val(item.Shoes);
        $('#polo').val(item.Polo);
        $('#black-pants').val(item.BlackPants);
        $('#winter-jacket').val(item.WinterJacket);
        $('#winter-pants').val(item.WinterPants);
        $('#raincoat').val(item.Raincoat);

        $('#uniform .form-control').prop('disabled', true);

    }).run();
}

function benefit(id) {
    (new http).post("applicant.aspx/benefit", {
        id: id
    }).then(function (response) {

        var item = response.d[0];

        $('#sss').val(item.SSS);
        $('#philhealth').val(item.Philhealth);
        $('#pagibig').val(item.Pagibig);
        $('#psuno').val(item.PSUNo);
        $('#psudate').val(item.PSUDate);
        $('#nbino').val(item.NBINo);
        $('#nbidate').val(item.NBIValidity);

        $('#benefit .form-control').prop('disabled', true);

    }).run();
}

function philhealth(id) {
    (new http).post("applicant.aspx/philhealth", {
        id: id
    }).then(function (response) {

        var item = response.d[0];

        $('#member-type').val(item.MemberType);
        $('#net').val(item.NetIncome);
        $('#other-application').val(item.OtherApplication);
        $('#character-check').val(item.CharacterCheck);
        $('#recommended-by').val(item.RecommendedBy);
        $('#more-info').val(item.MoreInformation);

        $('#philhealth-info .form-control').prop('disabled', true);

    }).run();
}

function family(id) {
    (new http).post("applicant.aspx/family", {
        id: id
    }).then(function (response) {

        var item = response.d[0];

        $('#father').val(item.Father);
        $('#mother').val(item.Mother);
        $('#spouse').val(item.Spouse);
        $('#married-date').val(item.DateMarried);

        $('#father-occupation').val(item.FatherOccupation);
        $('#father-address').val(item.FatherAddress);
        $('#mother-occupation').val(item.MotherOccupation);
        $('#mother-address').val(item.MotherAddress);

        $('#spouse-occupation').val(item.SpouseOccupation);
        $('#spouse-address').val(item.SpouseAddress);
        $('#spouse-birthplace').val(item.SpousePlaceBirth);
        $('#spouse-bday').val(item.SpouseBirthDate);
        $('#spouse-phil').val(item.Philhealth);

        $('#father-bday').val(item.FatherBday);
        $('#mother-bday').val(item.MotherBday);

        var fatherBday = new Date(item.FatherBday);
        var motherBday = new Date(item.MotherBday);
        var spouseBday = new Date(item.SpouseBirthDate);

        var today = getManilaTime().split(',')[0];
        var d = today.split('/');

        var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
        var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

        var formattedDate = d[2] + '-' + d0 + '-' + d1;

        fBday = dateDiffInDays(fatherBday, new Date(formattedDate));
        mBday = dateDiffInDays(motherBday, new Date(formattedDate));
        sBday = dateDiffInDays(spouseBday, new Date(formattedDate));

        $('#fbday').val(parseInt(fBday / 365));
        $('#mbday').val(parseInt(mBday / 365));
        $('#sbday').val(parseInt(sBday / 365));

        $('#family .form-control').prop('disabled', true);

    }).run();
}

$('#edit-info').click(function () {
    $('#personal .form-control').prop('disabled', false);
});

$('#edit-kin').click(function () {
    $('#kin .form-control').prop('disabled', false);
});

$('#edit-uniform').click(function () {
    $('#uniform .form-control').prop('disabled', false);
});

$('#edit-benefit').click(function () {
    $('#benefit .form-control').prop('disabled', false);
});

$('#edit-phil').click(function () {
    $('#philhealth-info .form-control').prop('disabled', false);
});

$('#edit-family').click(function () {
    $('#family .form-control').prop('disabled', false);
});

$(document).on('click', '#save-changes-applicant', function (e) {
    e.preventDefault();

    if (isInputValidForUpdate()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("add_applicant.aspx/update", {
            id: applicantID,
            date: $('#date').val(),
            positionID: $('#position').val(),
            status: currentStatus,
            lastname: $('#lastname').val(),
            firstname: $('#firstname').val(),
            middlename: $('#middlename').val(),
            email: $('#email').val(),
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
            height: $('#height').val(),
            weight: $('#weight').val(),
            blood: $('#blood').val(),
            eye: $('#eye-color').val(),
            nationality: $('#nationality').val(),
            religion: $('#religion').val(),
            race: $('#race').val(),
            languages: $('#languages').val()
        }).then(function (response) {

            swal('Successfully Updated', 'Applicant has been updated successfully.', 'success');

            $('.fa-spin').addClass('hidden');

            (new http).post("add_applicant.aspx/insert_number", {
                id: applicantID,
                passport: $('#passport').val(),
                seaman: $('#seamans').val(),
                src: $('#src').val(),
                ereg: $('#eregistration').val()
            }).then(function (response) {
                $('#personal .form-control').prop('disabled', true);
            }).run();

        }).run();
    }
});

$(document).on('click', '#save-changes-applicant-portal', function (e) {
    e.preventDefault();

    if (isInputValidForUpdate()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("add_applicant.aspx/update", {
            id: applicantID,
            date: $('#date').val(),
            positionID: $('#position').val(),
            status: 1,
            lastname: $('#lastname').val(),
            firstname: $('#firstname').val(),
            middlename: $('#middlename').val(),
            email: $('#email').val(),
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
            height: $('#height').val(),
            weight: $('#weight').val(),
            blood: $('#blood').val(),
            eye: $('#eye-color').val(),
            nationality: $('#nationality').val(),
            religion: $('#religion').val(),
            race: $('#race').val(),
            languages: $('#languages').val()
        }).then(function (response) {

            swal('Successfully Updated', 'Applicant has been updated successfully.', 'success');

            $('.fa-spin').addClass('hidden');

        }).run();
    }
});

$(document).on('click', '#save-changes-kin', function () {
    (new http).post("add_applicant.aspx/update_kin", {
        crewID: applicantID,
        name: $('#kin-name').val(),
        relationship: $('#relationship').val(),
        contact: $('#kin-phone').val(),
        birthdate: $('#kin-bday').val(),
        hp: $('#kin-hp').val(),
        address: $('#kin-address').val()
    }).then(function (response) {

        swal('Successfully Updated', 'Information has been updated successfully.', 'success');

        $('.fa-spin').addClass('hidden');

        $('#kin .form-control').prop('disabled', true);

    }).run();
});

$(document).on('click', '#save-changes-uniform', function () {
    (new http).post("add_applicant.aspx/update_uniform", {
        crewID: applicantID,
        cover: $('#cover-all').val(),
        shoes: $('#shoes').val(),
        polo: $('#polo').val(),
        blackpants: $('#black-pants').val(),
        jacket: $('#winter-jacket').val(),
        winterpants: $('#winter-pants').val(),
        raincoat: $('#raincoat').val()
    }).then(function (response) {

        swal('Successfully Updated', 'Information has been updated successfully.', 'success');

        $('.fa-spin').addClass('hidden');

        $('#uniform .form-control').prop('disabled', true);

    }).run();
});

$(document).on('click', '#save-changes-benefits', function () {
    (new http).post("applicant.aspx/update_benefits", {
        crewID: applicantID,
        sss: $('#sss').val(),
        philhealth: $('#philhealth').val(),
        pagibig: $('#pagibig').val(),
        psuno: $('#psuno').val(),
        psudate: $('#psudate').val(),
        nbino: $('#nbino').val(),
        nbivalidity: $('#nbidate').val()
    }).then(function (response) {

        swal('Successfully Updated', 'Information has been updated successfully.', 'success');

        $('.fa-spin').addClass('hidden');

        $('#benefit .form-control').prop('disabled', true);

    }).run();
});

$(document).on('click', '#save-changes-philhealth', function () {
    (new http).post("applicant.aspx/update_philhealth", {
        crewID: applicantID,
        type: $('#member-type').val(),
        net: $('#net').val(),
        application: $('#other-application').val(),
        character: $('#character-check').val(),
        recommended: $('#recommended-by').val(),
        moreinfo: $('#more-info').val()
    }).then(function (response) {

        swal('Successfully Updated', 'Information has been updated successfully.', 'success');

        $('.fa-spin').addClass('hidden');

        $('#philhealth-info .form-control').prop('disabled', true);

    }).run();
});

$(document).on('click', '#save-changes-family', function () {
    (new http).post("applicant.aspx/update_family", {
        crewID: applicantID,
        father: $('#father').val(),
        mother: $('#mother').val(),
        spouse: $('#spouse').val(),
        married: $('#married-date').val(),
        f_occupation: $('#father-occupation').val(),
        f_address: $('#father-address').val(),
        m_occupation: $('#mother-occupation').val(),
        m_address: $('#mother-address').val(),
        s_occupation: $('#spouse-occupation').val(),
        s_address: $('#spouse-address').val(),
        s_birthplace: $('#spouse-birthplace').val(),
        s_bday: $('#spouse-bday').val(),
        s_philhealth: $('#spouse-phil').val(),
        fatherBday: $('#father-bday').val(),
        motherBday: $('#mother-bday').val()
    }).then(function (response) {

        swal('Successfully Updated', 'Information has been updated successfully.', 'success');

        $('.fa-spin').addClass('hidden');

        $('#family .form-control').prop('disabled', true);

    }).run();
});

$(document).on('click', '#save-child', function () {

    if (isChildValid()) {
        (new http).post("applicant.aspx/insert_child", {
            crewID: applicantID,
            name: $('#child-name').val(),
            address: $('#child-address').val(),
            bday: $('#child-bday').val(),
            gender: $('#child-gender').val()
        }).then(function (response) {

            swal('Successfully Added', 'Information has been added successfully.', 'success');

            $('.fa-spin').addClass('hidden');

            children(applicantID);

            $('#add-child-modal .close').click();

        }).run();
    }
});

$(document).on('click', '.remove-child', function () {

    var childID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_child", {
                id: childID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                children(applicantID);

            }).run();
        }
    })
});

function children(id) {
    $('#child-tbody').text('');

    $('#child-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/children", {
        id: id
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Name + "</td>" +
                           "<td>" + item.Sex + "</td>" +
                           "<td>" + item.Birthday + "</td>" +
                           "<td>" + get_age(item.Birthday) + "</td>" +
                           "<td>" + item.Address + "</td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.Name + "\" class=\"fa fa-trash remove-child\">" +
                                   "<span class=\"tooltiptext\">Click to delete</span>" +
                               "</i></td></tr>";

                $('#child-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#child-table').DataTable();
        });
    }).run();
}

function get_age(bday) {
    dob = new Date(bday);

    var today = new Date();

    var age = Math.floor((today - dob) / (365.25 * 24 * 60 * 60 * 1000));

    return age + ' yr/s old';
}

function isChildValid() {
    var b = $("#child-name").validate(['required']).displayErrorOn($("#error-child-name"));
    var c = $("#child-address").validate(['required']).displayErrorOn($("#error-child-address"));
    var d = $("#child-bday").validate(['required']).displayErrorOn($("#error-child-bday"));

    return b && c && d;
}

//start beneficiary

$(document).on('click', '#save-bfcry', function () {

    if (isBeneficiaryValid()) {

        var dependent = $('#dependent').prop('checked') == true ? 1 : 0;

        (new http).post("applicant.aspx/insert_beneficiary", {
            crewID: applicantID,
            name: $('#bfcry-name').val(),
            relationship: $('#bfcry-relation').val(),
            contact: $('#bfcry-contact').val(),
            address: $('#bfcry-address').val(),
            bday: $('#bfcry-bday').val(),
            bplace: $('#bfcry-bplace').val(),
            gender: $('#btcry-gender').val(),
            dependent: dependent
        }).then(function (response) {

            swal('Successfully Added', 'Information has been added successfully.', 'success');

            $('.fa-spin').addClass('hidden');

            beneficiary(applicantID);

            $('#add-beneficiary-modal .close').click();

        }).run();
    }
});

$(document).on('click', '.remove-beneficiary', function () {

    var benID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_beneficiary", {
                id: benID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                beneficiary(applicantID);

            }).run();
        }
    })
});

function beneficiary(id) {
    $('#beneficiary-tbody').text('');

    $('#beneficiary-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/beneficiary", {
        id: id
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Name + "</td>" +
                           "<td>" + item.Sex + "</td>" +
                           "<td>" + item.Birthday + "</td>" +
                           "<td>" + get_age(item.Birthday) + "</td>" +
                           "<td>" + item.Relationship + "</td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.Name + "\" class=\"fa fa-trash remove-beneficiary\">" +
                                   "<span class=\"tooltiptext\">Click to delete</span>" +
                               "</i></td></tr>";

                $('#beneficiary-tbody').append(html);

                $('#tanker-beneficiary').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
                $('#offshore-beneficiary').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");

                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#beneficiary-table').DataTable();
        });
    }).run();
}

function isBeneficiaryValid() {
    var b = $("#bfcry-name").validate(['required']).displayErrorOn($("#error-bfcry-name"));
    var c = $("#bfcry-relation").validate(['required']).displayErrorOn($("#error-bfcry-relation"));
    var d = $("#bfcry-contact").validate(['required']).displayErrorOn($("#error-bfcry-contact"));
    var e = $("#bfcry-bday").validate(['required']).displayErrorOn($("#error-bfcry-bday"));
    var f = $("#bfcry-bplace").validate(['required']).displayErrorOn($("#error-bfcry-bplace"));


    return b && c && d && e && f;
}

//end beneficiary

//education
$(document).on('click', '#save-educ', function () {

    if (isEducValid()) {
        (new http).post("applicant.aspx/insert_educ", {
            crewID: applicantID,
            course: $('#course').val(),
            school: $('#school').val(),
            attendance: $('#attendance').val()
        }).then(function (response) {

            swal('Successfully Added', 'Information has been added successfully.', 'success');

            $('.fa-spin').addClass('hidden');

            education(applicantID);

            $('#add-educ-modal .close').click();

        }).run();
    }
});

$(document).on('click', '.remove-educ', function () {

    var benID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_educ", {
                id: benID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                education(applicantID);

            }).run();
        }
    })
});

function education(id) {
    $('#educ-tbody').text('');

    $('#educ-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/education", {
        id: id
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Course + "</td>" +
                           "<td>" + item.School + "</td>" +
                           "<td>" + item.AttendanceDate + "</td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.Course + "\" class=\"fa fa-trash remove-educ\">" +
                                   "<span class=\"tooltiptext\">Click to delete</span>" +
                               "</i></td></tr>";

                $('#educ-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#educ-table').DataTable();
        });
    }).run();
}

function isEducValid() {
    var b = $("#course").validate(['required']).displayErrorOn($("#error-course"));
    var c = $("#school").validate(['required']).displayErrorOn($("#error-school"));
    var d = $("#attendance").validate(['required']).displayErrorOn($("#error-attendance"));


    return b && c && d;
}
//end education

//licenses
$(document).on('click', '#save-license', function (e) {
    e.preventDefault();

    if (isLicenseValid()) {
        (new http).post("applicant.aspx/insert_license", {
            crewID: applicantID,
            licenseID: $('#license').val(),
            number: $('#license-number').val(),
            rankID: $('#license-rank').val(),
            issue: $('#license-issue').val(),
            expiry: $('#license-expiry').val(),
            issuedby: $('#license-issuedby').val(),
            remarks: $('#license-remarks').val(),
            file: $('#ContentPlaceHolder1_LicenseFile').val().split('\\')[$('#ContentPlaceHolder1_LicenseFile').val().split('\\').length - 1]
        }).then(function (response) {

            if ($('#ContentPlaceHolder1_LicenseFile').val() != "") {
                $('#ContentPlaceHolder1_save_license').trigger('click');
            } else {
                swal('Successfully Added', 'Information has been added successfully.', 'success');

                $('.fa-spin').addClass('hidden');

                $('#add-license-modal .close').click();

                license();
            }

        }).run();
    }
});

function license() {
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
                           "<td>" + item.IssuedBy + "</td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.License + "\" class=\"fa fa-trash remove-license\">" +
                                   "<span class=\"tooltiptext\">Click to delete</span>" +
                               "</i></td></tr>";

                $('#license-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#license-table').DataTable();
        });
    }).run();
}

$(document).on('click', '.remove-license', function () {

    var licenseID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_license", {
                id: licenseID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                license(applicantID);

            }).run();
        }
    })
});

function isLicenseValid() {
    var b = $("#license-number").validate(['required']).displayErrorOn($("#error-license-number"));
    var c = $("#license-issue").validate(['required']).displayErrorOn($("#error-license-issue"));
    var d = $("#license-expiry").validate(['required']).displayErrorOn($("#error-license-expiry"));
    //var a = $("#ContentPlaceHolder1_LicenseFile").validate(['required']).displayErrorOn($("#error-license-file"));


    return b && c && d;
}
//end licenses


//flags
$(document).on('click', '#save-flag', function (e) {
    e.preventDefault();

    if (isFlagValid()) {
        (new http).post("applicant.aspx/insert_flag", {
            crewID: applicantID,
            flagID: $('#flag').val(),
            licenseID: $('#flag-license').val(),
            number: $('#flag-doc-number').val(),
            rankID: $('#flag-rank').val(),
            issue: $('#flag-issue').val(),
            expiry: $('#flag-expiry').val(),
            issuedby: $('#flag-issuedby').val(),
            remarks: $('#flag-remarks').val(),
            file: $('#ContentPlaceHolder1_FlagFile').val().split('\\')[$('#ContentPlaceHolder1_FlagFile').val().split('\\').length - 1]
        }).then(function (response) {

            if ($('#ContentPlaceHolder1_FlagFile').val() != "") {
                $('#ContentPlaceHolder1_save_flag').trigger('click');
            } else {
                swal('Successfully Added', 'Information has been added successfully.', 'success');

                $('.fa-spin').addClass('hidden');

                $('#add-flag-modal .close').click();

                flag();
            }

        }).run();
    }
});

function flag() {
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
                           "<td>" + item.IssuedBy + "</td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.Flag + "\" class=\"fa fa-trash remove-flag\">" +
                                   "<span class=\"tooltiptext\">Click to delete</span>" +
                               "</i></td></tr>";

                $('#flag-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#flag-table').DataTable();
        });
    }).run();
}

$(document).on('click', '.remove-flag', function () {

    var flagID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_flag", {
                id: flagID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                flag(applicantID);

            }).run();
        }
    })
});

function isFlagValid() {
    var a = $("#flag").validate(['required']).displayErrorOn($("#error-flag"));
    var b = $("#flag-license").validate(['required']).displayErrorOn($("#error-flag-license"));
    var c = $("#flag-doc-number").validate(['required']).displayErrorOn($("#error-flag-doc-number"));
    var d = $("#flag-issue").validate(['required']).displayErrorOn($("#error-flag-issue"));
    var e = $("#flag-expiry").validate(['required']).displayErrorOn($("#error-flag-expiry"));
    //var f = $("#ContentPlaceHolder1_FlagFile").validate(['required']).displayErrorOn($("#error-flag-file"));


    return a && b && c && d && e;
}
//end flags


//start travel
var traveItemID = 0;

$(document).on('click', '#save-travel', function (e) {
    e.preventDefault();

    if (isTravelValid()) {
        (new http).post("applicant.aspx/insert_travel", {
            crewID: applicantID,
            docID: $('#document').val(),
            number: $('#cert-number').val(),
            issue: $('#cert-issue').val(),
            expiry: $('#cert-expiry').val(),
            issuedby: $('#cert-issuedby').val(),
            place: $('#cert-place').val(),
            file: $('#ContentPlaceHolder1_TravelFile').val().split('\\')[$('#ContentPlaceHolder1_TravelFile').val().split('\\').length - 1]
        }).then(function (response) {

            if ($('#ContentPlaceHolder1_TravelFile').val() != "") {
                $('#ContentPlaceHolder1_save_travel').trigger('click');
            } else {
                swal('Successfully Added', 'Information has been added successfully.', 'success');

                $('.fa-spin').addClass('hidden');

                $('#add-travel-modal .close').click();

                travel();
            }

        }).run();
    }
});

$(document).on('click', '#save-travel-edit', function (e) {
    e.preventDefault();

    if (isTravelEditValid()) {
        (new http).post("applicant.aspx/update_travel", {
            traveItemID: traveItemID,
            docID: $('#document-edit').val(),
            number: $('#cert-number-edit').val(),
            issue: $('#cert-issue-edit').val(),
            expiry: $('#cert-expiry-edit').val(),
            issuedby: $('#cert-issuedby-edit').val(),
            place: $('#cert-place-edit').val(),
            file: $('#ContentPlaceHolder1_TravelFileEdit').val().split('\\')[$('#ContentPlaceHolder1_TravelFileEdit').val().split('\\').length - 1]
        }).then(function (response) {

            if ($('#ContentPlaceHolder1_TravelFileEdit').val() != "") {
                $('#ContentPlaceHolder1_save_travel_edit').trigger('click');
            } else {
                swal('Successfully Updated', 'Information has been updated successfully.', 'success');

                $('.fa-spin').addClass('hidden');

                $('#edit-travel-modal .close').click();

                travel();
            }

        }).run();
    }
});

function isTravelValid() {
    var a = $("#document").validate(['required']).displayErrorOn($("#error-document"));
    var b = $("#cert-number").validate(['required']).displayErrorOn($("#error-cert-number"));
    var c = $("#cert-issue").validate(['required']).displayErrorOn($("#error-cert-issue"));
    var d = $("#cert-expiry").validate(['required']).displayErrorOn($("#error-cert-expiry"));
    //var e = $("#ContentPlaceHolder1_TravelFile").validate(['required']).displayErrorOn($("#error-travel-file"));

    return a && b && c && d;
}

function isTravelEditValid() {
    var a = $("#document-edit").validate(['required']).displayErrorOn($("#error-document-edit"));
    var b = $("#cert-number-edit").validate(['required']).displayErrorOn($("#error-cert-number-edit"));
    var c = $("#cert-issue-edit").validate(['required']).displayErrorOn($("#error-cert-issue-edit"));
    var d = $("#cert-expiry-edit").validate(['required']).displayErrorOn($("#error-cert-expiry-edit"));
    //var e = $("#ContentPlaceHolder1_TravelFileEdit").validate(['required']).displayErrorOn($("#error-travel-file-edit"));

    return a && b && c && d;
}

function travel() {
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
                            "<td>" + item.IssuedBy + "</td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.Document + "\" class=\"fa fa-trash remove-travel\">" +
                                   "<span class=\"tooltiptext\">Click to delete</span>" +
                               "</i>" +
                            "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Document + "\" class=\"fa fa-edit edit-travel\" data-toggle='modal' data-target='#edit-travel-modal'>" +
                                   "<span class=\"tooltiptext\">Click to modify</span>" +
                               "</i>" +
                           "</td></tr>";

                $('#travel-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#travel-table').DataTable();
        });
    }).run();
}


$(document).on('click', '.remove-travel', function () {

    var itemID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_travel", {
                id: itemID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                travel(applicantID);

            }).run();
        }
    })
});

$(document).on('click', '.edit-travel', function () {

    var itemID = $(this).data('id');
    traveItemID = $(this).data('id');

    (new http).post("applicant.aspx/find_travels", {
        id: itemID
    }).then(function (response) {

        var items = response.d[0];

        $('#document-edit').val(items.DocumentID).change();
        $('#cert-number-edit').val(items.DocumentNo)
        $('#cert-issue-edit').val(items.IssueDate)
        $('#cert-expiry-edit').val(items.ExpiryDate)
        $('#cert-issuedby-edit').val(items.IssuedBy)
        $('#cert-place-edit').val(items.PlaceIssued)
        
    }).run();
});
//end travels


//start training
var trainingItemID = 0;

$(document).on('click', '#save-training', function (e) {
    e.preventDefault();

    if (isTrainingValid()) {

        var mlc = $('#mlc').is(':checked') ? 1 : 0;

        (new http).post("applicant.aspx/insert_training", {
            crewID: applicantID,
            seminarID: $('#training-course').val(),
            centerID: $('#center').val(),
            mlc: mlc,
            number: $('#training-number').val(),
            issue: $('#training-issue').val(),
            expiry: $('#training-expiry').val(),
            place: $('#training-place').val(),
            stcw: $('#training-code').val(),
            file: $('#ContentPlaceHolder1_TrainingFile').val().split('\\')[$('#ContentPlaceHolder1_TrainingFile').val().split('\\').length - 1],
            issuedby: $('#training-issuedby').val(),
        }).then(function (response) {

            if ($('#ContentPlaceHolder1_TrainingFile').val() != "") {
                $('#ContentPlaceHolder1_save_training').trigger('click');
            } else {
                swal('Successfully Added', 'Information has been added successfully.', 'success');

                $('.fa-spin').addClass('hidden');

                $('#add-cert-modal .close').click();

                training_courses();
            }

        }).run();
    }
});

$(document).on('click', '#save-training-changes', function (e) {
    e.preventDefault();

    if (isTrainingEditValid()) {

        var mlc = $('#mlc-edit').is(':checked') ? 1 : 0;

        (new http).post("applicant.aspx/update_training", {
            id: trainingItemID,
            crewID: applicantID,
            seminarID: $('#training-course-edit').val(),
            centerID: $('#center-edit').val(),
            mlc: mlc,
            number: $('#training-number-edit').val(),
            issue: $('#training-issue-edit').val(),
            expiry: $('#training-expiry-edit').val(),
            place: $('#training-place-edit').val(),
            stcw: $('#training-code-edit').val(),
            file: $('#ContentPlaceHolder1_TrainingFileEdit').val().split('\\')[$('#ContentPlaceHolder1_TrainingFileEdit').val().split('\\').length - 1],
            issuedby: $('#training-issuedby-edit').val(),
        }).then(function (response) {

            if ($('#ContentPlaceHolder1_TrainingFileEdit').val() != "") {
                $('#ContentPlaceHolder1_save_training_edit').trigger('click');
            } else {
                swal('Successfully Added', 'Information has been added successfully.', 'success');

                $('.fa-spin').addClass('hidden');

                $('#edit-cert-modal .close').click();

                training_courses();
            }

        }).run();
    }
});

function isTrainingValid() {
    var a = $("#training-number").validate(['required']).displayErrorOn($("#error-training-number"));
    var b = $("#training-issue").validate(['required']).displayErrorOn($("#error-training-issue"));
    //var c = $("#ContentPlaceHolder1_TrainingFile").validate(['required']).displayErrorOn($("#error-training-file"));
    var d = $("#training-expiry").validate(['required']).displayErrorOn($("#error-training-expiry"));

    return a && b && d;
}

function isTrainingEditValid() {
    var a = $("#training-number-edit").validate(['required']).displayErrorOn($("#error-training-number-edit"));
    var b = $("#training-issue-edit").validate(['required']).displayErrorOn($("#error-training-issue-edit"));
    //var c = $("#ContentPlaceHolder1_TrainingFileEdit").validate(['required']).displayErrorOn($("#error-training-file-edit"));
    var d = $("#training-expiry-edit").validate(['required']).displayErrorOn($("#error-training-expiry-edit"));

    return a && b && d;
}

function training_courses() {
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
                           "<td>" + item.IssuedBy + "</td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.Training + "\" class=\"fa fa-trash remove-training\">" +
                                   "<span class=\"tooltiptext\">Click to delete</span>" +
                               "</i>" +
                               "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Training + "\" class=\"fa fa-edit edit-training\" data-toggle='modal' data-target='#edit-cert-modal'>" +
                                   "<span class=\"tooltiptext\">Click to modify</span>" +
                               "</i>" +
                    "</td></tr>";

                $('#cert-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#cert-table').DataTable();
        });
    }).run();
}

$(document).on('click', '.remove-training', function () {

    var itemID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_training", {
                id: itemID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                training_courses(applicantID);

            }).run();
        }
    })
});

$(document).on('click', '.edit-training', function () {

    var itemID = $(this).data('id');
    trainingItemID = $(this).data('id');

    (new http).post("applicant.aspx/find_training", {
        id: itemID
    }).then(function (response) {

        var items = response.d[0];

        $('#training-course-edit').val(items.CourseID).change();
        $('#center-edit').val(items.InstitutionID).change();
        $('#training-number-edit').val(items.CertificateNo)
        $('#training-issue-edit').val(items.IssueDate)
        $('#training-expiry-edit').val(items.ExpiryDate)
        $('#training-place-edit').val(items.Place)
        $('#training-issuedby-edit').val(items.IssuedBy)
        $('#training-code-edit').val(items.STCW)

    }).run();
});
//end tranining


//start library

$(document).on('click', '#save-library', function (e) {
    e.preventDefault();

    if (isLibraryValid()) {

        (new http).post("applicant.aspx/insert_library", {
            crewID: applicantID,
            name: $('#library').val(),
            file: $('#ContentPlaceHolder1_LibraryFile').val().split('\\')[$('#ContentPlaceHolder1_LibraryFile').val().split('\\').length - 1]
        }).then(function (response) {

            if ($('#ContentPlaceHolder1_LibraryFile').val() != "") {
                $('#ContentPlaceHolder1_save_library').trigger('click');
            } else {
                swal('Successfully Added', 'Information has been added successfully.', 'success');

                $('.fa-spin').addClass('hidden');

                $('#add-library-modal .close').click();

                libraries();
            }

        }).run();
    }
});


function isLibraryValid() {
    var a = $("#library").validate(['required']).displayErrorOn($("#error-library"));
    //var b = $("#ContentPlaceHolder1_LibraryFile").validate(['required']).displayErrorOn($("#error-library-file"));

    return a;
}

function libraries() {
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
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.DocumentName + "\" class=\"fa fa-trash remove-library\">" +
                                   "<span class=\"tooltiptext\">Click to delete</span>" +
                               "</i></td></tr>";

                $('#library-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#library-table').DataTable();
        });
    }).run();
}

$(document).on('click', '.remove-library', function () {

    var itemID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_library", {
                id: itemID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                libraries(applicantID);

            }).run();
        }
    })
});

//end library


//start medicals
$(document).on('click', '#save-med', function (e) {
    e.preventDefault();

    if (isMedValid()) {
        (new http).post("applicant.aspx/insert_medical", {
            crewID: applicantID,
            medical: $('#medical').val(),
            clinic: $('#clinic').val(),
            number: $('#med-number').val(),
            issue: $('#med-issue').val(),
            expiry: $('#med-expiry').val(),
            file: $('#ContentPlaceHolder1_MedFile').val().split('\\')[$('#ContentPlaceHolder1_MedFile').val().split('\\').length - 1],
            remarks: $('#med-remarks').val()
        }).then(function (response) {

            if ($('#ContentPlaceHolder1_MedFile').val() != "") {
                $('#ContentPlaceHolder1_save_med').trigger('click');
            } else {
                swal('Successfully Added', 'Information has been added successfully.', 'success');

                $('.fa-spin').addClass('hidden');

                $('#add-med-modal .close').click();

                crew_medicals();
            }

        }).run();
    }
});

function isMedValid() {
    //var a = $("#med-number").validate(['required']).displayErrorOn($("#error-med-number"));
    var b = $("#med-issue").validate(['required']).displayErrorOn($("#error-med-issue"));
    //var c = $("#ContentPlaceHolder1_MedFile").validate(['required']).displayErrorOn($("#error-med-file"));
    var d = $("#med-expiry").validate(['required']).displayErrorOn($("#error-med-expiry"));

    return b && d;
}

function crew_medicals() {
    $('#med-tbody').text('');

    $('#med-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/medicals", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Medical + "</td>" +
                           "<td>" + item.Number + "</td>" +
                           "<td>" + item.IssueDate + "</td>" +
                           "<td>" + item.ExpiryDate + "</td>" +
                           "<td>" + item.Clinic + "</td>" +
                           "<td>" + item.Remarks + "</td>" +
                           "<td><a href='content/attachments/travels/" + item.Attachment + "' target='_blank'>View File</a></td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.Medical + "\" class=\"fa fa-trash remove-med\">" +
                                   "<span class=\"tooltiptext\">Click to delete</span>" +
                               "</i></td></tr>";

                $('#med-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#med-table').DataTable();
        });
    }).run();
}


$(document).on('click', '.remove-med', function () {

    var itemID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_medical", {
                id: itemID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                crew_medicals(applicantID);

            }).run();
        }
    })
});

//end med

//start vaccine
$(document).on('click', '#save-vaccine', function (e) {
    e.preventDefault();

    if (isVaccineValid()) {
        (new http).post("applicant.aspx/insert_vaccine", {
            crewID: applicantID,
            vaccine: $('#vaccine').val(),
            issue: $('#vaccine-issue').val(),
            expiry: $('#vaccine-expiry').val(),
            file: $('#ContentPlaceHolder1_VaccineFile').val().split('\\')[$('#ContentPlaceHolder1_VaccineFile').val().split('\\').length - 1]
        }).then(function (response) {

            if ($('#ContentPlaceHolder1_VaccineFile').val() != "") {
                $('#ContentPlaceHolder1_save_vaccine').trigger('click');
            } else {
                swal('Successfully Added', 'Information has been added successfully.', 'success');

                $('.fa-spin').addClass('hidden');

                $('#add-license-modal .close').click();

                crew_vaccines();
            }

        }).run();
    }
});

function isVaccineValid() {
    var b = $("#vaccine-issue").validate(['required']).displayErrorOn($("#error-vaccine-issue"));
    //var c = $("#ContentPlaceHolder1_VaccineFile").validate(['required']).displayErrorOn($("#error-vaccine-file"));
    //var d = $("#vaccine-expiry").validate(['required']).displayErrorOn($("#error-vaccine-expiry"));

    return b;
}

function crew_vaccines() {
    $('#vaccine-tbody').text('');

    $('#vaccine-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/vaccines", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Vaccine + "</td>" +
                           "<td>" + item.IssueDate + "</td>" +
                           //"<td>" + item.ExpiryDate + "</td>" +
                           "<td><a href='content/attachments/vaccines/" + item.Attachment + "' target='_blank'>View File</a></td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.Vaccine + "\" class=\"fa fa-trash remove-vaccine\">" +
                                   "<span class=\"tooltiptext\">Click to delete</span>" +
                               "</i>" +
                             "<i data-id=\"" + item.VaccineID + "\" data-name=\"" + item.Vaccine + "\" " +
                                "class=\"fa fa-edit edit-vaccine\" data-toggle='modal' data-target='#add-vaccine-modal'>" +
                                "<span class=\"tooltiptext\">Click to edit</span>" +
                            "</i></td></tr>";

                $('#vaccine-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#vaccine-table').DataTable();
        });
    }).run();
}

$(document).on('click', '.edit-vaccine', function () {

    var itemID = $(this).data('id');

    $('#vaccine').val(itemID).change();

    $('#vaccine').prop('disabled', true);
});

$(document).on('click', '.remove-vaccine', function () {

    var itemID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_vaccine", {
                id: itemID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                crew_vaccines(applicantID);

            }).run();
        }
    })
});


//start work
$(document).on('click', '#save-work', function (e) {
    e.preventDefault();

    if (isWorkValid()) {
        (new http).post("applicant.aspx/insert_work", {
            crewID: applicantID,
            rank: $('#work-rank').val(),
            vessel: $('#work-vessel').val(),
            type: $('#work-vessel-type').val(),
            start: $('#work-start').val(),
            end: $('#work-end').val(),
            manning: $('#work-manning').val()
        }).then(function (response) {

            swal('Successfully Added', 'Information has been added successfully.', 'success');

            $('.fa-spin').addClass('hidden');

            crew_works();

            $('#add-work-modal .close').click();

        }).run();
    }
});

function isWorkValid() {
    var b = $("#work-vessel").validate(['required']).displayErrorOn($("#error-work-vessel"));
    var c = $("#work-start").validate(['required']).displayErrorOn($("#error-work-start"));
    var d = $("#work-end").validate(['required']).displayErrorOn($("#error-work-end"));

    return b && c && d;
}


function crew_works() {
    $('#work-tbody').text('');

    $('#work-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/works", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Rank + "</td>" +
                           "<td>" + item.VesselName + "</td>" +
                           "<td>" + item.VesselType + "</td>" +
                           "<td>" + item.StartDate + "</td>" +
                           "<td>" + item.EndDate + "</td>" +
                           "<td>" + item.Manning + "</td>" +
                           "<td>" + item.MonthDiff + "</td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.Rank + "\" class=\"fa fa-trash remove-work\">" +
                                   "<span class=\"tooltiptext\">Click to delete</span>" +
                               "</i></td></tr>";

                $('#work-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#work-table').DataTable();
        });
    }).run();
}


$(document).on('click', '.remove-work', function () {

    var itemID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_work", {
                id: itemID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                crew_works();

            }).run();
        }
    })
});


$(document).on('click', '#accept-crew', function () {

    swal({
        title: 'Are you sure you want to hire ' + $('#name').text() + '?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Hire!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/hire", {
                crewID: applicantID,
                statusID: 7,
                vesselID: parseInt($('#vessel').val())
            }).then(function (response) {

                (new http).post("applicant.aspx/crewGroup", {
                    crewID: applicantID,
                    groupID: parseInt($('#group').val())
                }).then(function (response) {

                    swal('Successfully Saved', 'Applicant has been hired.', 'success');

                    $('.fa-spin').addClass('hidden');

                    $('#add-approve-modal .close').click();

                    setTimeout(function () {
                        window.location.reload();
                    }, 2000);

                }).run();

            }).run();
        }
    })
});

function crewGroup() {
    (new http).post("applicant.aspx/findCrewGroup", {
        crewID: applicantID
    }).then(function (response) {

        $('#group-view').text(response.d);

    }).run();
}

$(document).on('click', '#change-principal-vessel', function () {

    swal({
        title: 'Are you sure you want to update this information?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Update!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/changePrincipal", {
                crewID: applicantID,
                statusID: currentStatus,
                vesselID: parseInt($('#change-vessel').val())
            }).then(function (response) {

                (new http).post("applicant.aspx/crewGroup", {
                    crewID: applicantID,
                    groupID: parseInt($('#group-edit').val())
                }).then(function (response) {

                    swal('Successfully Saved', 'Data has been updated.', 'success');

                    $('.fa-spin').addClass('hidden');

                    $('#change-principal-modal .close').click();

                    setTimeout(function () {
                        window.location.reload();
                    }, 2000);

                }).run();

            }).run();
        }
    })
});

$(document).on('click', '#change-crew-status', function () {

    swal({
        title: 'Are you sure you want to change ' + $('#name').text() + ' status?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'red',
        cancelButtonColor: 'green',
        confirmButtonText: 'Change'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/hire", {
                crewID: applicantID,
                statusID: parseInt($('#crew-new-status').val()),
                vesselID: 0
            }).then(function (response) {

                swal('Successfully Changed', 'Applicants status has been updated.', 'success');

                setTimeout(function () { window.location.reload() }, 2000);

            }).run();
        }
    })
});

$(document).on('click', '#resigned', function () {

    swal({
        title: 'Are you sure you want to change ' + $('#name').text() + ' status?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'red',
        cancelButtonColor: 'green',
        confirmButtonText: 'Resigned'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/hire", {
                crewID: applicantID,
                statusID: 5, //resigned
                vesselID: currentVessel
            }).then(function (response) {

                swal('Successfully Changed', 'Applicants status has been updated.', 'success');

                setTimeout(function () { window.location.reload() }, 2000);

            }).run();
        }
    })
});

$(document).on('click', '#sickleave', function () {

    swal({
        title: 'Are you sure you want to change ' + $('#name').text() + ' status to sick leave?',
        text: "Crew status will be changed to sick leave.",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'red',
        cancelButtonColor: 'green',
        confirmButtonText: 'Move to Sick Leave'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/hire", {
                crewID: applicantID,
                statusID: 10, //sick leave
                vesselID: currentVessel
            }).then(function (response) {

                swal('Successfully Changed', 'Applicants status has been updated.', 'success');

                setTimeout(function () { window.location.reload() }, 2000);

            }).run();
        }
    })
});

$(document).on('click', '#training', function () {

    if (isOnTrainingValid()) {
        (new http).post("applicant.aspx/hire", {
            crewID: applicantID,
            statusID: 4, //on training
            vesselID: currentVessel
        }).then(function (response) {

            swal('Successfully Changed', 'Applicants status has been updated.', 'success');

            setTimeout(function () { window.location.reload() }, 2000);

        }).run();
    }
});

function isOnTrainingValid() {
    var a = $("#seminars").validate(['required']).displayErrorOn($("#error-train-seminar"));
    var b = $("#centers").validate(['required']).displayErrorOn($("#error-train-center"));
    var c = $("#training-start").validate(['required']).displayErrorOn($("#error-train-start"));
    var d = $("#training-end").validate(['required']).displayErrorOn($("#error-train-end"));

    return a && b && c && d;
}

$(document).on('click', '#send-crew', function () {
    (new http).post("applicant.aspx/send", {
        crewID: applicantID,
        principalID: $('#principal').val(),
        remarks: $('#principal-remarks').val()
    }).then(function (response) {

        swal('Successfully Sent', 'Applicant has been sent to principal.', 'success');

        $('.fa-spin').addClass('hidden');

        $('#add-send-modal .close').click();

    }).run();
});

function senders() {
    (new http).post("senders.aspx/get", {
    }).then(function (response) {
        var item = response.d[0];

        $('#sender').val(item.Email);
        sender_password = item.Password;
        api_code = item.Itxtmo;

    }).run();
}

$(document).on('click', '#send-email', function () {

    $('#send-email').prop('disabled', true);
    $('#send-email').text('Sending..');

    (new http).post("senders.aspx/send", {
        id: applicantID,
        email: $('#receiver').val(),
        subject: $('#subject').val(),
        message: $('#email-content').val(),
        sender: $('#sender').val(),
        sender_password: sender_password
    }).then(function (response) {

        swal('Successfully Sent', 'Message has been sent.', 'success');

        $('.fa-spin').addClass('hidden');

        $('#send-email-modal .close').click();

        $('#send-email').prop('disabled', false);
        $('#send-email').text('Send Email');

    }).run();
});

$(document).on('click', '#send-text', function () {

    $('#send-text').prop('disabled', true);
    $('#send-text').text('Sending..');

    (new http).post("senders.aspx/send_text", {
        id: applicantID,
        number: $('#receiver-number').val(),
        message: $('#text-content').val(),
        API_CODE: api_code
    }).then(function (response) {

        swal('Successfully Sent', 'Message has been sent.', 'success');

        $('.fa-spin').addClass('hidden');

        $('#send-text-modal .close').click();

        $('#send-text').prop('disabled', false);
        $('#send-text').text('Send Email');

    }).run();
});

function histories(id) {
    $('#app-history-tbody').text('');

    $('#app-history-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/histories", {
        id: id
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.DateCreated + "</td>" +
                           "<td>" + item.Event + "</td>" +
                           "<td>" + item.User + "</td></tr>";

                $('#app-history-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#app-history-table').DataTable();
        });
    }).run();
}

//start exp
$(document).on('click', '#save-exp', function (e) {
    e.preventDefault();

    if (isExpValid()) {
        (new http).post("applicant.aspx/insert_exp", {
            crewID: applicantID,
            rank: $('#exp-rank').val(),
            vessel: $('#exp-vessel').val(),
            type: $('#exp-vessel-type').val(),
            start: $('#exp-start').val(),
            end: $('#exp-end').val(),
            reason: $('#exp-reason').val(),
            manning: $('#exp-manning').val()
        }).then(function (response) {

            swal('Successfully Added', 'Information has been added successfully.', 'success');

            $('.fa-spin').addClass('hidden');

            crew_exps();

            $('#add-exp-modal .close').click();

        }).run();
    }
});

function isExpValid() {
    var a = $("#exp-rank").validate(['required']).displayErrorOn($("#error-exp-rank"));
    var b = $("#exp-vessel").validate(['required']).displayErrorOn($("#error-exp-vessel"));
    var c = $("#exp-start").validate(['required']).displayErrorOn($("#error-exp-start"));
    var d = $("#exp-end").validate(['required']).displayErrorOn($("#error-exp-end"));

    return b && c && d && a;
}

function crew_exps() {
    $('#exp-tbody').text('');

    $('#exp-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/exps", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Rank + "</td>" +
                           "<td>" + item.VesselName + "</td>" +
                           "<td>" + item.VesselType + "</td>" +
                           "<td>" + item.StartDate + "</td>" +
                           "<td>" + item.EndDate + "</td>" +
                           "<td>" + item.Manning + "</td>" +
                           "<td>" + item.Reason + "</td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.Rank + "\" class=\"fa fa-trash remove-exp\">" +
                                   "<span class=\"tooltiptext\">Click to delete</span>" +
                               "</i></td></tr>";

                $('#exp-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#exp-table').DataTable();
        });
    }).run();
}


$(document).on('click', '.remove-exp', function () {

    var itemID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_exp", {
                id: itemID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                crew_exps();

            }).run();
        }
    })
});

//end exp

//start eval
$(document).on('click', '#save-eval', function (e) {
    e.preventDefault();

     (new http).post("applicant.aspx/insert_eval", {
        crewID: applicantID,
        vessel: $('#eval-vessel').val(),
        rank: $('#eval-rank').val(),
        grade: $('#eval-grade').val(),
        evaluation: $('#eval-evaluation').val(),
        document: $('#eval-document').val(),
        filename: $('#ContentPlaceHolder1_eval_file').val().split('\\')[$('#ContentPlaceHolder1_eval_file').val().split('\\').length - 1],
        remarks: $('#eval-remarks').val(),
        assess: $('#eval-assess').val()
    }).then(function (response) {

        if ($('#ContentPlaceHolder1_eval_file').val() != "") {
            $('#ContentPlaceHolder1_saveEvaluationFile').trigger('click');
        }

    }).run();
});

function evaluations() {
    $('#evaluation-tbody').text('');

    $('#evaluation-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/evaluations", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Vessel + "</td>" +
                           "<td>" + item.Rank + "</td>" +
                           "<td>" + item.DateCreated + "</td>" +
                           "<td>" + item.Assessed + "</td>" +
                           "<td>" + item.Grade + "</td>" +
                           "<td>" + item.Evaluation + "</td>" +
                           "<td>" + item.DocumentName + "</td>" +
                           "<td><a href='content/attachments/" + item.Filename + "' target='_blank'>View File</a></td>" +
                           "<td>" + item.Remarks + "</td></tr>";

                $('#evaluation-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#evaluation-table').DataTable();
        });
    }).run();
}
//end eval

//remarks
$(document).on('click', '#save-remarks', function (e) {
    e.preventDefault();

    $('.fa-spin').removeClass('hidden');

    (new http).post("applicant.aspx/insert_remark", {
        crewID: applicantID,
        remarks: $('#remark-remarks').val(),
        date: getManilaTime().split(', ')[0],
        time: getManilaTime().split(', ')[1]
    }).then(function (response) {

        swal('Successfully Added', 'Information has been added successfully.', 'success');

        $('.fa-spin').addClass('hidden');

        remarks();

    }).run();
});

function remarks() {
    $('#remark-tbody').text('');

    $('#remark-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/remarks", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.Date + "</td>" +
                           "<td>" + item.Time + "</td>" +
                           "<td>" + item.Name + "</td>" +
                           "<td>" + item.Remarks + "</td></tr>";

                $('#remark-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#remark-table').DataTable();
        });
    }).run();
}

function incident_vessels() {
    (new http).post("_vessels.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#incident-vessel').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

$(document).on('click', '#save-incident', function (e) {
    e.preventDefault();

    if (isIncidentValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("applicant.aspx/insert_incident_upgrade", {
            crewID: applicantID,
            vesselID: $('#incident-vessel').val(),
            rankID: $('#incident-rank').val(),
            illnessDate: $('#illness-date').val(),
            repatriationDate: $('#repatriation-date').val(),
            injury: $('#incident-description').val(),
            type: $('#incident-illnes-type').val(),
            clinic: $('#incident-clinic').val(),
            status: $('#incident-status').val(),
            pronounced: $('#pronounced-date').val(),
            settled: $('#settled-date').val(),
            remarks: $('#incident-remarks').val(),
            disability: $('#incident-disability').val()
        }).then(function (response) {

            swal('Successfully Added', 'Information has been added successfully.', 'success');

            $('.fa-spin').addClass('hidden');

            incidents();

        }).run();
    }
});

function isIncidentValid() {
    var a = $("#incident-vessel").validate(['required']).displayErrorOn($("#error-incident-vessel"));
    var b = $("#incident-rank").validate(['required']).displayErrorOn($("#error-incident-rank"));
    var c = $("#illness-date").validate(['required']).displayErrorOn($("#error-illness-date"));
    var d = $("#repatriation-date").validate(['required']).displayErrorOn($("#error-repatriation-date"));
    var e = $("#incident-description").validate(['required']).displayErrorOn($("#error-incident-description"));
    var f = $("#incident-rank").validate(['required']).displayErrorOn($("#error-incident-rank"));

    return b && c && d && a && e && f;
}

function incidents() {
    $('#incident-tbody').empty().append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/crew_incidents", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var type = item.InjuryType == 1 ? "Work" : "Non-work";
                var disability = item.Disability == 1 ? "Yes" : "No";

                var html = "<tr>" +
                           "<td>" + item.Vessel + "</td>" +
                           "<td>" + item.Rank + "</td>" +
                           "<td>" + item.IllnessDate + "</td>" +
                           "<td>" + item.RepatriationDate + "</td>" +
                           "<td>" + item.Injury + "</td>" +
                           "<td>" + type + "</td>" +
                           "<td>" + disability + "</td>" +
                           "<td>" + item.Clinic + "</td>" +
                           "<td>" + item.Status + "</td>" +
                           "<td>" + item.PronouncedDate + "</td>" +
                           "<td>" + item.SettledDate + "</td>" +
                           "<td>" + item.Remarks + "</td></tr>";

                $('#incident-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#incident-table').DataTable();
        });
    }).run();
}
//end remarks

function getManilaTime() {
    var options = {
        timeZone: 'Asia/Manila',
        year: 'numeric', month: 'numeric', day: 'numeric',
        hour: 'numeric', minute: 'numeric', second: 'numeric',
    },

    formatter = new Intl.DateTimeFormat([], options)
    return formatter.format(new Date())
}

function hire_principals() {
    (new http).post("principals.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#hire-principal').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
            $('#change-principal').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
        });
    }).run();
}

$('#hire-principal, #change-principal').change(function () {
    hire_vessels($(this).val());
});

function hire_vessels(principalID) {

    $('#vessel, #change-vessel').text('');

    $('#vessel, #change-vessel').append('<option value="">--SELECT VESSEL--</option>');

    (new http).post("_vessels.aspx/get_by_principal", {
        id: principalID
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#vessel, #change-vessel').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            crewRps(item.ID);
        });
    }).run();
}

function vessel_info(id) {

    (new http).post("_vessels.aspx/find", {
        id: id
    }).then(function (response) {

        var item = response.d[0];

        $('#vessel-view').text(item.Name);
        $('#principal-view').text(item.Principal);

        mySalary(currentRank, currentVessel, item.PrincipalID);

        setTimeout(function () {
            $('#change-principal').val(item.PrincipalID).change();

            setTimeout(function () {
                hire_vessels(item.PrincipalID);

                setTimeout(function () {
                    $('#change-vessel').val(item.ID).change();
                    crewRps(item.ID);
                }, 2000);

            }, 2000);

        }, 2000);

    }).run();
}

function all_timesheets() {
    $('#salary-tbody').text('');

    $('#salary-tbody').append("<tr class=\"loading\"><td colspan=\"17\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("timesheets.aspx/crewPayroll", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var isActive = item.DateDeleted == "" ? "Activated" : "Not Activated";

                var active = "<i data-id=\"" + item.ID + "\" class=\"fa fa-remove remove\">" +
                    "<span class=\"tooltiptext\">Click to deactivate</span>" +
                    "</i>";
                var inactive = "<i data-id=\"" + item.ID + "\" class=\"fa fa-check-circle activate\">" +
                    "<span class=\"tooltiptext\">Click to activate</span>" +
                    "</i>";

                var statusAction = isActive == "Not Activated" ? inactive : active;

                var status = item.Status == 0 ? '<button class="btn btn-warning approve-time" data-id="' + item.ID + '">Pending ' +
                    '<span class=\"tooltiptext\">Click to approve</span></button>' : '<span class="text-success">Approved</span>';

                (new http).post("timesheets.aspx/other_salaries", {
                    id: item.CrewEmbarkID
                }).then(function (response) {

                    var data = response.d[0];

                    if (response.d.length == 0) {
                        grand = item.Total;

                        var html = "<tr>" +
                            "<td>" + item.CrewEmbarkID + "</td>" +
                            "<td>" + item.Principal + "</td>" +
                            "<td>" + item.Vessel + "</td>" +
                            "<td>" + item.Rank + "</td>" +
                            "<td>" + item.Crew + "</td>" +
                            "<td>" + item.Duration + "</td>" +
                            //"<td>" + item.BasicSalaryActual + "</td>" +
                            //"<td>" + item.OvertimeActual + "</td>" +
                            //"<td>" + item.Total + "</td>" +
                            "<td><button class='btn btn-success view-others' " +
                            "data-toggle='modal' data-target='#others-modal' " +
                            "data-id='" + item.VesselID + "' data-rank='" + item.RankID + "' " +
                            "data-principal='" + item.PrincipalID + "'> View Salary</button></td > " +
                            //"<td>" + grand + "</td>
                            "</tr> ";

                        $('#salary-tbody').append(html);
                        resolve();
                    } else {
                        grand = item.Total + ((data.Rejoining + data.LeavePay + data.PensionPay + data.ChristmasPay + data.Others) - data.Deduction);

                        var html2 = "<tr>" +
                            "<td>" + item.CrewEmbarkID + "</td>" +
                            "<td>" + item.Principal + "</td>" +
                            "<td>" + item.Vessel + "</td>" +
                            "<td>" + item.Rank + "</td>" +
                            "<td>" + item.Crew + "</td>" +
                            "<td>" + item.Duration + "</td>" +
                            //"<td>" + item.BasicSalaryActual + "</td>" +
                            //"<td>" + item.OvertimeActual + "</td>" +
                            //"<td>" + item.Total + "</td>" +
                            "<td><button class='btn btn-success view-others' " +
                            "data-toggle='modal' data-target='#others-modal' " +
                            "data-vessel='" + item.VesselID + "' data-rank='" + item.RankID + "' " +
                            "data-principal='" + item.PrincipalID + "'> View Salary</button></td > " +
                            //"<td>" + grand + "</td>
                            "</tr>";

                        $('#salary-tbody').append(html2);
                        resolve();
                    }

                }).run();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#salary-table').DataTable();
        });
    }).run();
}

function other_salaries(vesselId, rankId) {

    $('#rank-tbody').empty();

    (new http).post("scales.aspx/getByVessel", {
        rankID: parseInt(rankId),
        vesselID: vesselId,
        scaleID: parseInt($('#scales').val())
    }).then(function (response) {

        $('#rank-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

        var monthly = 0;
        var daily = 0;

        var classtotal = "";
        var strMonthly = "";
        var fortotalHtml = "";
        var notfortotalHtml = "";

        var i = 1;
        var rank = "";

        var items = response.d.map(item => {

            return new Promise(function (resolve, reject) {

                if (item.ForTotal === 1) {
                    monthly += item.Monthly;
                    daily += item.Daily;

                    strMonthly = "<tr class='total-crew-salary'>" +
                        "<td></td>" +
                        "<td style='text-align: right !important; background-color: #bdbdbd !important'><b>Total</b></td>" +
                        "<td style='text-align: right !important; background-color: #bdbdbd !important'><b>" + parseFloat(monthly) + "</b></td>" +
                        "<td style='text-align: right !important; background-color: #bdbdbd !important'><b>" + parseFloat(daily) + "</b></td>" +
                        "<td></td>" +
                        "<td></td>" +
                        "<td></td>" +
                        "</tr>";

                    classtotal = "for-total-" + item.ForTotal + "-" + item.RankID;
                    rank = item.Rank;

                    fortotalHtml += "<tr class='" + classtotal + "'>" +
                        "<td style='text-align: left !important'></td>" +
                        "<td style='text-align: left !important'>" + i + ") " + item.Income + "</td>" +
                        "<td style='text-align: right !important'>" + item.Monthly + "</td>" +
                        "<td style='text-align: right !important'>" + item.Daily + "</td>" +
                        "<td style='text-align: right !important'>" + item.Percentage + "</td>" +
                        "<td style='text-align: right !important'>" + item.Days + "</td>" +
                        "<td style='text-align: left !important'>" + item.Remarks + "</td></tr>";

                } else {
                    notfortotalHtml += "<tr>" +
                        "<td style='text-align: left !important'></td>" +
                        "<td style='text-align: left !important'>" + i + ") " + item.Income + "</td>" +
                        "<td style='text-align: right !important'>" + item.Monthly + "</td>" +
                        "<td style='text-align: right !important'>" + item.Daily + "</td>" +
                        "<td style='text-align: right !important'>" + item.Percentage + "</td>" +
                        "<td style='text-align: right !important'>" + item.Days + "</td>" +
                        "<td style='text-align: left !important'>" + item.Remarks + "</td></tr>";
                }

                i++;

                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();

            fortotalHtml += strMonthly;

            var td = '.' + classtotal + ' td';

            $('#rank-tbody').append(fortotalHtml);
            $('#rank-tbody').append(notfortotalHtml);

            $(td.toString()).first().html('<b>' + rank + '</b>');
        });

    }).run();
}

$(document).on('click', '.view-others', function () {
    var vesselId = $(this).data('vessel');
    var rankId = $(this).data('rank');
    var principalId = $(this).data('principal');

    scales(principalId);

    setTimeout(function () {
        other_salaries(vesselId, rankId);
    }, 1000);
});

function isAlloteeValid() {
    var a = $("#allotee").validate(['required']).displayErrorOn($("#error-allotee"));
    var b = $("#allotee-relationship").validate(['required']).displayErrorOn($("#error-relationship"));
    var c = $("#allotee-bank").validate(['required']).displayErrorOn($("#error-bank"));
    var d = $("#allotee-account").validate(['required']).displayErrorOn($("#error-account"));
    var e = $("#allotee-account-name").validate(['required']).displayErrorOn($("#error-account-name"));
    var f = $("#allotee-percentage").validate(['required']).displayErrorOn($("#error-percentage"));

    return b && c && d && a && e && f;
}

function isUpdateAlloteeValid() {
    var a = $("#allotee-edit").validate(['required']).displayErrorOn($("#error-allotee-edit"));
    var b = $("#allotee-relationship-edit").validate(['required']).displayErrorOn($("#error-relationship-edit"));
    var c = $("#allotee-bank-edit").validate(['required']).displayErrorOn($("#error-bank-edit"));
    var d = $("#allotee-account-edit").validate(['required']).displayErrorOn($("#error-account-edit"));
    var e = $("#allotee-account-name-edit").validate(['required']).displayErrorOn($("#error-account-name-edit"));
    var f = $("#allotee-percentage-edit").validate(['required']).displayErrorOn($("#error-percentage-edit"));

    return b && c && d && a && e && f;
}

$(document).on('click', '#save-allotee', function (e) {
    e.preventDefault();

    if (isAlloteeValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("applicant.aspx/insert_allotee", {
            crewID: applicantID,
            allotee: $('#allotee').val(),
            relationship: $('#allotee-relationship').val(),
            bank: $('#allotee-bank').val(),
            account: $('#allotee-account').val(),
            accountName: $('#allotee-account-name').val(),
            branch: $('#allotee-branch').val(),
            percentage: $('#allotee-percentage').val()
        }).then(function (response) {

            swal('Successfully Added', 'Information has been added successfully.', 'success');

            $('.fa-spin').addClass('hidden');
            $('#add-allotee-modal .close').click();

            allotees();

        }).run();
    }
});

$(document).on('click', '#save-changes-allotee', function (e) {
    e.preventDefault();

    if (isUpdateAlloteeValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("applicant.aspx/update_allotee", {
            id: allotteID,
            allotee: $('#allotee-edit').val(),
            relationship: $('#allotee-relationship-edit').val(),
            bank: $('#allotee-bank-edit').val(),
            account: $('#allotee-account-edit').val(),
            accountName: $('#allotee-account-name-edit').val(),
            branch: $('#allotee-branch-edit').val(),
            percentage: $('#allotee-percentage-edit').val()
        }).then(function (response) {

            swal('Successfully Updated', 'Information has been updated successfully.', 'success');

            $('.fa-spin').addClass('hidden');
            $('#update-allotee-modal .close').click();

            allotees();

        }).run();
    }
});

function allotees() {
    $('#allotee-tbody').text('');

    $('#allotee-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/allotees", {
        id: applicantID
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                totalAlottee += item.Percentage;

                var html = "<tr>" +
                           "<td>" + item.Allotee + "</td>" +
                           "<td>" + item.Relationship + "</td>" +
                           "<td>" + item.Bank + "</td>" +
                           "<td>" + item.AccountNo + "</td>" +
                           "<td>" + item.AccountName + "</td>" +
                           "<td>" + item.Branch + "</td>" +
                           "<td>" + item.Percentage + "</td>" +
                           "<td><i data-id=\"" + item.ID + "\" data-name=\"" + item.Allotee + "\" class=\"fa fa-trash remove-allotee\">" +
                           "<span class=\"tooltiptext\">Click to delete</span>" +
                           "</i>" +
                           "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Allotee + "\" class=\"fa fa-edit edit-allotee\" data-toggle='modal' data-target='#update-allotee-modal'>" +
                           "<span class=\"tooltiptext\">Click to modify</span>" +
                           "</i>" +
                           "</td></tr>";

                $('#allotee-tbody').append(html);

                $('#tanker-allotee').append("<option value=\"" + item.ID + "\">" + item.Allotee + "</option>");
                $('#offshore-allotee').append("<option value=\"" + item.ID + "\">" + item.Allotee + "</option>");

                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#allotee-table').DataTable();
        });
    }).run();
}

var allotteID = 0;

$(document).on('click', '.edit-allotee', function () {

    allotteID = $(this).data('id');

    (new http).post("applicant.aspx/find_allotee", {
        id: allotteID
    }).then(function (response) {

        var item = response.d[0];

        $('#allotee-edit').val(item.Allotee);
        $('#allotee-relationship-edit').val(item.Relationship);
        $('#allotee-bank-edit').val(item.Bank);
        $('#allotee-account-edit').val(item.AccountNo);
        $('#allotee-account-name-edit').val(item.AccountName);
        $('#allotee-branch-edit').val(item.Branch);
        $('#allotee-percentage-edit').val(item.Percentage);

    }).run();
});

$(document).on('click', '.remove-allotee', function () {

    allotteID = $(this).data('id');

    swal({
        title: 'Are you sure you want to delete this item?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("applicant.aspx/delete_allotee", {
                id: allotteID
            }).then(function (response) {

                swal('Successfully Deleted', 'Information has been deleted successfully.', 'success');

                allotees();

            }).run();
        }
    });
});

function find_required_documents(id) {

    $('#required').text('');

    (new http).post("_vessels.aspx/find_required_documents", {
        id: id
    }).then(function (response) {

        var html = "";

        if (response.d.length == 0) {
            $('#required').append('<span class="text-danger">No data found!</span>');
            return;
        }

        var items = response.d.map(item => {
            html = '<li class="list-group-item">' + item.Name + '</li>';
            $('#required').append(html);
        });

    }).run();
}

function numbers() {

    var today = getManilaTime().split(',')[0];
    var d = today.split('/');

    var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
    var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

    var formattedDate = d[2] + '-' + d0 + '-' + d1;

    (new http).post("applicant.aspx/numbers", {
        id: applicantID,
        date: formattedDate
    }).then(function (response) {

        var items = response.d[0];

        $('#passport').val(items.Passport);
        $('#seamans').val(items.Seaman);
        $('#src').val(items.SRC);
        $('#eregistration').val(items.Eregistration);

        $('#age-view').text(items.Age);

    }).run();
}

var _MS_PER_DAY = 1000 * 60 * 60 * 24;

// a and b are javascript Date objects
function dateDiffInDays(a, b) {

    // Discard the time and time-zone information.
    var utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
    var utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());

    return Math.floor((utc2 - utc1) / _MS_PER_DAY);
}

function find_required_travel_documents() {

    (new http).post("_vessels.aspx/find_required_travel_documents", {
    }).then(function (response) {

        var items = response.d.map(item => {
            (new http).post("applicant.aspx/insert_travel", {
                crewID: applicantID,
                docID: item.ID,
                number: '',
                issue: '',
                expiry: '',
                issuedby: '',
                place: '',
                file: ''
            }).then(function (response) {
            }).run();
        });

    }).run();
}

function find_required_training_documents() {

    (new http).post("_vessels.aspx/find_required_training_documents", {
    }).then(function (response) {

        var items = response.d.map(item => {
            var mlc = $('#mlc').is(':checked') ? 1 : 0;

            (new http).post("applicant.aspx/insert_training", {
                crewID: applicantID,
                seminarID: item.ID,
                centerID: 0,
                mlc: mlc,
                number: '',
                issue: '',
                expiry: '',
                place: '',
                stcw: '',
                file: '',
                issuedby: '',
            }).then(function (response) {

            }).run();
        });

    }).run();
}


function find_required_vaccines() {

    (new http).post("_vessels.aspx/find_required_vaccines", {
    }).then(function (response) {

        var items = response.d.map(item => {

            (new http).post("applicant.aspx/insert_vaccine", {
                crewID: applicantID,
                vaccine: item.ID,
                issue: '',
                expiry: '',
                file: ''
            }).then(function (response) {

            }).run();
        });

    }).run();
}

function scales(principalID) {
    $('#scales').empty();

    (new http).post("principals.aspx/scales", {
        id: principalID
    }).then(function (response) {

        var items = response.d;

        $.each(items, function (id, key) {
            $('#scales').append(key);
        });

    }).run();
}

function mySalary(rankID, vesselID, principalID) {

    (new http).post("scales.aspx/getByVessel", {
        rankID: parseInt(rankID),
        vesselID: vesselID,
        scaleID: principalID
    }).then(function (response) {

        var monthly = 0;
        var daily = 0;

        var classtotal = "";
        var strMonthly = "";
        var fortotalHtml = "";
        var notfortotalHtml = "";

        var i = 1;
        var rank = "";

        var items = response.d.map(item => {

            return new Promise(function (resolve, reject) {

                if (item.VesselID == currentVessel) {
                    if (item.ForTotal === 1) {
                        monthly += item.Monthly;
                        daily += item.Daily;

                        strMonthly = "<tr class='total-crew-salary' id='" + rankID + "'>" +
                            "<td></td>" +
                            "<td style='text-align: right !important; background-color: #bdbdbd !important'><b>Total</b></td>" +
                            "<td style='text-align: right !important; background-color: #bdbdbd !important'><b>" + parseFloat(monthly).toFixed(2) + "</b></td>" +
                            "<td style='text-align: right !important; background-color: #bdbdbd !important'><b>" + parseFloat(daily).toFixed(2) + "</b></td>" +
                            "<td></td>" +
                            "<td></td>" +
                            "<td></td>" +
                            "</tr>";

                        classtotal = "for-total-" + item.ForTotal + "-" + item.RankID;
                        rank = item.Rank;

                        fortotalHtml += "<tr class='" + classtotal + "' id='" + rankID + "'>" +
                            "<td style='text-align: left !important'></td>" +
                            "<td style='text-align: left !important'>" + i + ") " + item.Income + "</td>" +
                            "<td style='text-align: right !important'>" + item.Monthly + "</td>" +
                            "<td style='text-align: right !important'>" + item.Daily + "</td>" +
                            "<td style='text-align: right !important'>" + item.Percentage + "</td>" +
                            "<td style='text-align: right !important'>" + item.Days + "</td>" +
                            "<td style='text-align: left !important'>" + item.Remarks + "</td>" +
                            "</tr>";

                    } else {

                        notfortotalHtml += "<tr class='" + classtotal + "' id='" + rankID + "'>" +
                            "<td style='text-align: left !important'></td>" +
                            "<td style='text-align: left !important'>" + i + ") " + item.Income + "</td>" +
                            "<td style='text-align: right !important'>" + item.Monthly + "</td>" +
                            "<td style='text-align: right !important'>" + item.Daily + "</td>" +
                            "<td style='text-align: right !important'>" + item.Percentage + "</td>" +
                            "<td style='text-align: right !important'>" + item.Days + "</td>" +
                            "<td style='text-align: left !important'>" + item.Remarks + "</td>" +
                            "</tr>";
                    }

                    i++;
                }

                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();

            fortotalHtml += strMonthly;

            var td = '.' + classtotal + ' td';

            $('#salary-tbody').append(fortotalHtml);
            $('#salary-tbody').append(notfortotalHtml);

            $(td.toString()).first().html('<b>' + rank + '</b>');

            var $tbody = $('#salary-tbody');

            $tbody.find('tr').sort(function (a, b) {
                var tda = $(a).attr('id'); // target order attribute
                var tdb = $(b).attr('id'); // target order attribute
                // if a < b return 1
                return tda > tdb ? 1
                    // else if a > b return -1
                    : tda < tdb ? -1
                        // else they are equal - return 0
                        : 0;
            }).appendTo($tbody);

            $('#_total-pay').text(monthly);
            $('#_allotment').text(totalAlottee);
            $('#_pay').text(monthly - totalAlottee);
        });
    }).run();
}