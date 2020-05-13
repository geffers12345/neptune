var id = 0;
var items = new Map();
var index = 1;
var total = 0;
var enrolled = [];
var rank_item_id = 0;
var principalID = 0;
var vesselId = 0;
var rankIDs = [];
var globalID = 0;

$(document).ready(function () {
    var url = window.location.href;
    id = url.split('=')[1];

    globalID = id;

    $('#ContentPlaceHolder1_ID').val(id);

    vesselId = id;
    
    types();
    principals();
    unions();
    flags();
    routes();
    gears();
    ranks();

    multiple_select();

    find(id);

    find_documents(id);
    find_trainings(id);
    find_medicals(id);
    find_required_documents(id);
});

function multiple_select() {
    $('#enrolled').select2();
    $('#flags').select2();
    $('#owned').select2();
    $('#items').select2();
}

function types() {
    (new http).post("vessels.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#type').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
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

function unions() {
    (new http).post("unions.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#union').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function flags() {
    (new http).post("flags.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#flags').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function routes() {
    (new http).post("routes.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#route').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function gears() {
    (new http).post("gears.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#gear_type').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function ranks() {
    (new http).post("ranks.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#rank-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#new-rank-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#doc-rank').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");

            $('#position').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#position-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function find(id) {

    (new http).post("_vessels.aspx/find", {
        id: id
    }).then(function (response) {

        var item = response.d[0];

        principalID = item.PrincipalID;

        scales(principalID);

        if(item.DateUpdated != "") {
            $('#imageHere').attr('src', '/content/img/' + item.DateUpdated);
        }

        $('#name-view').text(item.Name);
        $('#sign-view').text(item.CallSign);
        $('#code-view').text(item.Code);
        $('#type-view').text(item.VesselType);
        $('#principal-view').text(item.Principal);
        $('#person-view').text(item.ContactPerson);
        $('#manager-view').text(item.Manager);

        $('#name').val(item.Name);
        $('#sign').val(item.CallSign);
        $('#code').val(item.Code);
        $('#type').val(item.VesselTypeID).change();
        $('#principal').val(item.PrincipalID).change();
        $('#current').val(item.CurrentLocation).change();
        $('#destination').val(item.NextDestination).change();

        enrolled.push(item.EnrolledWith.split(', ')[0]);
        enrolled.push(item.EnrolledWith.split(', ')[1]);

        $('#enrolled').val(enrolled).change();
        $('#enroll-date').val(item.EnrollmentDate);
        $('#route').val(item.RouteID).change();
        $('#gear_type').val(item.GearID).change();
        $('#contract').val(item.Contract);
        $('#person').val(item.ContactPerson);
        $('#person-number').val(item.ContactPersonNumber);
        $('#manager').val(item.Manager);

        find_union(id);

        find_flags(id);

        find_specs(id);

        find_ranks(id);

        documents(id);

        $('#content .form-control').prop('disabled', true);
        $('#save-changes').prop('disabled', true);

    }).run();
}

function find_union(id) {

    (new http).post("_vessels.aspx/find_union", {
        id: id
    }).then(function (response) {

        var item = response.d[0];

        $('#union').val(item.UnionID).change();
        $('#effective').val(item.EffectiveDate);
        $('#expiry').val(item.ExpiryDate);

    }).run();
}

function find_flags(id) {

    (new http).post("_vessels.aspx/find_flags", {
        id: id
    }).then(function (response) {

        var items = response.d.map(item => {
            return item.FlagID;
        });

        $('#flags').val(items).change();

    }).run();
}

function find_ranks(id) {

    $('#ranks').text('');

    (new http).post("_vessels.aspx/find_ranks", {
        id: id
    }).then(function (response) {

        var html = "";

        if (response.d.length == 0) {
            find_ranks_principal(principalID);
        } else {
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
                            '<div class="col-md-4">' +
                                '<label>Currency (POEA)</label>' +
                                '<span class="form-control">' + item.Currency + '</span>' +
                            '</div>' +
                            '<div class="col-md-12">' +
                                '<button class="btn btn-success pull-right edit-rank" data-id="' + item.ID + '" ' +
                                'data-toggle="modal" data-target="#edit-item-modal">Modify Details ' +
                                    '<span class="tooltiptext" style="font-size: 15px !important;">Click to modify details</span>' +
                                '</button>' +
                            '</div>' +
                          '</div>' +
                        '</div>';
                $('#ranks').append(html);
            });
        }
    }).run();
}

function find_ranks_principal(id) {

    $('#ranks').text('');

    (new http).post("_vessels.aspx/find_ranks_principal", {
        id: id
    }).then(function (response) {

        var html = "";

        var items = response.d.map(item => {

            insertRankSalary(vesselId, item.RankID, item.BasicSalaryActual, item.OvertimeActual, item.CurrencyPOEA);

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
                        '<div class="col-md-4">' +
                            '<label>Currency (POEA)</label>' +
                            '<span class="form-control">' + item.Currency + '</span>' +
                        '</div>' +
                        '<div class="col-md-12">' +
                            '<button class="btn btn-success pull-right edit-rank" data-id="' + item.ID + '" ' +
                            'data-toggle="modal" data-target="#edit-item-modal">Modify Details ' +
                                '<span class="tooltiptext" style="font-size: 15px !important;">Click to modify details</span>' +
                            '</button>' +
                        '</div>' +
                      '</div>' +
                    '</div>';
            $('#ranks').append(html);
        });
    }).run();
}

var owned = [];

function find_specs(id) {

    (new http).post("_vessels.aspx/find_specs", {
        id: id
    }).then(function (response) {

        $('#content1 .form-control').prop('disabled', true);

        var item = response.d[0];

        $('#port').val(item.Port);
        $('#built').val(item.YearBuilt);

        owned.push(item.OwnedBy.split(', ')[0]);
        owned.push(item.OwnedBy.split(', ')[1]);

        $('#owned').val(owned).change();
        $('#owner').val(item.Owner);
        $('#ex-owner-name').val(item.ExName);
        $('#official').val(item.OfficialNumber);
        $('#imo').val(item.IMONumber);
        $('#main-engine').val(item.MainEngine);
        $('#capacity').val(item.Capacity);
        $('#power').val(item.PropulsionPower);
        $('#gtr').val(item.GRT);
        $('#dwt').val(item.DWT);
        $('#out').val(item.OuputPower);
        $('#nrt').val(item.NRT.split('|')[0]);
        $('#classification').val(item.NRT.split('|')[1]);
        $('#particulars').val(item.Particulars);
        $('#ex-flag').val(item.ExFlag);

        $('#content1 .form-control').prop('disabled', true);
        $('#save-changes-specs').prop('disabled', true);

    }).run();
}

$('#edit-info').click(function () {
    $('#content .form-control').prop('disabled', false);
    $('#save-changes').prop('disabled', false);
});

$('#edit-specs').click(function () {
    $('#content1 .form-control').prop('disabled', false);
    $('#save-changes-specs').prop('disabled', false);
});

$(document).on('click', '#save-changes', function (e) {
    e.preventDefault();

    if (isInputValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("_vessels.aspx/update", {
            id: id,
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

            update_union(id, $('#union').val(), $('#effective').val(), $('#expiry').val());

            swal('Successfully Updated!', 'Vessel has been successfully updated.', 'success');

            $('.fa-spin').addClass('hidden');

            $('#content .form-control').prop('disabled', true);

        }).run();
    }

});

function update_union(item_id, union, effective, expiry) {
    (new http).post("_vessels.aspx/update_union", {
        vessel: item_id,
        union: union,
        effective: effective,
        expiry: expiry
    }).then(function (response) {

    }).run();
}

$(document).on('click', '#save-changes-specs', function (e) {
    e.preventDefault();

    $('.fa-spin').removeClass('hidden');

    var capacity = $('#capacity').val() != '' ? $('#capacity').val() : 0;

    (new http).post("_vessels.aspx/update_specs", {
        vessel: id,
        port: $('#port').val(),
        built: $('#built').val(),
        owned: $('#owned').val().join(', '),
        owner: $('#owner').val(),
        exname: $('#ex-owner-name').val(),
        official: $('#official').val(),
        imo: $('#imo').val(),
        engine: $('#main-engine').val(),
        capacity: capacity,
        propulsion: $('#power').val(),
        grt: $('#gtr').val(),
        dwt: $('#dwt').val(),
        power: $('#out').val(),
        nrt: $('#nrt').val() + "|" + $('#classification').val(),
        particular: $('#particulars').val(),
        exflag: $('#ex-flag').val()
    }).then(function (response) {

        (new http).post("_vessels.aspx/insert_flags", {
            vessel: id,
            flags: $('#flags').val()
        }).then(function (response) {

        }).run();

        swal('Successfully Updated!', 'Vessel Specs has been successfully updated.', 'success');
        $('#content1 .form-control').prop('disabled', true);
        $('#save-changes-specs').prop('disabled', true);
        $('.fa-spin').addClass('hidden');

    }).run();
});

$(document).on('click', '#save-rank', function (e) {
    e.preventDefault();

    if (hasValues()) {
        (new http).post('_vessels.aspx/insert_ranks', {
            principalID: principalID,
            vessel: id,
            rankID: $('#rank').val(),
            bsactual: $('#bs-actual').val(),
            bspoea: $('#bs-poea').val(),
            otactual: $('#ot-actual').val(),
            otpoea: $('#ot-poea').val(),
            bonusactual: $('#bonus-actual').val(),
            bonuspoea: $('#bonus-poea').val(),
            leave: $('#vacation').val(),
            currency: $('#currency').val()
        }).then(function (data) {

            $("#add-item-modal .form-control").val('');

            $('#add-item-modal .close').click();

            swal('Successfully Added', 'Item Has Been Added!', 'success');

            find_ranks(id);

        }).run();
    }
});

$(document).on('click', '#new-save-changes-rank', function (e) {
    e.preventDefault();
    (new http).post('_vessels.aspx/insert_ranks', {
        principalID: principalID,
        vessel: id,
        rankID: $('#new-rank-edit').val(),
        bsactual: $('#new-bs-actual-edit').val(),
        bspoea: 0,
        otactual: $('#new-ot-actual-edit').val(),
        otpoea: 0,
        bonusactual: 0,
        bonuspoea: 0,
        leave: 0,
        currency: $('#new-currency-edit').val()
    }).then(function (data) {

        $("#add-item-modal .form-control").val('');

        $('#add-item-modal .close').click();

        swal('Successfully Added', 'Item Has Been Added!', 'success');

        find_ranks(id);

    }).run();
});

$(document).on('click', '.edit-rank', function () {

    rank_item_id = $(this).data('id');

    (new http).post("_vessels.aspx/find_rank", {
        id: rank_item_id
    }).then(function (response) {

        var item = response.d[0];

        $('#rank-edit').val(item.RankID).change();
        $('#currency-edit').val(item.CurrencyPOEA);
        $('#bs-actual-edit').val(item.BasicSalaryActual);
        $('#bs-poea-edit').val(item.BasicPOEA);
        $('#ot-actual-edit').val(item.OvertimeActual);
        $('#ot-poea-edit').val(item.OvertimePOEA);
        $('#bonus-actual-edit').val(item.BonusActual);
        $('#bonus-poea-edit').val(item.BonusPOEA);
        $('#vacation-edit').val(item.VacationLeave);

        $('#new-rank-edit').val(item.RankID).change();
        $('#new-currency-edit').val(item.CurrencyPOEA);
        $('#new-bs-actual-edit').val(item.BasicSalaryActual);
        $('#new-ot-actual-edit').val(item.OvertimeActual);

    }).run();
});

$(document).on('click', '#save-changes-rank', function () {
    if (hasValuesEdit()) {
        (new http).post('_vessels.aspx/update_rank', {
            id: rank_item_id,
            rankID: $('#rank-edit').val(),
            bsactual: $('#bs-actual-edit').val(),
            bspoea: $('#bs-poea-edit').val(),
            otactual: $('#ot-actual-edit').val(),
            otpoea: $('#ot-poea-edit').val(),
            bonusactual: $('#bonus-actual-edit').val(),
            bonuspoea: $('#bonus-poea-edit').val(),
            leave: $('#vacation-edit').val(),
            currency: $('#currency-edit').val()
        }).then(function (data) {

            $("#add-item-modal .form-control").val('');

            $('#edit-item-modal .close').click();

            swal('Successfully Updated', 'Item Has Been Updated!', 'success');

            find_ranks(id);

        }).run();
    }
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

    return a && b && c && d && e && f && g && h && i && j && k;
}

function hasValues() {
    var a = $("#rank").validate(['required']).displayErrorOn($("#error-rank"));
    var b = $("#currency").validate(['required']).displayErrorOn($("#error-currency"));
    var c = $("#ot-actual").validate(['required']).displayErrorOn($("#error-ot-actual"));

    return a && b && c;
}

function hasValuesEdit() {
    var a = $("#rank-edit").validate(['required']).displayErrorOn($("#error-rank-edit"));
    var b = $("#currency-edit").validate(['required']).displayErrorOn($("#error-currency-edit"));
    var c = $("#bs-actual-edit").validate(['required']).displayErrorOn($("#error-bs-actual-edit"));
    var d = $("#bs-poea-edit").validate(['required']).displayErrorOn($("#error-bs-poea-edit"));
    var e = $("#ot-actual-edit").validate(['required']).displayErrorOn($("#error-ot-actual-edit"));
    var f = $("#ot-poea-edit").validate(['required']).displayErrorOn($("#error-ot-poea-edit"));
    var g = $("#bonus-actual-edit").validate(['required']).displayErrorOn($("#error-bonus-actual-edit"));
    var h = $("#bonus-poea-edit").validate(['required']).displayErrorOn($("#error-bonus-poea-edit"));

    return a && b && c && d && e && f && g && h;
}

function hasDocValues() {
    var a = $("#doc-type").validate(['required']).displayErrorOn($("#error-doc"));
    var b = $("#doc-rank").validate(['required']).displayErrorOn($("#error-doc-rank"));
    var c = $("#items").validate(['required']).displayErrorOn($("#error-items"));

    return a && b && c;
}

$(document).on('change', '#doc-type', function () {

    $('#items').text('');

    if ($(this).val() != "") {
        var typeID = parseInt($(this).val());

        switch (typeID) {
            case 1:
                documents();
                break;
            case 2:
                seminars();
                break;
            case 3:
                medicals();
                break;
            case 0:
                return;
            default:
                // code block
         }

        $('#items').select2();
    }
});

function documents() {
    (new http).post("documents.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#items').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function seminars() {
    (new http).post("seminars.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#items').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function medicals() {
    (new http).post("medicals.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#items').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

$(document).on('click', '#save-document', function (e) {
    e.preventDefault();

    if (hasDocValues()) {

        if ($('#doc-type').val() != "") {

            var typeID = parseInt($('#doc-type').val());

            console.log(typeID);

            switch (typeID) {
                case 1:
                    
                    (new http).post('_vessels.aspx/insert_documents', {
                        vessel: id,
                        rankID: $('#doc-rank').val(),
                        items: $('#items').val()
                    }).then(function (data) {

                        $("#add-document-modal .form-control").val('');

                        $('#add-document-modal .close').click();

                        swal('Successfully Added', 'Item Has Been Added!', 'success');

                        find_documents(id);

                    }).run();

                    break;
                case 2:
                    
                    (new http).post('_vessels.aspx/insert_trainings', {
                        vessel: id,
                        rankID: $('#doc-rank').val(),
                        items: $('#items').val()
                    }).then(function (data) {

                        $("#add-document-modal .form-control").val('');

                        $('#add-document-modal .close').click();

                        swal('Successfully Added', 'Item Has Been Added!', 'success');

                        find_trainings(id);

                    }).run();

                    break;
                case 3:
                    
                    (new http).post('_vessels.aspx/insert_medicals', {
                        vessel: id,
                        rankID: $('#doc-rank').val(),
                        items: $('#items').val()
                    }).then(function (data) {

                        $("#add-document-modal .form-control").val('');

                        $('#add-document-modal .close').click();

                        swal('Successfully Added', 'Item Has Been Added!', 'success');

                        find_medicals(id);

                    }).run();

                    break;
                case 0:
                    return;
                default:
                    // code block
            }
        }
    }
});

function find_documents(id) {

    $('#documents').text('');

    (new http).post("_vessels.aspx/find_documents", {
        id: id
    }).then(function (response) {

        var html = "";

        if (response.d.length == 0) {
            $('#documents').append('<span class="text-danger">No data found!</span>');
            return;
        }

        var items = response.d.map(item => {
            html = '<li class="list-group-item">' + item.Name + '</li>';
            $('#documents').append(html);
        });

    }).run();
}

function find_trainings(id) {

    $('#trainings').text('');

    (new http).post("_vessels.aspx/find_trainings", {
        id: id
    }).then(function (response) {

        var html = "";

        if (response.d.length == 0) {
            $('#trainings').append('<span class="text-danger">No data found!</span>');
            return;
        }

        var items = response.d.map(item => {
            html = '<li class="list-group-item">' + item.Name + '</li>';
            $('#trainings').append(html);
        });

    }).run();
}

function find_medicals(id) {

    $('#medicals').text('');

    (new http).post("_vessels.aspx/find_medicals", {
        id: id
    }).then(function (response) {

        var html = "";

        if (response.d.length == 0) {
            $('#medicals').append('<span class="text-danger">No data found!</span>');
            return;
        }

        var items = response.d.map(item => {
            html = '<li class="list-group-item">' + item.Name + '</li>';
            $('#medicals').append(html);
        });

    }).run();
}

function insertRankSalary(vesselID, rankID, basicSalary, overtime, currency) {
    (new http).post('_vessels.aspx/insert_ranks', {
        principalID: principalID,
        vessel: vesselID,
        rankID: rankID,
        bsactual: basicSalary,
        bspoea: 0,
        otactual: overtime,
        otpoea: 0,
        bonusactual: 0,
        bonuspoea: 0,
        leave: 0,
        currency: currency
    }).then(function (data) {

        

    }).run();
}

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


$(document).on('click', '#add-item, .edit-rank, #toggle-document, #toggle-document-modal', function (e) {
    e.preventDefault();

});

function documents(Id) {
    $('#tbody-docs').text('');

    $('#tbody-docs').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("vessel.aspx/documents", {
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

        (new http).post('vessel.aspx/insert_doc', {
            vesselID: id,
            document: $('#document').val(),
            description: $('#description').val(),
            filename: filePath,
            remarks: $('#remarks').val()
        }).then(function (data) {
            $('#ContentPlaceHolder1_saveDocs').trigger('click');
        }).run();
    }
});


function hasDocumentValues() {
    var a = $("#document").validate(['required']).displayErrorOn($("#error-document"));
    var b = $("#ContentPlaceHolder1_docs").validate(['required']).displayErrorOn($("#error-docs"));

    return a && b;
}

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
            (new http).post("vessel.aspx/delete_doc", {
                id: id
            }).then(function (response) {
                swal('Successfully Deleted', 'Document Has Been Deleted!', 'success');

                setTimeout(function () {
                    window.location.reload();
                }, 3000);

            }).run();
        }
    });
});

function scales(principalID) {
    $('#scales').empty();

    (new http).post("principals.aspx/scales", {
        id: principalID
    }).then(function (response) {

        if (response.d.length === 0) {
            $('#rank-tbody').empty();
            $('#rank-tbody').append("<tr class='loading'>" +
                "<td colspan='8'><span class='text-danger'>No Data Found!</span></td></tr>");

            return;
        }

        var items = response.d;

        $.each(items, function (id, key) {
            $('#scales').append(key);
        });

        setTimeout(function () {
            getRankIDs();
        }, 3000);
    }).run();
}

function getRankIDs() {
    $('#rank-tbody').empty();

    $('#rank-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("scales.aspx/rankIds", {
        id: parseInt($('#scales').val())
    }).then(function (response) {

        var ids = response.d;

        if (response.d.length === 0) {
            $('#rank-tbody').empty();
            $('#rank-tbody').append("<tr class='loading'>" +
                "<td colspan='8'><span class='text-danger'>No Data Found!</span></td></tr>");

            return;
        }

        rankIDs = [];

        var items = $.each(ids, function (id, key) {
            return new Promise(function (resolve, reject) {

                rankIDs.push(key);

                resolve();
            });
        });

        Promise.all(items).then(function () {
            $.each(rankIDs, function (id, key) {
                rankSalary(key);
            });
        });
    }).run();
}

function rankSalary(rankID) {

    (new http).post("scales.aspx/getSS", {
        rankID: parseInt(rankID),
        vesselID: vesselId,
        scaleID: parseInt($('#scales').val())
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

            saveSalary(item.PrincipalID, parseInt(vesselId), item.RankID, item.ScaleID,
                item.Income, item.Remarks, item.Monthly, item.Daily, item.Percentage, item.Days, item.ForTotal, item.Claim);

            return new Promise(function (resolve, reject) {

                if (item.VesselID == globalID) {
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
                            "<td>";

                        fortotalHtml += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit-salary\" data-toggle='modal' data-target='#editModal'>" +
                            "<span class=\"tooltiptext\">Click to modify details</span>" +
                            "</i>" +
                            "<i data-id=\"" + item.ID + "\" class=\"fa fa-trash trash\">" +
                            "<span class=\"tooltiptext\">Click to delete item</span>" +
                            "</i>";

                        fortotalHtml += "</td>" +
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
                            "<td>";

                        notfortotalHtml += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit-salary\" data-toggle='modal' data-target='#editModal'>" +
                            "<span class=\"tooltiptext\">Click to modify details</span>" +
                            "</i>" +
                            "<i data-id=\"" + item.ID + "\" class=\"fa fa-trash trash\">" +
                            "<span class=\"tooltiptext\">Click to delete item</span>" +
                            "</i>";

                        notfortotalHtml += "</td>" +
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

            $('#rank-tbody').append(fortotalHtml);
            $('#rank-tbody').append(notfortotalHtml);

            $(td.toString()).first().html('<b>' + rank + '</b>');

            var $tbody = $('#table-salary #rank-tbody');

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
        });
    }).run();
}

function saveSalary(principalID, vesselID, rankID, scaleID,
    income, remarks, monthly, daily, percentage, days, total, payout) {

    (new http).post("principals.aspx/insertSalaryScale", {
        principalID: principalID,
        vesselID: vesselID,
        rankID: rankID,
        scaleID: scaleID,
        income: income,
        remarks: remarks,
        monthly: monthly,
        daily: daily,
        percentage: percentage,
        days: days,
        isTotal: total,
        payout: payout
    }).then(function (response) {

    }).run();
}

$(document).on('click', '#save', function () {
    if (isSalaryValid()) {
        $('.fa-spin').removeClass('hidden');

        var isTotal = $('#total').prop('checked') === true ? 1 : 0;

        (new http).post("principals.aspx/insertSalaryScale", {
            principalID: principalID,
            vesselID: vesselId,
            rankID: $('#position').val(),
            scaleID: $('#scales').val(),
            income: $('#income').val(),
            remarks: $('#remark').val(),
            monthly: $('#monthly').val(),
            daily: $('#daily').val(),
            percentage: $('#percentage').val(),
            days: $('#days').val(),
            isTotal: isTotal,
            payout: $('#payout').val()
        }).then(function (response) {

            swal('Successfully Added!', 'Item has been successfully added.', 'success');
            getRankIDs();
            $('.fa-spin').addClass('hidden');
            $('.close').click();

            $('#addModal input[type=number], #addModal input[type=text]').val('');

        }).run();
    }

});


$('#monthly').change(function () {

    var value = parseFloat($(this).val());

    $('#daily').val(((value * 12) / 365).toFixed(2));

});

$('#monthly-edit').change(function () {

    var value = parseFloat($(this).val());

    $('#daily-edit').val(((value * 12) / 365).toFixed(2));

});

function isSalaryValid() {
    var a = $("#position").validate(['required']).displayErrorOn($("#error-position"));
    var b = $("#income").validate(['required']).displayErrorOn($("#error-income"));
    var c = $("#monthly").validate(['required']).displayErrorOn($("#error-monthly"));
    var d = $("#daily").validate(['required']).displayErrorOn($("#error-daily"));
    var e = $("#percentage").validate(['required']).displayErrorOn($("#error-percentage"));
    var f = $("#days").validate(['required']).displayErrorOn($("#error-days"));

    return a && b && c && d && e && f;
}

$(document).on('click', '.trash', function () {
    id = $(this).data('id');

    var _self = $(this);

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
            (new http).post("scales.aspx/delete", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Deleted', 'Item Has Been Deleted!', 'success');

                getRankIDs();
            }).run();
        }
    });
});

