<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report-service.aspx.cs" Inherits="Seabase.report_service" %>

<!DOCTYPE html>


<html>
<head>    		
<title></title>
<style>
	td { font-family: verdana, arial, Helvetica, sans-serif; font-size:13px;}
	td.report { BORDER-RIGHT: #000000 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #000000 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 11px; PADDING-BOTTOM: 2px; BORDER-LEFT: #000000 1px solid; COLOR: #000000; PADDING-TOP: 2px; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: verdana,arial, helvetica, geneva, sans-serif; BACKGROUND-COLOR: #ffffff;}
	table.report {BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; BORDER-COLLAPSE: collapse; border-spacing: 0}
</style>
</head>	
		
<body marginheight=0 marginwidth=0 leftmargin=0 topmargin=0>
<table border=0 cellspacing=0 width=100% cellpadding=0 align=center>
<tr><td valign="top"> 
		<table width="90%" border="0" align="center">
			<tr height="130px"><td></td></tr>
		</table>
</td></tr>

<tr><td valign=top>
				<table border=0 width=100% cellspacing=0 cellpadding=0>
			  <tr><td align=center><br>
				<a href="#"><h2><font color="black">CERTIFICATE OF SERVICE</font></h2></a>
				</td></tr> 			   
			  </table>		 
</td></tr>
	
<tr><td height="100%" align=center valign=top>
<table align=center cellpadding="0" cellspacing="0" border="0">
<tr><td>    
    
<table width=width=100% cellpadding=5 cellspacing=10 align="center" border="0" >     
<tr><td colspan=2 style=" font-size:13px;">		
<p style="line-height: 120%" align="justify">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
TO WHOM IT MAY CONCERN : 
</p>
<p style="line-height: 120%" align="justify">		
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
This is to certify that <u>&nbsp;&nbsp;<b id="fullname"></b>&nbsp;&nbsp;</u> is/was contractually employed  by this company in the following capacities.
<br>
</p>
</td></tr>
<tr>
    <td colspan=2>
	    <table width=94% align=center border="0" cellpadding="2">
		    <tr>
			    <td width='17%' rowspan="2" valign="top"><b><u>VESSEL</u></b></td>
			    <td rowspan="2" valign="top" width="13%"><b><u>TYPE</u></b></td>		
					  
			    <td rowspan="2" width=11% valign="top"><b><u>RANK <!-- OCCUPIED--> </u></b></td>	

			    <td colspan="2" width="20%"><b><u>Service Record</b></td>
						
			    <td width=17% rowspan="2" valign="top"><b><u>TRADE AREA</u></b></td>	
		    </tr>		
					
		    <tr>
                <td width="20%"> <b><u>From</u></b>&nbsp;&nbsp;&nbsp;</td>
                <td width="20%"> <b><u>To</u></b></td>
		    </tr>

			<tbody id="tbody">
                
			</tbody>
	    </table>				
	</td>
</tr>

<tr>
<td colspan=2 style="font-size:13px;">		
<p  style="line-height: 120%" align="justify">
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
This certification is being issued upon the request of  <u><b>
Mr. <span id="lastname"></span>  </b></u> for whatever purpose it may serve him best.
 <br>
 
 <br>
  <i> Manila, Philippines </i> <b id="today"></b>.</i>
</p>
</td></tr>

<tr valign="bottom" height="80px"><td width=350>&nbsp;</td></tr>

<tr valign="bottom"><td width=350 valign="bottom" align="left">
<br><br>
<br>
<br>

<b id="sign-name"></b><br>
<span id="sign-title"></span>
</td>

<td align="right" >
</td></tr>
<table>				
				
</td></tr>
</table>		
</td></tr>

<tr><td>
</td></tr>
</table>
</body>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/maintenance.js"></script>
<script>
    var applicantID = 0;

    $(document).ready(function () {
        var url = new URL(window.location.href);
        applicantID = url.searchParams.get("_hsdlwhx");

        $('#hours').text(url.searchParams.get("hours") + ' hrs/wk');

        sign(url.searchParams.get("asignatory"));

        var today = getDate();

        $('#today').text(today);

        applicant(applicantID);
    });

    function sign(id) {
        (new http).post("accounts.aspx/find", {
            id: id
        }).then(function (response) {
            var item = response.d[0];

            $('#sign-name').text(item.Firstname + ' ' + item.Lastname);
            $('#sign-title').text(item.Position);
        }).run();
    }

    function getDate() {
        var today = new Date();  
        var offset = -(today.getTimezoneOffset() / 60); 

        var dateToday = new Date(new Date().getTime() + offset * 3600 * 1000).toUTCString().replace(/ GMT$/, "");

        var d = dateToday.split(' ');

        d.pop();

        return d.join(' ');
    }

    function applicant(id) {
        (new http).post("applicants.aspx/applicant", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#fullname, #full').text(item.Lastname + ', ' + item.Firstname + ' ' + item.Middlename);
            
            $('#lastname').text(item.Lastname);
            $('#firstname').text(item.Firstname);
            $('#middlename').text(item.Middlename);
            $('#birthdate').text(item.Birthdate);
            $('#birthplace').text(item.Birthplace);
            $('#nationality').text(item.Nationality);
            $('#religion').text(item.Religion);
            $('#heightweight').text(item.Height + ' / ' + item.Weight);
            $('#email').text(item.Email);
            $('#civil-status').text(item.CivilStatus).change();
            $('#languages').text(item.Languages);
            $('#position').html(item.Rank);

            $('#cellphone').text(item.Cellphone);
            $('#tel').text(item.Telephone);
            $('#sex').text(item.Sex);

            $('#address').html(item.NoOrBldg + ' ' +  item.StreetOrBrgy + ' ' + item.Municipality + ' ' + item.Province);
            
            embark(id);
            crew_services(id);

        }).run();
    }

    function embark(id) {
    
        (new http).post("embarkations.aspx/embarkation_crew_lists", {
            id: parseInt(id)
        }).then(function (response) {

            var items = response.d.map(item => {

                return new Promise(function (resolve, reject) {

                    $('#embarkation-date').text(item.DepartureDate);
                    $('#disembarkation-date').text(item.EmbarkationDate);
                });
            });

            Promise.all(items).then(function () {
            });
        }).run();
    }

    function crew_services(id) {
        $('#tbody').empty();

        (new http).post("applicant.aspx/works", {
            id: id
        }).then(function (response) {

             console.log(response.d);

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    var html = '<tr>' +
                                    '<td>' + item.VesselName + '</td>' +
		                            '<td>' + item.VesselType + '</td>' +
		                            '<td>' + item.Rank + '</td>	' +
		                            '<td>' + item.StartDate + '</td>' +					
		                            '<td>' + item.EndDate + '</td>' +
		                            '<td>World Wide</td>' +			
	                            '</tr>';

                    $('#tbody').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
               
            });
        }).run();
    }

    function getManilaTime() {
        var options = {
            timeZone: 'Asia/Manila',
            year: 'numeric', month: 'numeric', day: 'numeric',
            hour: 'numeric', minute: 'numeric', second: 'numeric',
        },

        formatter = new Intl.DateTimeFormat([], options);
        return formatter.format(new Date())
    }
</script>
</html>
