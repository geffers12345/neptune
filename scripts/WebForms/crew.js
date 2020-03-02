var table;

$(document).ready(function () {
    var url = new URL(window.location.href);
    var id = url.searchParams.get("_knmsdlpsjsw");


    if(id == null) {
        get();
    } else {
        find(id);
    }

    ranks();
    principals();
    all_vessels();
});

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
        default:
            // code block
    }

    return status;
}

function get() {
    $('#tbody').text('');

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#rank').val();
            var age = data[2];
            if ($('#rank').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#principal').val();
            var age = data[4];
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
            var age = data[5];
            if ($('#vessel').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#status').val();
            var age = data[11];
            if ($('#status').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#municipality').val();
            var age = data[14];
            if ($('#municipality').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"20\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("crews.aspx/get", {

    }).then(function (response) {

        var municipalities = [];

        response.d.map(item => {

            var html = "";
            //getting numbers

            var today = getManilaTime().split(',')[0];
            var d = today.split('/');

            var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
            var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

            var formattedDate = d[2] + '-' + d0 + '-' + d1;

            (new http).post("applicant.aspx/numbers", {
                id: item.ID,
                date: formattedDate
            }).then(function (response) {

                var items = response.d.map(n => {

                    return new Promise(function (resolve, reject) {

                    status = statuses(item.StatusID);

                    var isActive = item.DateDeleted == "" ? "Activated" : "Not Activated";

                    var active = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Firstname + "\" class=\"fa fa-remove remove\">" +
                        "<span class=\"tooltiptext\">Click to deactivate</span>" +
                        "</i>";
                    var inactive = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Firstname + "\" class=\"fa fa-check-circle activate\">" +
                        "<span class=\"tooltiptext\">Click to activate</span>" +
                        "</i>";

                    var statusAction = isActive == "Not Activated" ? inactive : active;

                    html += "<tr>" +
                        "<td><a href='/applicant?_hsdlwhx=" + item.ID + "'>" + item.Lastname + ', ' + item.Firstname + "</a></td>" +
                        "<td class='noExl'><img src='content/img/crews/" + item.ImagePath + "' class='img-responsive img-circle img-thumbnail'/></td>" +
                        "<td>" + item.Rank + "</td>" +
                        "<td>" + item.Cellphone + "</td>" +
                        "<td>" + item.Principal + "</td>" +
                        "<td>" + item.Vessel + "</td>";

                    html += "<td>" + n.Passport + "</td>" +
                        "<td>" + n.Seaman + "</td>" +
                        "<td>" + n.SRC + "</td>" +
                        "<td>" + n.Eregistration + "</td>" +
                        "<td>" + n.Age + "</td>" +
                        "<td>" + status + "</td>";

                    html += "<td>" + item.DateUpdated + "</td>" +
                        "<td class='noExl'>" +
                        "<a href='/applicant?_hsdlwhx=" + item.ID + "'><i data-id=\"" + item.ID + "\" class=\"fa fa-search view\"> " +
                        "<span class=\"tooltiptext\">Click to view details</span>" +
                        "</i></a>";
                    html += "<a href='/applicant?_hsdlwhx=" + item.ID + "'><i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\">" +
                        "<span class=\"tooltiptext\">Click to modify details</span>" +
                        "</i></a>";

                    html += "</td><td class='hidden'>" + item.Municipality + "</td>" +
                        "</tr>";

                        if (!municipalities.includes(item.Municipality)) {
                            municipalities.push(item.Municipality);

                            municipality(item.Municipality);
                        }

                        $('#tbody').append(html);

                        resolve();
                    });
                });

                Promise.all(items).then(function () {
                    $('.loading').remove();
                    setTimeout(function () {
                        table = $('#table').DataTable();
                    }, 3000);
                });

            }).run();
        });
    }).run();
}

$('#rank, #principal, #vessel, #status, #municipality').change(function () {
    table.draw();
});

function find(statusID) {
    $('#tbody').text('');

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#rank').val();
            var age = data[2];
            if ($('#rank').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#principal').val();
            var age = data[4];
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
            var age = data[5];
            if ($('#vessel').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#status').val();
            var age = data[6];
            if ($('#status').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var office = $('#municipality').val();
            var age = data[14];
            if ($('#municipality').val() != '') {
                return age == office;
            } else {
                return true;
            }
        }
    );

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("crews.aspx/crew", {
        statusID: statusID
    }).then(function (response) {

        var municipalities = [];

        response.d.map(item => {

            var html = "";
            //getting numbers

            var today = getManilaTime().split(',')[0];
            var d = today.split('/');

            var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
            var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

            var formattedDate = d[2] + '-' + d0 + '-' + d1;

            (new http).post("applicant.aspx/numbers", {
                id: item.ID,
                date: formattedDate
            }).then(function (response) {

                var items = response.d.map(n => {

                    return new Promise(function (resolve, reject) {

                        status = statuses(item.StatusID);

                        var isActive = item.DateDeleted == "" ? "Activated" : "Not Activated";

                        var active = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Firstname + "\" class=\"fa fa-remove remove\">" +
                            "<span class=\"tooltiptext\">Click to deactivate</span>" +
                            "</i>";
                        var inactive = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Firstname + "\" class=\"fa fa-check-circle activate\">" +
                            "<span class=\"tooltiptext\">Click to activate</span>" +
                            "</i>";

                        var statusAction = isActive == "Not Activated" ? inactive : active;

                        html += "<tr>" +
                            "<td><a href='/applicant?_hsdlwhx=" + item.ID + "'>" + item.Lastname + ', ' + item.Firstname + "</a></td>" +
                            "<td class='noExl'><img src='content/img/crews/" + item.ImagePath + "' class='img-responsive img-circle img-thumbnail'/></td>" +
                            "<td>" + item.Rank + "</td>" +
                            "<td>" + item.Cellphone + "</td>" +
                            "<td>" + item.Principal + "</td>" +
                            "<td>" + item.Vessel + "</td>";

                        html += "<td>" + n.Passport + "</td>" +
                            "<td>" + n.Seaman + "</td>" +
                            "<td>" + n.SRC + "</td>" +
                            "<td>" + n.Eregistration + "</td>" +
                            "<td>" + n.Age + "</td>" +
                            "<td>" + status + "</td>";

                        html += "<td>" + item.DateUpdated + "</td>" +
                            "<td class='noExl'>" +
                            "<a href='/applicant?_hsdlwhx=" + item.ID + "'><i data-id=\"" + item.ID + "\" class=\"fa fa-search view\"> " +
                            "<span class=\"tooltiptext\">Click to view details</span>" +
                            "</i></a>";
                        html += "<a href='/applicant?_hsdlwhx=" + item.ID + "'><i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\">" +
                            "<span class=\"tooltiptext\">Click to modify details</span>" +
                            "</i></a>";

                        html += "</td><td class='hidden'>" + item.Municipality + "</td>" +
                            "</tr>";

                        if (!municipalities.includes(item.Municipality)) {
                            municipalities.push(item.Municipality);

                            municipality(item.Municipality);
                        }

                        $('#tbody').append(html);

                        resolve();
                    });
                });

                Promise.all(items).then(function () {
                    $('.loading').remove();
                    setTimeout(function () {
                        table = $('#table').DataTable();
                    }, 3000);
                });

            }).run();
        });
    }).run();
}

function municipality(item) {
    $('#municipality').append("<option value=\"" + item + "\">" + item + "</option>");
}

function ranks() {
    (new http).post("ranks.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#rank').append("<option value=\"" + item.Name + "\">" + item.Name + "</option>");
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

function all_vessels() {
    (new http).post("_vessels.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#vessel').append("<option value=\"" + item.Name + "\">" + item.Name + "</option>");
        });
    }).run();
}

$('#generateExcel').click(function (e) {
    e.preventDefault();

    var d = new Date();
    var date = d.toString().split(" ").slice(0, 4).join(" ");

    $("#table").table2excel({
        filename: "Crews (" + date + ").xls",
        exclude: ".noExl"
    });
});

function getManilaTime() {
    var options = {
        timeZone: 'Asia/Manila',
        year: 'numeric', month: 'numeric', day: 'numeric',
        hour: 'numeric', minute: 'numeric', second: 'numeric',
    },

        formatter = new Intl.DateTimeFormat([], options)
    return formatter.format(new Date())
}
