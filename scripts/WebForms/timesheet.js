var id = 0;

$(document).ready(function () {
    get();

    principals();
});


function principals() {
    (new http).post("principals.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#principal').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
            $('#principal-edit').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
            $('#principal-view').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
        });
    }).run();
}

function vessels(principalID) {

    $('#vessel, #vessel-edit, #vessel-view').text('');

    (new http).post("_vessels.aspx/get_by_principal", {
        id: principalID
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#vessel').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#vessel-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#vessel-view').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

$('#principal, #principal-edit').change(function () {
    vessels($(this).val());
});

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("timesheets.aspx/get", {

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

                var status = item.Status == 0 ? '<span class="text-warning">Pending</span>' : '<span class="text-success">Approved</span>';

                var html = "<tr>" +
                           "<td>" + item.ID + "</td>" +
                           "<td>" + item.Principal + "</td>" +
                           "<td>" + item.Vessel + "</td>" +
                           "<td>" + item.StartDate + "</td>" +
                           "<td>" + item.EndDate + "</td>" +
                           "<td>" + status + "</td>" +
                           "<td>" + item.DateCreated + "</td><td>";
                if (item.Status == 0) {
                    html += "<i data-id=\"" + item.ID + "\" class=\"fa fa-search view\" data-toggle='modal' data-target='#viewModal'> " +
                                   "<span class=\"tooltiptext\">Click to view details</span>" +
                               "</i>";
                    html += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\" data-toggle='modal' data-target='#editModal'>" +
                            "<span class=\"tooltiptext\">Click to modify details</span>" +
                        "</i>";


                    html += statusAction;
                }

                html += "</td></tr>";

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

function all_timesheets() {
    $('#admin-tbody').text('');

    $('#admin-tbody').append("<tr class=\"loading\"><td colspan=\"17\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("timesheets.aspx/payroll", {

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

                        $('#admin-tbody').append(html);
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

                        $('#admin-tbody').append(html2);
                        resolve();
                    }

                }).run();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#admin-table').DataTable();
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

$(document).on('click', '#save-others', function () {
    $('.fa-spin').removeClass('hidden');

    (new http).post("timesheets.aspx/insert_others", {
        id: id,
        rejoining: $('#rejoining').val(),
        leave: $('#leave').val(),
        pension: $('#pension').val(),
        xmas: $('#xmas').val(),
        others: $('#others').val(),
        deduction: $('#deduction').val()
    }).then(function (response) {

        swal('Successfully Added!', 'Item has been successfully added.', 'success');
        all_timesheets();
        $('.fa-spin').addClass('hidden');
        $('.close').click();

    }).run();
});

$(document).on('click', '#save', function () {
    if (isInputValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("timesheets.aspx/insert", {
            principalID: $('#principal').val(),
            vesselID: $('#vessel').val(),
            start: $('#start').val(),
            end: $('#end').val(),
            notes: $('#notes').val()
        }).then(function (response) {

            swal('Successfully Added!', 'Item has been successfully added.', 'success');
            get();
            $('.fa-spin').addClass('hidden');
            $('.close').click();

        }).run();
    }

});

$(document).on('click', '.view', function () {
    id = $(this).data('id');

    (new http).post("timesheets.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#principal-view').val(item.PrincipalID).change();

        vessels(item.PrincipalID);

        setTimeout(function () {
            $('#vessel-view').val(item.VesselID).change();
        }, 1000);
        
        $('#start-view').val(item.StartDate);
        $('#end-view').val(item.EndDate);
        $('#notes-view').val(item.Notes);

        $('#viewModal .form-control').prop('disabled', true);
    }).run();
});

$(document).on('click', '.edit', function () {
    id = $(this).data('id');

    (new http).post("timesheets.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#principal-edit').val(item.PrincipalID).change();

        vessels(item.PrincipalID);

        setTimeout(function () {
            $('#vessel-edit').val(item.VesselID).change();
        }, 1000);

        $('#start-edit').val(item.StartDate);
        $('#end-edit').val(item.EndDate);
        $('#notes-edit').val(item.Notes);

    }).run();
});

$(document).on('click', '#saveChanges', function () {
    if (isInputEditValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("timesheets.aspx/update", {
            id: id,
            principalID: $('#principal-edit').val(),
            vesselID: $('#vessel-edit').val(),
            start: $('#start-edit').val(),
            end: $('#end-edit').val(),
            notes: $('#notes-edit').val()
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

    swal({
        title: 'Are you sure you want to remove timesheet?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("timesheets.aspx/delete", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Deactivated', 'Item Has Been Deactivated!', 'success');
                get();
            }).run();
        }
    })
});

$(document).on('click', '.approve-time', function () {
    id = $(this).data('id');

    swal({
        title: 'Are you sure you want to approve time?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Approve!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("timesheets.aspx/approve", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Approved', 'Item Has Been Approved!', 'success');
                all_timesheets();
            }).run();
        }
    })
});

function isInputValid() {
    var a = $("#principal").validate(['required']).displayErrorOn($("#error-principal"));
    var b = $("#vessel").validate(['required']).displayErrorOn($("#error-vessel"));
    var c = $("#start").validate(['required']).displayErrorOn($("#error-start"));
    var d = $("#end").validate(['required']).displayErrorOn($("#error-end"));

    return a && b && c && d;
}

function isInputEditValid() {
    var a = $("#principal-edit").validate(['required']).displayErrorOn($("#error-principal-edit"));
    var b = $("#vessel-edit").validate(['required']).displayErrorOn($("#error-vessel-edit"));
    var c = $("#start-edit").validate(['required']).displayErrorOn($("#error-start-edit"));
    var d = $("#end-edit").validate(['required']).displayErrorOn($("#error-end-edit"));

    return a && b && c && d;
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