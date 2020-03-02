$(document).ready(function () {
    get();
});

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("logs.aspx/get", {

    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.ID + "</td>" +
                           "<td style='text-align: left !important;'>" + item.Name + " " + item.Action + "</small></td>" +
                           "<td>" + item.Name + "</td>" +
                           "<td>" + item.DateCreated + "</td>";

                html += "</td>" +
               "</tr>";

                $('#tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#myTable').DataTable({
                "ordering": false
            });
        });
    }).run();
}

$('#generateExcel').click(function () {
    var d = new Date();
    var date = d.toString().split(" ").slice(0, 4).join(" ");

    $("#myTable").table2excel({
        filename: "logs (" + date + ").xls",
        exclude: ".noExl"
    });
});