<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="pay.aspx.cs" Inherits="Seabase.pay" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="content/bootstrap.css" rel="stylesheet" />
<script type="text/javascript" src="f1bd084e-8e75-11ea-8b25-0cc47a792c0a_id_f1bd084e-8e75-11ea-8b25-0cc47a792c0a_files/wz_jsgraphics.js"></script>
    <title></title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 25%;">50.50 THIS MONTH FROM</td>
                    <td style="width: 15%;">EXCHANGE USD-PESO</td>
                    <td>50.500</td>
                    <td>\M</td>
                    <td>{panelon}</td>
                </tr>
                <tr>
                    <td style="width: 25%;">01-Jan-20</td>
                    <td style="width: 15%;">EXCHANGE USD-S$</td>
                    <td>1.329</td>
                    <td></td>
                    <td>{frameon}</td>
                </tr>
                <tr>
                    <td style="width: 25%;">UNTIL</td>
                    <td style="width: 15%;">EXCHANGE S$-PESO</td>
                    <td>38.000</td>
                    <td></td>
                    <td>{windowson}</td>
                </tr>
                <tr>
                    <td style="width: 25%;">31-Jan-20</td>
                    <td style="width: 15%;"></td>
                    <td></td>
                    <td></td>
                    <td>{menucall 1}</td>
                </tr>
            </table>
        </div>
    </div>
    <br />
    <div class="row">
        <div style="width: 100%; margin-left: 15px; margin-top: 50px;">
            <table id="table">
                <thead>
                    <tr>
                        <td>PAY PESO</td>
                        <td>SQ NO</td>
                        <td style="width: 20%;">NAME</td>
                        <td style="width: 20%;">VESSEL</td>
                        <td style="width: 15%;">RANK</td>
                        <td style="width: 10%;">MTHS O.B.</td>
                        <td style="width: 10%;">POB</td>
                        <td>BASIC</td>
                    </tr>
                </thead>
                <tbody id="tbody">

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
        var url = new URL(window.location.href);;

        get(url.searchParams.get("principal"), url.searchParams.get("vessel"));

        var max_day = _days(url.searchParams.get("year"), url.searchParams.get("month"));

        $('.covered-start').text('01-' + url.searchParams.get("month") + '-' + url.searchParams.get("year"));
        $('.covered-end').text(max_day + '-' + url.searchParams.get("month") + '-' + url.searchParams.get("year"));
        $('.days').text(max_day);
        $('.sick').text(url.searchParams.get("sick"));
    });

    function _days(year, month) {
        return new Date(year, month, 0).getDate(); // 0 + number of days
    }

     function get(principalID, vesselID) {

        var html = "";

        (new http).post("payslips.aspx/get", {
            principalID: principalID,
            vesselID: vesselID
        }).then(function (response) {

            var i = 1;

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {
                    
                    var mtbsob = "";
                    var pob = "";

                    (new http).post("payroll.aspx/get", {
                        principalID: item.PrincipalID,
                        vesselID: item.VesselID,
                        rankID: item.RankID,
                        crewID: item.CrewID
                    }).then(function (response) {
                        var adds = response.d.map(add => {
                            return new Promise(function (resolve, reject) {

                                mtbsob = add.MTHSOB;
                                pob = add.POB;

                                resolve();
                            });
                        });

                        Promise.all(items).then(function () {
                            if (item.Income.includes('Basic Pay') || item.Income.includes('Basic Salary')) {

                                daily = parseFloat(item.Daily);

                                html = "<tr>" +
                                            "<td></td>" +
                                            "<td>" + i + "</td>" +
                                            "<td>" + item.Crew + "</td>" +
                                            "<td>" + item.Vessel + "</td>" +
                                            "<td>" + item.Rank + "</td>" +
                                            "<td>" + mtbsob + "</td>" +
                                            "<td>" + pob + "</td>" +
                                            "<td>" + item.Monthly + "</td></tr>";

                                $('#tbody').append(html);

                                i++;
                            }
                        });
                    }).run();

                    resolve();

                     
                });

               
            });

            Promise.all(items).then(function () {
            });
        }).run();
    }    
</script>
</html>