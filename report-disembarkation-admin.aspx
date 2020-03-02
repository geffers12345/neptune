<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report-disembarkation-admin.aspx.cs" Inherits="Seabase.report_disembarkation_admin" %>

<!DOCTYPE html>

<html><head>    		
<title>Disembarkation - Administration</title>
<link href="content/css/menu_report.css" rel="stylesheet" />
</head>	
		
<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
<table border="0" cellspacing="0" width="100%" cellpadding="0" align="center">

  
<tbody><tr><td>  
  	<table width="100%" cellpadding="2" cellspacing="2" border="0">
		<tbody><tr><td align="center"><h3>Signed off this month (<span id="sign-off"></span>)</h3></td></tr>
	<tr>
        <td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">

            <tr>
		        <td><i>Name</i></td>
		        <td><i>Position</i></td>
		        <td><i>Vessel</i></td>
		
		        <td><i>Allotm</i></td>
		        <td><i>P.O.B</i></td>
		        <td><i>Depature Vessel</i></td>
		        <td><i>Arr MNL</i></td>
		        <td width="20%"><i>Remarks</i></td>
		        </tr>
		        <tr><td colspan="8"><hr></td></tr>
		    <tbody id="tbody">

		    </tbody>
		</table>
	</td></tr>
		</tbody></table>
</td>
</tr>  
						
</tbody>

</table>
	
	
</body>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script>
    $(document).ready(function () {
        var url = new URL(window.location.href);

        report(url.searchParams.get("principal"), url.searchParams.get("date"));

        $('#sign-off').text(url.searchParams.get("mm") + ' ' + url.searchParams.get("yy"));
    });

    function getManilaTime() {
        var options = {
            timeZone: 'Asia/Manila',
            year: 'numeric', month: 'numeric', day: 'numeric',
            hour: 'numeric', minute: 'numeric', second: 'numeric',
        },

        formatter = new Intl.DateTimeFormat([], options);
        return formatter.format(new Date());
    }

    function report(principal, vessel, rank, stats) {
        $('#tbody').empty();

        (new http).post("disembarkation-admin.aspx/get", {
            principalID: principal,
            date: vessel
        }).then(function (response) {

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

                            html += '<tr>' +
                                        '<td align="left" valign="top">' + item.Lastname + ', ' + item.Firstname + '</td>' +
                                        '<td align="left" valign="top">' + item.Rank + '</td>' +
                                        '<td align="left" valign="top">' + item.Vessel + '</td>' +
                                        '<td align="left" valign="top">$' + item.Monthly + '</td>' +
                                        '<td align="left" valign="top"></td>' +
                                        '<td align="left" valign="top">' + item.DepartureDate + '</td>' +
                                        '<td align="left" valign="top"> ' + item.ArrivalVesselDate + '</td>' +
                                        '<td align="left" valign="top" style="white-space:normal !important;">' + item.Remarks + '</td>' +
		                            '</tr>';

                            $('#tbody').append(html);

                            resolve();
                        });
                    });

                    Promise.all(items).then(function () {
                        $('.loading').remove();
                    });

                }).run();
            });
        }).run();
    }
</script>
</html>
