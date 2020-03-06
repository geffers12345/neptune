var id = 0;
var items = [];
var pID = 0;

$(document).ready(function () {
    get();
    ranks();

    $('#id-number').val(Math.floor(Math.random() * 123123123));
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

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("principals.aspx/get", {

    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {
                var isActive = item.DateDeleted == "" ? "Activated" : "Not Activated";

                var active = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Principal + "\" class=\"fa fa-remove remove\">" +
                                   "<span class=\"tooltiptext\">Click to deactivate</span>" +
                               "</i>";
                var inactive = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Principal + "\" class=\"fa fa-check-circle activate\">" +
                                   "<span class=\"tooltiptext\">Click to activate</span>" +
                               "</i>";

                var statusAction = isActive == "Not Activated" ? inactive : active;

                var html = "<tr>" +
                           "<td>" + item.ID + "</td>" +
                           "<td>" + item.Principal + "</td>" +
                           "<td>" + item.Code + "</td>" +
                           "<td>" + item.ExpirationDate + "</td>" +
                           "<td>" + item.AccreditationDate + "</td>" +
                           "<td>" + item.Country + "</td>" +
                           "<td><a role='button' data-id=\"" + item.ID + "\" class=\"documents\" data-toggle='modal' data-target='#documentModal'>Add/View</a></td>" +
                           "<td><a href='/scales?_mksnwrgd=" + item.ID + "' target='_blank'>Salary Scale</a></td > " +
                           "<td>" + item.DateCreated + "</td>" +
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

$(document).on('change', '#ContentPlaceHolder1_files', function () {
    $('#ContentPlaceHolder1_files').text($('#ContentPlaceHolder1_files').val().split('\\')[$('#ContentPlaceHolder1_files').val().split('\\').length - 1]);

    for (var i = 0; i < $("#ContentPlaceHolder1_files").get(0).files.length; ++i) {
        items.push($("#ContentPlaceHolder1_files").get(0).files[i].name);
    };
});

$(document).on('click', '#save', function (e) {
    e.preventDefault();

    if (isInputValid()) {
        $('.fa-spin').removeClass('hidden');

        var logo_path = "";

        if ($('#ContentPlaceHolder1_logo').val() != "") {
            logo_path = $('#ContentPlaceHolder1_logo').val().split('\\')[$('#ContentPlaceHolder1_logo').val().split('\\').length - 1];
        }

        (new http).post("principals.aspx/insert", {
            id_number: parseInt($('#id-number').val()),
            name: $('#name').val(),
            code: $('#code').val(),
            accreditation: $('#accreditation').val(),
            expiration: $('#expiration').val(),
            logo: logo_path
        }).then(function (response) {

            var rID = response.d;

            (new http).post("principals.aspx/insert_info", {
                id: rID,
                address: $('#address').val(),
                one: $('#phone-one').val(),
                two: $('#phone-two').val(),
                country: $('#country').val(),
                fax: $('#fax').val(),
                email: $('#email').val(),
                contactperson: $('#contact-person').val(),
                contactnumber: $('#contact-person-number').val(),
                cba: $('#cba').val()
            }).then(function (response) {

                var trigger = 0;

                var loops = $.each(items, function (id, key) {

                    $.ajax({
                        type: 'POST',
                        url: 'principals.aspx/insert_files',
                        data: '{ "id" : "' + rID + '", "file" : "' + key + '" }',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (response) {
                            if(trigger == items.length) {
                                $('#ContentPlaceHolder1_savefiles').trigger('click');
                            }
                        }
                    });

                    trigger++;
                });

            }).run();

        }).run();
    }
});

$(document).on('click', '.view', function () {
    id = $(this).data('id');

    (new http).post("principals.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#id-number-view').val(item.IDNumber);
        $('#code-view').val(item.Code);
        $('#name-view').val(item.Principal);
        $('#accreditation-view').val(item.AccreditationDate);
        $('#expiration-view').val(item.ExpirationDate);
        $('#logo-view').attr('src', 'content/img/logos/' + item.Logo);
        $('#address-view').val(item.Address);
        $('#phone-one-view').val(item.PhoneOne);
        $('#phone-two-view').val(item.PhoneTwo);
        $('#country-view').val(item.Country).change();
        $('#fax-view').val(item.Fax);
        $('#email-view').val(item.Email);

        $('#contact-person-view').val(item.ContactPerson);
        $('#contact-person-number-view').val(item.ContactPersonNumber);
        $('#cba-view').val(item.CBA);

        $('#viewModal .form-control').prop('disabled', true);
    }).run();
});

$(document).on('click', '.edit', function () {
    id = $(this).data('id');

    (new http).post("principals.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#id-number-edit').val(item.IDNumber);
        $('#code-edit').val(item.Code);
        $('#name-edit').val(item.Principal);
        $('#accreditation-edit').val(item.AccreditationDate);
        $('#expiration-edit').val(item.ExpirationDate);
        $('#address-edit').val(item.Address);
        $('#phone-one-edit').val(item.PhoneOne);
        $('#phone-two-edit').val(item.PhoneTwo);
        $('#country-edit').val(item.Country).change();
        $('#fax-edit').val(item.Fax);
        $('#email-edit').val(item.Email);

        $('#contact-person-edit').val(item.ContactPerson);
        $('#contact-person-number-edit').val(item.ContactPersonNumber);
        $('#cba-edit').val(item.CBA);

        find_ranks(item.ID);

    }).run();
});

$(document).on('click', '#saveChanges', function () {
    if (isInputEditValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("principals.aspx/update", {
            id: id,
            name: $('#name-edit').val(),
            code: $('#code-edit').val(),
            accreditation: $('#accreditation-edit').val(),
            expiration: $('#expiration-edit').val(),
            address: $('#address-edit').val(),
            one: $('#phone-one-edit').val(),
            two: $('#phone-two-edit').val(),
            country: $('#country-edit').val(),
            fax: $('#fax-edit').val(),
            email: $('#email-edit').val(),
            contactperson: $('#contact-person-edit').val(),
            contactnumber: $('#contact-person-number-edit').val(),
            cba: $('#cba-edit').val()
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
            (new http).post("principals.aspx/delete", {
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
    var a = $("#id-number").validate(['required']).displayErrorOn($("#error-id"));
    var b = $("#code").validate(['required']).displayErrorOn($("#error-code"));
    var c = $("#name").validate(['required']).displayErrorOn($("#error-name"));
    var d = $("#accreditation").validate(['required']).displayErrorOn($("#error-accreditation"));
    var e = $("#expiration").validate(['required']).displayErrorOn($("#error-expiration"));
    var f = $("#ContentPlaceHolder1_files").validate(['required']).displayErrorOn($("#error-files"));

    return a && b && c && d && e && f;
}

function isInputEditValid() {
    var a = $("#id-number-edit").validate(['required']).displayErrorOn($("#error-id-edit"));
    var b = $("#code-edit").validate(['required']).displayErrorOn($("#error-code-edit"));
    var c = $("#name-edit").validate(['required']).displayErrorOn($("#error-name-edit"));
    var d = $("#accreditation-edit").validate(['required']).displayErrorOn($("#error-accreditation-edit"));
    var e = $("#expiration-edit").validate(['required']).displayErrorOn($("#error-expiration-edit"));

    return a && b && c && d && e;
}

$(document).on('click', '#add-rank', function () {

    if (hasRankValues()) {
        (new http).post('_vessels.aspx/insert_ranks', {
            principalID: id,
            vessel: 0,
            rankID: $('#rank').val(),
            bsactual: $('#bs-actual').val(),
            bspoea: $('#bs-poea').val(),
            otactual: $('#ot-actual').val(),
            otpoea: parseFloat($('#ot-poea').val()),
            bonusactual: parseFloat($('#bonus-actual').val()),
            bonuspoea: parseFloat($('#bonus-poea').val()),
            leave: $('#vacation').val(),
            currency: $('#currency').val()
        }).then(function (data) {
            swal('Successfully Added', 'Item Has Been Added!', 'success');
            $('#add-item-modal .close').click();
            find_ranks(id);
        }).run();
    }
});

function hasRankValues() {
    var a = $("#rank").validate(['required']).displayErrorOn($("#error-rank"));
    var b = $("#currency").validate(['required']).displayErrorOn($("#error-currency"));
    var c = $("#bs-actual").validate(['required']).displayErrorOn($("#error-bs-actual"));
    var e = $("#ot-actual").validate(['required']).displayErrorOn($("#error-ot-actual"));

    return a && b && c && e;
}

function hasDocumentValues() {
    var a = $("#document").validate(['required']).displayErrorOn($("#error-document"));
    var b = $("#ContentPlaceHolder1_docs").validate(['required']).displayErrorOn($("#error-docs"));

    return a && b;
}

function find_ranks(id) {

    $('#ranks').text('');

    (new http).post("_vessels.aspx/find_ranks_principal", {
        id: id
    }).then(function (response) {

        var html = "";

        var items = response.d.map(item => {
            html = '<div class="panel panel-primary">' +
                      '<div class="panel-heading" style="font-size: x-large;">' +
                        '<i class="fa fa-bookmark-o"></i> ' + item.Rank +
                      '</div>' +
                      '<div class="panel-body">' +
                        '<div class="col-md-4">' +
                            '<label>Basic Salary (Actual)</label>' +
                            '<span class="form-control">' + item.BasicSalaryActual + '</span>' +
                        '</div>' +
                        '<div class="col-md-4">' +
                            '<label>Overtime (Actual)</label>' +
                            '<span class="form-control">' + item.OvertimeActual + '</span>' +
                        '</div>' +
                        //'<div class="col-md-3">' +
                        //    '<label>Bonus (Actual)</label>' +
                        //    '<span class="form-control">' + item.BonusActual + '</span>' +
                        //'</div>' +
                        //'<div class="col-md-3">' +
                        //    '<label>Vacation Leave per Month</label>' +
                        //    '<span class="form-control">' + item.VacationLeave + '</span>' +
                        //'</div>' +
                        //'<div class="col-md-3">' +
                        //    '<label>Basic Salary (POEA)</label>' +
                        //    '<span class="form-control">' + item.BasicPOEA + '</span>' +
                        //'</div>' +
                        //'<div class="col-md-3">' +
                        //    '<label>Overtime (POEA)</label>' +
                        //    '<span class="form-control">' + item.OvertimePOEA + '</span>' +
                        //'</div>' +
                        //'<div class="col-md-3">' +
                        //    '<label>Bonus (POEA)</label>' +
                        //    '<span class="form-control">' + item.BonusPOEA + '</span>' +
                        //'</div>' +
                        '<div class="col-md-4">' +
                            '<label>Currency (POEA)</label>' +
                            '<span class="form-control">' + item.Currency + '</span>' +
                        '</div>' +
                        //'<div class="col-md-12">' +
                        //    '<button class="btn btn-success pull-right edit-rank" data-id="' + item.ID + '" ' +
                        //    'data-toggle="modal" data-target="#edit-item-modal">Modify Details ' +
                        //        '<span class="tooltiptext" style="font-size: 15px !important;">Click to modify details</span>' +
                        //    '</button>' +
                        //'</div>' +
                      '</div>' +
                    '</div>';
            $('#ranks').append(html);
        });
    }).run();
}

$(document).on('click', '.documents', function () {
    id = $(this).data('id');

    pID = id;

    documents(id);
});

function documents(Id) {
    $('#tbody-docs').text('');

    $('#tbody-docs').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("principals.aspx/documents", {
        id: Id
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                    "<td>" + item.ID + "</td>" +
                    "<td>" + item.DocumentName + "</td>" +
                    "<td>" + item.Description + "</td>" +
                    "<td><a href='/content/attachments/libraries/" + item.Filename + "'>" + item.Filename + "</a></td>" +
                    "<td>" + item.Remarks + "</td>" +
                    "<td>" + item.Name + "</td>" +
                    "<td>" + item.DateCreated + "</td>" +
                    "<td>" +
                    "<i data-id=\"" + item.ID + "\" class=\"fa fa-trash delete-doc\"> " +
                        "<span class=\"tooltiptext\">Click to delete</span>" +
                    "</i>";

                html += "</td>" +
                    "</tr>";

                $('#tbody-docs').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#table-docs').DataTable();
        });
    }).run();
}

$(document).on('click', '#save-docs', function (e) {
    e.preventDefault();

    var filePath = "";

    if (hasDocumentValues()) {

        if ($('#ContentPlaceHolder1_docs').val() != "") {
            filePath = $('#ContentPlaceHolder1_docs').val().split('\\')[$('#ContentPlaceHolder1_docs').val().split('\\').length - 1];
        }

        (new http).post('principals.aspx/insert_doc', {
            principalID: id,
            document: $('#document').val(),
            description: $('#description').val(),
            filename: filePath,
            remarks: $('#remarks').val()
        }).then(function (data) {
            $('#ContentPlaceHolder1_saveDocs').trigger('click');
        }).run();
    }
});


$(document).on('click', '.delete-doc', function () {
    id = $(this).data('id');

    swal({
        title: 'Are you sure you want to this document?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("principals.aspx/delete_doc", {
                id: id
            }).then(function (response) {
                swal('Successfully Deleted', 'Document Has Been Deleted!', 'success');

                documents(pID);

            }).run();
        }
    })
});