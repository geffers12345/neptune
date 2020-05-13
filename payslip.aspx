<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payslip.aspx.cs" Inherits="Seabase.payslip" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="content/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
span.cls_002{font-family:"Monotype Corsiva",serif;font-size:3rem;color:rgb(0,0,0);font-weight:normal;font-style:italic;text-decoration: none}
div.cls_002{font-family:"Monotype Corsiva",serif;font-size:2rem;color:rgb(0,0,0);font-weight:normal;font-style:italic;text-decoration: none}
span.cls_003{font-family:Arial,serif;font-size:6.6px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
div.cls_003{font-family:Arial,serif;font-size:6.6px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
span.cls_004{font-family:Arial,serif;font-size:7.9px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}
div.cls_004{font-family:Arial,serif;font-size:7.9px;color:rgb(0,0,0);font-weight:normal;font-style:normal;text-decoration: none}

table {
    border: 1px solid #000;
}

table td {
    padding: 5px;
}
</style>
<script type="text/javascript" src="f1bd084e-8e75-11ea-8b25-0cc47a792c0a_id_f1bd084e-8e75-11ea-8b25-0cc47a792c0a_files/wz_jsgraphics.js"></script>
    <title></title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <span class="cls_002"><i>Conautic Maritime Inc.</i></span>
            <p class="cls_003">Suite 312 Penthouse Ermita Center Bldg.<br />
            # 1350 Roxas Blvd., Ermita, Manila, Philippines<br />
            Tel. +632 5280409 . 5277596 . Fax: 5672120<br />
            Email: cmi@conautic.com
            </p>
        </div>
    </div>
    <br />
    <div class="row">
        <div style="width: 500px; position: absolute; margin-left: 15px;">
            <table>
                <tr>
                    <td>Name:</td>
                    <td id="fullname"></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td id="address"></td>
                </tr>
            </table>
        </div>

        <div style="width: 500px; position: absolute; right: 20px;">
            <table style="width: 100%">
                <tr>
                    <td>Vessel:</td>
                    <td id="vessel"></td>
                    <td>Wage Account for the month:</td>
                    <td id="monthly-wage"></td>
                </tr>
                <tr>
                    <td>Flag:</td>
                    <td id="flag"></td>
                    <td>Exchange Rate USD/S$-Peso:</td>
                    <td id="exchange-rate"></td>
                </tr>
                <tr>
                    <td>Rank/Position:</td>
                    <td id="position"></td>
                    <td>Leave Pay:</td>
                    <td id="leave-pay"></td>
                </tr>
                <tr>
                    <td>No. of Contract:</td>
                    <td id="contract"></td>
                    <td>Rej Bonus:</td>
                    <td id="rej-bonus"></td>
                </tr>
                <tr>
                    <td>Wage Increase:</td>
                    <td id="wage-increase">Y</td>
                    <td>Christmas Bonus:</td>
                    <td id="xmas-bonus"></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Pension Fund:</td>
                    <td id="pension-fund"></td>
                </tr>
            </table>
        </div>
    </div>

    <div class="row">
        <div style="width: 500px; position: absolute; margin-left: 15px; margin-top: 215px;">
            <table>
                <thead>
                    <tr>
                        <td>Wage Info</td>
                        <td>/Month</td>
                        <td>/Day</td>
                    </tr>
                </thead>
                <tbody id="salary-tbody">
                </tbody>
            </table>
        </div>
        <div style="width: 500px; position: absolute; right: 0; margin-top: 215px;">
            <table>
                <thead>
                    <tr>
                        <td></td>
                        <td>FROM</td>
                        <td>UNTIL</td>
                        <td>DAYS</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Period Covered</td>
                        <td class="covered-start"></td>
                        <td class="covered-end"></td>
                        <td class="days"></td>
                    </tr>
                    <tr>
                        <td>Contract Runs/Runned</td>
                        <td class="covered-start"></td>
                        <td>*******</td>
                        <td class="days"></td>
                    </tr>
                    <tr>
                        <td>Sick /ST BY</td>
                        <td>*******</td>
                        <td>*******</td>
                        <td class="sick"></td>
                    </tr>
                    <tr>
                        <td>Contract Days This Month</td>
                        <td class="covered-start"></td>
                        <td class="covered-end"></td>
                        <td class="days"></td>
                    </tr>
                    <tr>
                        <td>Sick Days this Month</td>
                        <td>*******</td>
                        <td>*******</td>
                        <td class="sick"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <style>
        table td {
            border: 1px solid #000;
        }
    </style>

    <div class="row">
        <div style="width: 83%; position: absolute; margin-left: 15px; margin-top: 450px;">
            <table style="width: 100%; margin-bottom: 20px" id="ps">
                <thead>
                    <tr>
                        <td>Date</td>
                        <td>Description</td>
                        <td>/Day</td>
                        <td>/Days</td>
                        <td>Amount in Phil <br />Peso/Other <br /> Curr</td>
                        <td>Pay</td>
                        <td>Deduct</td>
                        <td>Balance</td>
                        <td>Amount End <br />of Contract<br />(Leave)</td>
                        <td>Amount <br /> Next <br /> Contract <br/>(RB BNS)</td>
                        <td>Remarks</td>
                    </tr>
                </thead>
                <tbody id="payslip-tbody">
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
<script src="scripts/jquery-1.10.2.js"></script>
<script src="scripts/bootstrap.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script>

    var id = 0;
    var currentVessel = 0;

    $(document).ready(function () {
        var url = new URL(window.location.href);
        applicantID = url.searchParams.get("crewid");

        applicant(applicantID);

        var max_day = _days(url.searchParams.get("year"), url.searchParams.get("month"));

        $('.covered-start').text('01-' + url.searchParams.get("month") + '-' + url.searchParams.get("year"));
        $('.covered-end').text(max_day + '-' + url.searchParams.get("month") + '-' + url.searchParams.get("year"));
        $('.days').text(max_day);
        $('.sick').text(url.searchParams.get("sick"));
    });

    function _days(year, month) {
        return new Date(year, month, 0).getDate(); // 0 + number of days
    }

    function applicant(id) {
        (new http).post("applicants.aspx/applicant", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#fullname').text(item.Lastname + ', ' + item.Firstname + ' ' + item.Middlename);
            
            $('#position').text(item.Rank);
            $('#vessel').text(item.Vessel);

            $('#address').html(item.NoOrBldg + ' ' +  item.StreetOrBrgy + ' ' + item.Municipality + ' ' + item.Province);

            find_flags(item.VesselID);
            crewEmbark(id, item.VesselID);
            rankSalary(item.RankID);

            currentVessel = item.VesselID;

            _vessel(item.VesselID, item.RankID)

        }).run();
    }

    function find_flags(id) {

        (new http).post("_vessels.aspx/find_flags", {
            id: id
        }).then(function (response) {

            var items = response.d.map(item => {

                $('#flag').append(item.Flag);

                return item.Flag;
            });

        }).run();
    }

     function crewEmbark(crewID, vesselID) {

        (new http).post("embarkations.aspx/crewEmbark", {
            crewID: crewID,
            vesselID: vesselID
        }).then(function (response) {
            $('#contract').text(response.d[0].Duration + ' mos.');
        }).run();
    }

    function rankSalary(rankID) {

        (new http).post("scales.aspx/getByVessel", {
            rankID: parseInt(rankID),
            vesselID: 0,
            scaleID: 0
        }).then(function (response) {

            var items = response.d.map(item => {

                return new Promise(function (resolve, reject) {

                    if (item.Income.includes('Basic')) {
                        $('#monthly-wage').text(parseFloat(item.Monthly));
                    }

                    if (item.Income.includes('Salary')) {
                        $('#monthly-wage').text(parseFloat(item.Monthly));
                    }

                    if (item.Income.includes('Rejoining Bonus') || item.Income.includes('Rejoining') || item.Income.includes('Rejoining')) {
                        $('#rej-bonus').text(parseFloat(item.Monthly));
                    }

                    if (item.Income.includes('Vacation') || item.Income.includes('vacation') || item.Income.includes('Leave')) {
                        $('#leave-pay').text(parseFloat(item.Monthly));
                    }

                    if (item.Income.includes('Christmas') || item.Income.includes('xmas')) {
                        $('#xmas-bonus').text(parseFloat(item.Monthly));
                    }

                     if (item.Income.includes('Pension Fund') || item.Income.includes('Pension')) {
                        $('#pension-fund').text(parseFloat(item.Monthly));
                    }

                    resolve();
                });
            });

            Promise.all(items).then(function () {
                
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

            var html = "";
            var url = new URL(window.location.href);
            var max_day = _days(url.searchParams.get("year"), url.searchParams.get("month"));
            var leave = "";
            var rejoining = "";

            var items = response.d.map(item => {

                if (item.Income.includes('Leave Pay') || item.Income.includes('Leave')) {
                        leave = parseFloat(item.Monthly);
                }

                if (item.Income.includes('Rejoining Bonus') || item.Income.includes('Rejoining')) {
                    rejoining = parseFloat(item.Monthly);
                }

                return new Promise(function (resolve, reject) {

                    if (item.VesselID == currentVessel) {
                        if (item.ForTotal === 1) {
                            monthly += item.Monthly;
                            daily += item.Daily;

                            strMonthly = "<tr class='total-crew-salary' id='" + rankID + "'>" +
                                "<td style='text-align: left !important;'><b>Total</b></td>" +
                                "<td style='text-align: right !important;'><b>" + parseFloat(monthly).toFixed(2) + "</b></td>" +
                                "<td style='text-align: right !important;'><b>" + parseFloat(daily).toFixed(2) + "</b></td>" +
                                "</tr>";

                            classtotal = "for-total-" + item.ForTotal + "-" + item.RankID;
                            rank = item.Rank;

                            fortotalHtml += "<tr><td style='text-align: left !important'>" + i + ") " + item.Income + "</td>" +
                                "<td style='text-align: right !important'>" + item.Monthly + "</td>" +
                                "<td style='text-align: right !important'>" + item.Daily + "</td>" +
                                "</tr>";

                            html = "<tr><td style='text-align: left !important'>" +
                                max_day + '-' + url.searchParams.get("month") + '-' + url.searchParams.get("year")
                                + "</td>" +
                                    "<td style='text-align: left !important'>" + item.Income + "</td>" +
                                    "<td style='text-align: right !important'>" + item.Daily + "</td>" +
                                    "<td style='text-align: right !important'>" + max_day + "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(item.Daily * max_day).toFixed(2) + "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" + monthly + "</td>" +
                                    "<td style='text-align: right !important'>" + leave + "</td>" +
                                    "<td style='text-align: right !important'>" + rejoining + "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                "</tr>";
                            leave = "";
                            rejoining = "";

                            $('#payslip-tbody').append(html);

                        } else {

                            notfortotalHtml += "<tr><td style='text-align: left !important'>" + i + ") " + item.Income + "</td>" +
                                "<td style='text-align: right !important'>" + item.Monthly + "</td>" +
                                "<td style='text-align: right !important'>" + item.Daily + "</td>" +
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

                $('#salary-tbody').append(fortotalHtml);
                $('#salary-tbody').append(notfortotalHtml);

                //sss
                $('#payslip-tbody').append("<tr><td></td>" +
                                    "<td style='text-align: left !important'>SSS/PHIC</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" +
                                         + parseFloat(url.searchParams.get("sss") * url.searchParams.get("amount")) + 
                                    "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(url.searchParams.get("sss")) + "</td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(monthly - url.searchParams.get("sss")) + "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                    "</tr>");

                monthly = parseFloat(monthly - url.searchParams.get("sss"));
                //end sss

                //pagibig
                $('#payslip-tbody').append("<tr><td></td>" +
                                    "<td style='text-align: left !important'>PAG-IBIG FUND</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" +
                                         + parseFloat(url.searchParams.get("pagibig") * url.searchParams.get("amount")) + 
                                    "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(url.searchParams.get("pagibig")) + "</td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(monthly - url.searchParams.get("pagibig")) + "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                    "</tr>");

                monthly = parseFloat(monthly - url.searchParams.get("pagibig"));
                //end pagibig

                //owwa
                $('#payslip-tbody').append("<tr><td></td>" +
                                    "<td style='text-align: left !important'>OWWA/SWF</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" +
                                         + parseFloat(url.searchParams.get("owwa") * url.searchParams.get("amount")) + 
                                    "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(url.searchParams.get("owwa")) + "</td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(monthly - url.searchParams.get("owwa")) + "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                    "</tr>");

                monthly = parseFloat(monthly - url.searchParams.get("owwa"));
                //end owwa

                //CASH ADVANCE MANILA
                $('#payslip-tbody').append("<tr><td></td>" +
                                    "<td style='text-align: left !important'>CASH ADVANCE MANILA</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" +
                                         + parseFloat(url.searchParams.get("manila") * url.searchParams.get("amount")) + 
                                    "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(url.searchParams.get("manila")) + "</td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(monthly - url.searchParams.get("manila")) + "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                    "</tr>");

                monthly = parseFloat(monthly - url.searchParams.get("manila"));
                //end CASH ADVANCE MANILA

                //CASH ADVANCE EUR/FE
                $('#payslip-tbody').append("<tr><td></td>" +
                                    "<td style='text-align: left !important'>CASH ADVANCE EUR/FE</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" +
                                         + parseFloat(url.searchParams.get("eur") * url.searchParams.get("amount")) + 
                                    "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(url.searchParams.get("eur")) + "</td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(monthly - url.searchParams.get("eur")) + "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                    "</tr>");

                monthly = parseFloat(monthly - url.searchParams.get("eur"));
                //end CASH ADVANCE EUR/FE

                //REMITTANCE MANILA
                $('#payslip-tbody').append("<tr><td></td>" +
                                    "<td style='text-align: left !important'>REMITTANCE MANILA</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" +
                                         + parseFloat(url.searchParams.get("remit") * url.searchParams.get("amount")) + 
                                    "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(url.searchParams.get("remit")) + "</td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(monthly - url.searchParams.get("remit")) + "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                    "</tr>");

                monthly = parseFloat(monthly - url.searchParams.get("remit"));
                //end REMITTANCE MANILA

                //PERSONAL LOAN
                $('#payslip-tbody').append("<tr><td></td>" +
                                    "<td style='text-align: left !important'>PERSONAL LOAN</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" +
                                         + parseFloat(url.searchParams.get("loan") * url.searchParams.get("amount")) + 
                                    "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(url.searchParams.get("loan")) + "</td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(monthly - url.searchParams.get("loan")) + "</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                    "</tr>");

                monthly = parseFloat(monthly - url.searchParams.get("loan"));
                //end PERSONAL LOAN

                //Balance
                $('#payslip-tbody').append("<tr><td>" +
                                    max_day + '-' + url.searchParams.get("month") + '-' + url.searchParams.get("year")
                                    + "</td>" +
                                    "<td style='text-align: left !important'>BALANCE THIS MONTH</td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'></td>" +
                                    "<td style='text-align: right !important'>" + parseFloat(monthly) + "</td>" +
                                    "<td colspan='10'>" + $('#fullname').text() + "</td>" +
                    "</tr>");
                //end balance

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

    function _vessel(id, rankID) {

        (new http).post("_vessels.aspx/find", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            console.log(item.PrincipalID);

            mySalary(rankID, id, item.PrincipalID);

        }).run();
    }
</script>
</html>