$(document).on('click', '#saveChanges', function () {
    if (isInputEditValid()) {
        $('.fa-spin').removeClass('hidden');

        var isTotal = $('#total-edit').prop('checked') === true ? 1 : 0;

        (new http).post("principals.aspx/updateSalaryScale", {
            id: id,
            rankID: $('#position-edit').val(),
            scaleID: $('#scales').val(),
            income: $('#income-edit').val(),
            remarks: $('#remarks-edit').val(),
            monthly: $('#monthly-edit').val(),
            daily: $('#daily-edit').val(),
            percentage: $('#percentage-edit').val(),
            days: $('#days-edit').val(),
            isTotal: isTotal,
            payout: $('#payout-edit').val()
        }).then(function (response) {

            swal('Successfully Updated!', 'Item has been successfully updated.', 'success');

            getRankIDs();

            $('.fa-spin').addClass('hidden');
            $('.close').click();

        }).run();
    }

});

function isInputEditValid() {
    var a = $("#position-edit").validate(['required']).displayErrorOn($("#error-position-edit"));
    var b = $("#income-edit").validate(['required']).displayErrorOn($("#error-income-edit"));
    var c = $("#monthly-edit").validate(['required']).displayErrorOn($("#error-monthly-edit"));
    var d = $("#daily-edit").validate(['required']).displayErrorOn($("#error-daily-edit"));
    var e = $("#percentage-edit").validate(['required']).displayErrorOn($("#error-percentage-edit"));
    var f = $("#days-edit").validate(['required']).displayErrorOn($("#error-days-edit"));

    return a && b && c && d && e && f;
}

$(document).on('click', '.edit-salary', function () {
    id = $(this).data('id');

    (new http).post("scales.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#position-edit').val(item.RankID).change();
        $('#income-edit').val(item.Income);
        $('#remarks-edit').val(item.Remarks);
        $('#monthly-edit').val(item.Monthly);

        $('#daily-edit').val(item.Daily);
        $('#percentage-edit').val(item.Percentage);
        $('#days-edit').val(item.Days);
        $('#payout-edit').val(item.Claim).change();

        if (item.ForTotal === 1) {
            $('#total-edit').prop('checked', true);
        } else {
            $('#total-edit').prop('checked', false);
        }

    }).run();
});

$('#scales').change(function () {

    $('#tbody').empty();

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    setTimeout(function () {
        getRankIDs();
    }, 3000);

});