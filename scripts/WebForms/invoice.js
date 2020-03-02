var id = 0;
var table;
var items = new Map();
var index = 1;
var total = 0;

$(document).ready(function () {
    $('#id-number').val(Math.floor(Math.random() * 123123123));

    get();
    principals();
});


function principals() {
    (new http).post("principals.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#principal').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
        });
    }).run();
}

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("invoices.aspx/get", {}).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.ID + "</td>" +
                           "<td>" + item.InvoiceNumber + "</td>" +
                           "<td>" + item.Principal + "</td>" +
                           "<td>" + item.Total + "</td>" +
                           "<td>" + item.DateCreated + "</td>" +
                           "<td>" +
                               "<i data-id=\"" + item.InvoiceNumber + "\" data-pid='" + item.ID + "' class=\"fa fa-search view\"> " +
                                   "<span class=\"tooltiptext\">Click to view</span>" +
                               "</i>";
                    html += "<i data-id=\"" + item.InvoiceNumber + "\" data-pid='" + item.ID + "' class=\"fa fa-edit edit\">" +
                                "<span class=\"tooltiptext\">Click to edit</span>" +
                            "</i>" +
                            "<i data-id=\"" + item.InvoiceNumber + "\" data-pid='" + item.ID + "' class=\"fa fa-remove delete\">" +
                                "<span class=\"tooltiptext\">Click to remove</span>" +
                            "</i></td>" +
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

$(document).on('click', '.view', function () {
    var number = $(this).data('id');
    var pID = $(this).data('pid');

    var url = '/invoice?_xkwhd=' + number + '&_pgksjd=' + pID + '';

    $(window.location).attr('href', url);
});

$(document).on('click', '.edit', function () {
    var number = $(this).data('id');
    var pID = $(this).data('pid');

    var url = '/invoice?_xkwhd=' + number + '&_pgksjd=' + pID + '';

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
            (new http).post("invoices.aspx/deactivate", {
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

    if (hasValues()) {

        total += parseFloat($('#quantity').val() * $('#price').val());

        $('#tbody-items').append('<tr>' +
                                '<td>' + $('#item').val() + '</td>' +
                                '<td>' + $('#quantity').val() + '</td>' +
                                '<td>' + $('#price').val() + '</td>' +
                                '<td>' + parseFloat($('#quantity').val() * $('#price').val()) + '</td>' +
                                '<td><i data-id="' + index + '" class="fa fa-trash remove-item"></td>' +
                             '</tr>');

        items.set(index, {
            id: index,
            principalID: $('#principal').val(),
            number: $('#id-number').val(),
            item: $('#item').val(),
            quantity: $('#quantity').val(),
            price: $('#price').val(),
            total: parseFloat($('#quantity').val() * $('#price').val())
        });

        $('#total').text('P ' + total.toFixed(2));

        index++;

        $("#item").val('');
        $("#quantity").val('');
        $("#price").val('');

        $('#add-item-modal .close').click();
    }
});

$(document).on('click', '.remove-item', function () {

    var id = $(this).data('id');

    $(this).closest('tr').remove();

    items.forEach(function (i) {

        if (id == i.id) {

            items.delete(id);

            total -= i.price;
        }
    });

    $('#total').text('P ' + total.toFixed(2));
});


$(document).on('click', '#save', function (e) {
    e.preventDefault();

    items.forEach(function (item) {
        (new http).post('invoices.aspx/insert', {
            principalID: parseInt(item.principalID),
            number: parseInt(item.number),
            item: item.item,
            quantity: parseInt(item.quantity),
            price: parseFloat(item.price),
            total: parseFloat(item.total)
        }).then(function (data) {

        }).run();
    });

    swal('Successfully Saved!', 'Invoice Has Been Saved!', 'success');
    $('.fa-spin').addClass('hidden');
    $('.close').click();

    get();
});

function hasValues() {
    var a = $("#principal").validate(['required']).displayErrorOn($("#error-principal"));
    var b = $("#id-number").validate(['required']).displayErrorOn($("#error-id"));
    var c = $("#item").validate(['required']).displayErrorOn($("#error-item"));
    var d = $("#quantity").validate(['required']).displayErrorOn($("#error-quantity"));
    var e = $("#price").validate(['required']).displayErrorOn($("#error-price"));

    return a && b && c && d && e;
}

function details(principalID, invoice) {
    $('#tbody-items').text('');

    $('#tbody-items').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("invoices.aspx/details", {
        principalID: principalID,
        invoice: invoice
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.ID + "</td>" +
                           "<td>" + item.InvoiceNumber + "</td>" +
                           "<td>" + item.Principal + "</td>" +
                           "<td>" + item.Total + "</td>" +
                           "<td>" + item.DateCreated + "</td>" +
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