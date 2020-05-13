<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="all-salaries.aspx.cs" Inherits="Seabase.all_salaries" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <meta http-equiv="X-UA-Compatible" content="chrome=1"/>
    <link rel="icon" href="Content/img/yellowhub.png" sizes="32x32"/>
    <link href="content/css/bootstrap-3.3.7.min.css" rel="stylesheet" />
    <link href="content/css/font-awesome-4.7.0.min.css" rel="stylesheet" />
    <link href="content/css/ionicons-2.0.1.min.css" rel="stylesheet" />
    <link href="content/css/jquery-jvectormap-2.0.4.min.css" rel="stylesheet" />
    <link href="content/css/AdminLTE.min.css" rel="stylesheet" />
    <link href="content/css/sweetalert2.min.css" rel="stylesheet" />
    <link href="content/css/skins/_all-skins.min.css" rel="stylesheet" />
    <link href="content/css/animate.min.css" rel="stylesheet" />
    <link href="content/css/customize.css" rel="stylesheet" />
    <link href="content/css/select2-4.0.6.min.css" rel="stylesheet" />
    <link href="content/css/fonts.min.css" rel="stylesheet" />
    <link href="content/css/jquery.dataTables.css" rel="stylesheet" />
    <link href="content/css/jquerysctipttop.css" rel="stylesheet" />
    <link href="content/css/bootstrap-select.css" rel="stylesheet" />
    <link href="content/css/richtext.min.css" rel="stylesheet" />
    <link href="content/css/fullcalendar-3.9.0.min.css" rel="stylesheet" />
    <link href="content/css/fullcalendar-3.9.0.print.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
    <title>All Salaries</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table id="table-salary">
                        <thead>
                            <tr>
                                <td>Rank/Position</td>
                                <td>Income Description</td>
                                <td>Monthly (USD)</td>
                                <td>Daily (USD)</td>
                                <td>Percentage</td>
                                <td>Days</td>
                                <td>Remarks</td>
                            </tr>
                        </thead>
                        <tbody id="salary-tbody">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="Scripts/jquery.min.js"></script>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/jquery-ui.min.js"></script>
<script src="Scripts/bootstrap-3.3.7.min.js"></script>
<script src="Scripts/fastclick.min.js"></script>
<script src="Scripts/adminlte.min.js"></script>
<script src="Scripts/jquery.sparkline.min.js"></script>
<script src="Scripts/jquery.slimscroll.min.js"></script>
<script src="Scripts/Chart.min.js"></script>
<script src="Scripts/dashboard2.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/demo.js"></script>
<script src="Scripts/jquery.dataTables.js"></script>
<script src="Scripts/sum().js"></script>
<script src="Scripts/select2.min.js"></script>
<script src="Scripts/bootstrap-colorpicker.min.js"></script>
<script src="Scripts/moment.min.js"></script>
<script src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
<script src="Scripts/jquery.richtext.js"></script>
<script src="Scripts/fullcalendar.min.js"></script>
<script>

     var id = 0;

    $(document).ready(function () {
        var url = new URL(window.location.href);
        id = url.searchParams.get("_hsdlwhx");

        embarkations(id);
    });

    function embarkations(id) {
        (new http).post("all-salaries.aspx/crew_embarkations", {
            id: id
        }).then(function (response) {

            var items = response.d.map(item => {
                mySalary(item.RankID, item.VesselID, item.PrincipalID);
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

                    resolve();
                });
            });

            Promise.all(items).then(function () {

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
            });
        }).run();
    }
</script>
</html>
