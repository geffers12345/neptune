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
    all_vessels();
});

function users() {
    (new http).post("accounts.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#user').append("<option value=\"" + item.ID + "\">" + item.Firstname + ' ' + item.Lastname + "</option>");
        });
    }).run();
}


function all_vessels() {

    (new http).post("_vessels.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#vessel').append("<option value=\"" + item.Name + "\">" + item.Name + "</option>");
        });
    }).run();
}

function principals() {
    (new http).post("principals.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#principal').append("<option value=\"" + item.Principal + "\">" + item.Principal + "</option>");
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

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#principal').val();
            var age = data[0];
            if ($('#principal').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#vessel').val();
            var age = data[1];
            if ($('#vessel').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"20\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("crews.aspx/get", {

    }).then(function (response) {

        var html = "";

        var items = response.d.map(item => {

            return new Promise(function (resolve, reject) {

                if (item.Principal != "") {
                    html += "<tr>" +
                        "<td>" + item.Principal + "</td>" +
                        "<td>" + item.Vessel + "</td>" +
                        "<td>" + item.Lastname + ', ' + item.Firstname + "</td>" +
                        "<td>" + item.Rank + "</td>";

                    html += "<td class='noExl'>" +
                        "<a href='/applicant?_hsdlwhx=" + item.ID + "'><i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\">" +
                        "<span class=\"tooltiptext\">Click to modify details</span>" +
                        "</i></a>";

                    html += "</td>" +
                        "</tr>";
                }

                $('#tbody').append(html);

                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            table = $('#table').DataTable();
        });

    }).run();
}

$('#principal, #vessel').change(function () {
    table.draw();
});

$(document).on('click', '.view', function () {
    var jID = $(this).data('id');

    var url = '/assignment?_xkwhd=' + jID;

    $(window.location).attr('href', url);
});

$(document).on('click', '.edit', function () {
    var number = $(this).data('id');
    var pID = $(this).data('pid');

    var url = '/assignment?_xkwhd=' + number + '&_pgksjd=' + pID + '';

    $(window.location).attr('href', url);
});

$(document).on('click', '.send-jo', function () {
    id = $(this).data('id');

    (new http).post("joborders.aspx/send", {
        id: id
    }).then(function (response) {
        swal('Successfully Sent', 'Job Order Has Been Sent to Principal!', 'success');
        get();
    }).run();
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
            (new http).post("joborders.aspx/delete", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Deactivated', 'Cash Advance Has Been Disapproved!', 'success');
                get();
            }).run();
        }
    })
});

$(document).on('click', '#add-row', function (e) {
    e.preventDefault();

    if (isCrewValid()) {

        $('#tbody-items').append('<tr>' +
                                '<td>' + $('#rank :selected').text() + '</td>' +
                                '<td>' + $('#crew :selected').text() + '</td>' +
                                '<td><i data-id="' + index + '" class="fa fa-trash remove-item"></td>' +
                             '</tr>');

        items.set(index, {
            id: index,
            rank: $('#rank').val(),
            crew: $('#crew').val()
        });

        index++;

        $("#rank").val('');
        $("#crew").val('');

        $('#add-item-modal .close').click();
    }
});

$(document).on('click', '.remove-item', function () {

    var id = $(this).data('id');

    $(this).closest('tr').remove();

    items.forEach(function (i) {

        if (id == i.id) {

            items.delete(id);
        }
    });
});


$(document).on('click', '#save', function (e) {
    e.preventDefault();

    if (hasValues()) {
        (new http).post('joborders.aspx/insert', {
            number: parseInt($('#id-number').val()),
            principalID: parseInt($('#principal').val()),
            source: $('#source').val(),
            requested_by: $('#requested').val(),
            userID: $('#user').val(),
            date: $('#recieved-date').val(),
            vesselID: $('#vessel').val(),
            group: $('#group').val(),
            remarks: $('#remarks').val()
        }).then(function (data) {

            var jID = data.d;

            items.forEach(function (item) {
                (new http).post('joborders.aspx/insert_lineup', {
                    joID: parseInt(jID),
                    rank: parseInt(item.rank),
                    crew: item.crew
                }).then(function (data) {

                }).run();
            });

            swal('Successfully Saved!', 'Item Has Been Saved!', 'success');
            $('.fa-spin').addClass('hidden');
            $('.close').click();

            get();

        }).run();
    }
});

function hasValues() {
    var a = $("#requested").validate(['required']).displayErrorOn($("#error-requested"));
    var b = $("#principal").validate(['required']).displayErrorOn($("#error-principal"));
    var c = $("#vessel").validate(['required']).displayErrorOn($("#error-vessel"));

    return a && b && c;
}

function isCrewValid() {
    var a = $("#rank").validate(['required']).displayErrorOn($("#error-rank"));
    var b = $("#crew").validate(['required']).displayErrorOn($("#error-crew"));

    return a && b;
}

function details(id) {
    $('#tbody-items').text('');

    $('#tbody-items').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("joborders.aspx/get_lineups", {
        id: id,
    }).then(function (response) {

        var i = 1;

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + i + "</td>" +
                           "<td>" + item.Name + "</td>" +
                           "<td>" + item.Firstname + ' ' + item.Lastname + "</td>" +
                    //           "<td>" +
                    //               "<i data-id=\"" + item.InvoiceNumber + "\" data-pid='" + item.ID + "' class=\"fa fa-search view-item\"> " +
                    //                   "<span class=\"tooltiptext\">Click to view</span>" +
                    //               "</i>";
                    //html += "<i data-id=\"" + item.InvoiceNumber + "\" data-pid='" + item.ID + "' class=\"fa fa-edit edit-item\">" +
                    //            "<span class=\"tooltiptext\">Click to edit</span>" +
                    //        "</i>" +
                    //        "<i data-id=\"" + item.InvoiceNumber + "\" data-pid='" + item.ID + "' class=\"fa fa-remove delete-item\">" +
                    //            "<span class=\"tooltiptext\">Click to remove</span>" +
                    //        "</i></td>" +
                           "</tr>";

                i++;

                $('#tbody-items').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#table-items').DataTable();
        });
    }).run();
}

function getManilaTime() {
    var options = {
        timeZone: 'Asia/Manila',
        year: 'numeric', month: 'numeric', day: 'numeric',
        hour: 'numeric', minute: 'numeric', second: 'numeric',
    },

        formatter = new Intl.DateTimeFormat([], options)
    return formatter.format(new Date())
}
