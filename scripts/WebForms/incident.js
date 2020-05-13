var table;

$(document).ready(function () {
    vessels();
    ranks();
    get();
});

function ranks() {
    (new http).post("ranks.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#rank').append("<option value=\"" + item.Name + "\">" + item.Name + "</option>");
        });
    }).run();
}

function vessels() {
    (new http).post("_vessels.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#vessel').append("<option value=\"" + item.Name + "\">" + item.Name + "</option>");
        });
    }).run();
}

function get() {
    $('#tbody').empty().append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#vessel').val();
            var age = data[0];
            if ($('#vessel').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#rank').val();
            var age = data[1];
            if ($('#rank').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#status').val();
            var age = data[8];
            if ($('#status').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    (new http).post("applicant.aspx/all_crew_incidents", {
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

$('#rank, #vessel, #status').change(function () {
    table.draw();
});

function isInputValid() {
    var a = $("#principal").validate(['required']).displayErrorOn($("#error-principal"));
    var b = $("#vessel").validate(['required']).displayErrorOn($("#error-vessel"));

    return a && b;
}

$('#generateExcel').click(function (e) {
    e.preventDefault();

    var d = new Date();
    var date = d.toString().split(" ").slice(0, 4).join(" ");

    $("#table").table2excel({
        filename: "Incidents (" + date + ").xls",
        exclude: ".noExl"
    });
});