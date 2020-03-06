var id = 0;
var rankIDs = [];

$(document).ready(function () {
    $('#tbody').empty();

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");
});

$('#scales').change(function () {

    $('#tbody').empty();

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    setTimeout(function () {
        getRankIDs();
    }, 3000);

});

function scales(principalID) {
    $('#scales').empty();

    (new http).post("principals.aspx/scales", {
        id: principalID
    }).then(function (response) {

        if (response.d.length === 0) {
            $('#tbody').empty();
            $('#tbody').append("<tr class='loading'><td colspan='8'><span class='text-danger'>No Data Found!</span></td></tr>");

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

function ranks(principalID) {
    (new http).post("ranks.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#position').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#position-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function getRankIDs() {
    $('#tbody').empty();

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("scales.aspx/rankIds", {
        id: parseInt($('#scales').val())
    }).then(function (response) {

        var ids = response.d;

        if (response.d.length === 0) {
            $('#tbody').empty();
            $('#tbody').append("<tr class='loading'><td colspan='8'><span class='text-danger'>No Data Found!</span></td></tr>");

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
                console.log(key);
                find(key);
            });
        });
    }).run();
}

function find(rankID) {

    (new http).post("scales.aspx/get", {
        rankID: parseInt(rankID),
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
            return new Promise(function (resolve, reject) {

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

                    fortotalHtml += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\" data-toggle='modal' data-target='#editModal'>" +
                            "<span class=\"tooltiptext\">Click to modify details</span>" +
                        "</i>" + 
                        "<i data-id=\"" + item.ID + "\" class=\"fa fa-trash trash\">" +
                            "<span class=\"tooltiptext\">Click to delete item</span>" +
                        "</i>";

                    fortotalHtml += "</td>" +
                        "</tr>";

                } else {
                    notfortotalHtml += "<tr id='" + rankID + "'>" +
                        "<td style='text-align: left !important'></td>" +
                        "<td style='text-align: left !important'>" + i + ") " + item.Income + "</td>" +
                        "<td style='text-align: right !important'>" + item.Monthly + "</td>" +
                        "<td style='text-align: right !important'>" + item.Daily + "</td>" +
                        "<td style='text-align: right !important'>" + item.Percentage + "</td>" +
                        "<td style='text-align: right !important'>" + item.Days + "</td>" +
                        "<td style='text-align: left !important'>" + item.Remarks + "</td>" +
                        "<td>";

                    notfortotalHtml += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\" data-toggle='modal' data-target='#editModal'>" +
                            "<span class=\"tooltiptext\">Click to modify details</span>" +
                        "</i>" +
                        "<i data-id=\"" + item.ID + "\" class=\"fa fa-trash trash\">" +
                            "<span class=\"tooltiptext\">Click to delete item</span>" +
                        "</i>";

                    notfortotalHtml += "</td>" +
                        "</tr>";
                }

                i++;

                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();

            fortotalHtml += strMonthly;

            var td = '.' + classtotal + ' td';

            $('#tbody').append(fortotalHtml);
            $('#tbody').append(notfortotalHtml);

            $(td.toString()).first().html('<b>' + rank + '</b>');

            var $tbody = $('#table-salary tbody');

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

$('#monthly').change(function () {

    var value = parseFloat($(this).val());

    $('#daily').val(((value * 12) / 365).toFixed(2));

});

$('#monthly-edit').change(function () {

    var value = parseFloat($(this).val());

    $('#daily-edit').val(((value * 12) / 365).toFixed(2));

});

$(document).on('click', '#save', function () {
    if (isInputValid()) {
        $('.fa-spin').removeClass('hidden');

        var isTotal = $('#total').prop('checked') === true ? 1 : 0;

        (new http).post("principals.aspx/insertSalaryScale", {
            principalID: principalID,
            vesselID: 0,
            rankID: $('#position').val(),
            scaleID: $('#scales').val(),
            income: $('#income').val(),
            remarks: $('#remarks').val(),
            monthly: $('#monthly').val(),
            daily: $('#daily').val(),
            percentage: $('#percentage').val(),
            days: $('#days').val(),
            isTotal: isTotal,
            payout: $('#payout').val()
        }).then(function (response) {

            swal('Successfully Added!', 'Item has been successfully added.', 'success');
            
            $('.fa-spin').addClass('hidden');
            $('.close').click();

            $('#addModal input[type=number], #addModal input[type=text]').val('');

            setTimeout(function () {
                window.location.reload();
            }, 3000);

        }).run();
    }

});

$(document).on('click', '#save-salary-scale', function () {
    if (isSalaryValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("principals.aspx/insertScale", {
            principalID: principalID,
            scale: $('#salary-scale').val()
        }).then(function (response) {

            swal('Successfully Added!', 'Item has been successfully added.', 'success');

            scales(principalID);

            $('.fa-spin').addClass('hidden');
            $('.close').click();

        }).run();
    }

});

$(document).on('click', '.edit-salary-scale', function () {
    $('#salary-scale-edit').val($('#scales :selected').text());
});

$(document).on('click', '#save-changes-salary-scale', function () {
    if (isEditSalaryValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("principals.aspx/updateScale", {
            id: $('#scales').val(),
            scale: $('#salary-scale-edit').val()
        }).then(function (response) {

            swal('Successfully Updated!', 'Item has been successfully updated.', 'success');

            scales(principalID);

            $('.fa-spin').addClass('hidden');
            $('.close').click();

        }).run();
    }

});

$(document).on('click', '.edit', function () {
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

            setTimeout(function () {
                window.location.reload();
            }, 3000);

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
            (new http).post("agents.aspx/delete", {
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
    var a = $("#position").validate(['required']).displayErrorOn($("#error-position"));
    var b = $("#income").validate(['required']).displayErrorOn($("#error-income"));
    var c = $("#monthly").validate(['required']).displayErrorOn($("#error-monthly"));
    var d = $("#daily").validate(['required']).displayErrorOn($("#error-daily"));
    var e = $("#percentage").validate(['required']).displayErrorOn($("#error-percentage"));
    var f = $("#days").validate(['required']).displayErrorOn($("#error-days"));

    return a && b && c && d && e && f;
}

function isInputEditValid() {
    var a = $("#position-edit").validate(['required']).displayErrorOn($("#error-position-edit"));
    var b = $("#income-edit").validate(['required']).displayErrorOn($("#error-income-edit"));
    var c = $("#monthly-edit").validate(['required']).displayErrorOn($("#error-monthly-edit"));
    var d = $("#daily-edit").validate(['required']).displayErrorOn($("#error-daily-edit"));
    var e = $("#percentage-edit").validate(['required']).displayErrorOn($("#error-percentage-edit"));
    var f = $("#days-edit").validate(['required']).displayErrorOn($("#error-days-edit"));

    return a && b && c && d && e && f;
}

function isSalaryValid() {
    var a = $("#salary-scale").validate(['required']).displayErrorOn($("#error-salary"));

    return a;
}

function isEditSalaryValid() {
    var a = $("#salary-scale-edit").validate(['required']).displayErrorOn($("#error-salary-edit"));

    return a;
}