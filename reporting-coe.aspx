<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reporting-coe.aspx.cs" Inherits="Seabase.reporting_coe" %>

<!DOCTYPE html>

<html>
<head>    		
<title></title>
<style>
	a:link,a:visited {color:black; text-decoration:none;}
	td { font-family:  arial, verdana, Helvetica, sans-serif; font-size:13px;}
	td.report { FONT-SIZE: 13px; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: arial, verdana, helvetica, geneva, sans-serif; BACKGROUND-COLOR: #ffffff;}
	table.report {BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; BORDER-COLLAPSE: collapse; border-spacing: 0}
	td.reportgray {	BORDER-RIGHT: #000000 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #000000 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 11px; PADDING-BOTTOM: 2px; BORDER-LEFT: #000000 1px solid; COLOR: #000000; PADDING-TOP: 2px; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: verdana,arial, helvetica, geneva, sans-serif;}
    body
    {
        margin-top: -20px;
    }

    @page {
        margin-top: 0px;
    }
</style>
</head>	
		
<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
<table border=0 cellspacing="0" width="100%" cellpadding=0 align=center><br>
<tr><td valign="top" height="62">
		<table border="0" width="100%" cellspacing="0" cellpadding="0">	
		<tr><td align=center>
		Republic of the Philippines<br>
		Department of Labor and Employment<br>
		PHILIPPINE OVERSEAS EMPLOYMENT ADMINISTRATION<br><br>
		<a href="#"><b>CONTRACT OF EMPLOYMENT</b></a>
		</td></tr> 			   
		</table>		 
</td></tr>
	
<tr><td height='100%' align="center" valign="top">
<table cellpadding='0' cellspacing='0' width="100%" border="0" style="margin-top: -15px;">
<tr><td><br><br><b>KNOW ALL MEN BY THESE PRESENTS:<br><br></td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This Contract, entered into voluntarily by and between:<br><br></td></tr>

<tr><td>

<table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom: 5px;">
<tr><td width="120">Name of Seafarer:</td><td class="report" id="fullname"></td></tr>
</table>


<table width="100%" cellpadding="0" cellspacing="0"  border="0">
<tr>
  <td width="80">Date Of Birth:</td>
	  <td class="report" id="birthdate"></td>
 <td align="right">Age:</td>
	<td class="report" id="age"></td>
 <td align="right">Place of Birth:</td>
	<td class="report" id="birthplace"></td></tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0"  border="0">
<tr><td width="80">Address:<br></td><td class=report>&nbsp;92 Pluto St.,Tumaga Int.,Zamboanga City,Philippines</td></tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0"  border="0">
    <tr>
      <td width="80">SIRB No.:</td>
      <td class="report" id="seamans"></td>

	    <td width="80" align="right">SRC No.:</td>
	    <td class="report" id="src"></td>

	    <td width=80>License No.:<br></td>
	    <td class="report" id="license"></td>

    </tr>
</table>

<!--<table width=100% cellpadding=0 cellspacing=0  border=0>
<tr><td width=80>License No.:<br></td><td class=report>&nbsp;D3-0000129</td></tr>
</table>-->

</td></tr>
<tr><td>
<table width="100%" cellpadding="0" cellspacing="0"  border="0">
<tr><td>hereinafter referred to as the Seafarer<br><br></td></tr>
</table>
</td></tr>
</table>
</td></tr>

<tr><td valign="top">
<table style="margin-top: -15px;" width=100% cellpadding=0 cellspacing=0>
<tr><td></td><td align=center>and</td></tr>
<tr height="10"><td colspan="2"></td></tr>
<tr><td width=200>Name of Agent:</td><td class=report align=left>&nbsp;&nbsp;<b>Conautic Maritime Inc.</td></tr>
<tr><td width=200>Address of Agent:</td><td style="font-size: 11px !important" class=report align=left>&nbsp;&nbsp;Suite 312/313 Penthouse, Ermita Center Bldg.
#1350 Roxas Blvd., Ermita Manila, Philippines</td></tr>
<tr><td width=200>Name of Principal / Shipowner:</td><td class=report align=left>&nbsp;&nbsp; <span id="principal-name"></span></td></tr>
<!--<tr><td>&nbsp;</td><td align=center>(Principal/Country)</td></tr>-->
<tr><td width=200>Address of Principal / Shipowner:</td><td class=report align=left>&nbsp;&nbsp; 
<span id="principal-address"></span></td></tr>
</table>

<table>
<tr><td colspan=2>for the following vessel:</td></tr>
</table>

<table width=100% cellpadding=0 cellspacing=0 border=0>
<tr><td width=140>Name of Vessel:</td><td class=report>&nbsp; <span id="vessel-name"></span></td></tr>
</table>
<table width=100% cellpadding=0 cellspacing=0 border=0>
<tr><td width="10%">IMO Number:</td><td class=report width=30%>&nbsp; <span id="imo"></span></td>

<td width=30% align=right>Gross Registered Tonnage (GRT):</td><td class=report>&nbsp; <span id="grt"></span></td>

<td width=10% align=right>Year Built:</td><td class=report width=10%>&nbsp; <span id="built"></span></td>
</tr>
</table>
<table width=100% cellpadding=0 cellspacing=0 border=0>
<tr><td width=5%>Flag:</td><td class=report width=20%>&nbsp; <span id="flag-item"></span></td>
<td width=15% align=right>Type of Vessel:</td><td class=report>&nbsp; <span id="vessel-type"></span></td>
<td width=20% align=right>Classification Society:</td><td class=report>&nbsp; <span id="classification"></span></td>
</tr>
</table>
<!--<table width=100% cellpadding=0 cellspacing=0 border=0>
<tr><td width=140>Engine Make:</td><td class=report width=30%>&nbsp;</td><td width=20% align=right>I.M.O. Number:</td><td class=report>&nbsp;</td></tr>
</table>-->
</td></tr>

<tr><td>
<table width=100% cellpadding=0 cellspacing=0  border=0>
<tr><td>hereinafter referred to as the Employer,<br><br></td></tr>
</table>
</td></tr>

<tr>
<td align=right>
<table width=98% cellpadding=0 cellspacing=0 border=0>
<tr><td align=center>W I T N E S S E T H<br><br></td></tr>
<tr><td><table width=100% cellpadding=0 cellspacing=0 border=0>

<tr><td width=5% valign=top>1.</td><td>That the seafarer shall be employed on board under the following terms and conditions:</td></tr>
<tr><td><br></td></tr>
<tr><td></td><td>
 <table width="100%" cellpadding=1 cellspacing=1>
      <tr><td width=5%>1.1</td><td width=250>Duration of Contract:</td><td class="report" id="duration">&nbsp;</td></tr>
	 <tr><td>1.2</td><td>Position:</td><td class="report" id="position"></td></tr>
	 
	 	 
				<tr>
                    <td>1.3</td>
					<td>Basic Monthly Salary:</td>
					<td class="report" id="basic"></td>
		 
				</tr>
	 	 
				<tr><td>1.4</td>
					<td>Hours of Work:</td>
					<td class="report" id="hours"></td>
				</tr>
	 	 
				<tr><td>1.5</td>
							<td>Overtime:</td>
					<td class="report" id="overtime"></td>
		 
				</tr>
	 	 
				<tr><td>1.6</td>
							<td>Vacation Leave with Pay:</td>
					<td class="report" id="vacation"></td>
		 
				</tr>
	 	 
				<tr><td>1.7</td>
							<td>Point of Hire:</td>
					<td class="report" id="point"></td>
		 
				</tr>
	 	 
		<tr>
			<td>1.8</td>
			<td>Collective Bargaining Agreement, if any::</td>
			<td class="report" id="principal-cba"></td>
		</tr>
	 	 
 </table></td></tr> 
<tr><td><br></td></tr> 
<tr><td width=5% valign=top>2.</td><td>That herein terms and conditions in accordance with Governing Board Resolution No. 09 and Memorandum Circular No. 10, both Series of 2010, shall be strictly and faithfully observed.</td></tr>
<tr><td><br></td></tr> 
<tr><td width=5% valign=top>3.</td><td>Any alterations or charges, in any of this Contract shall be evaluated, verified, processed and approved by the Philippine Overseas Employment Administration (POEA). Upon approval, the same shall be deemed an integral part of the Standard Terms and Conditions Governing the Employment of Filipino Seafarers On Board Ocean-Going Vessels.</td></tr>
<tr><td><br></td></tr>
<tr><td width=5% valign=top>4.</td><td>Violations of the terms and conditions of this Contract with its approved addendum shall be ground for disciplinary action against the erring party.</td></tr>
<tr><td><br></td></tr>
<tr><td width=5% valign=top>&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IN WITNESS WHEREOF the parties have hereto set their hands this 
    <u id="today"></u> at Ermita, Manila Philippines.</td>
</tr>
</table>
</td></tr>
<tr><td><br><br></td></tr>
<tr><td>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top: -30px; margin-bottom: 30px;">
<tr><td width="50%" class="report" align="center" valign="bottom" id="full"></td>
    <td width=5%>&nbsp;</td>
		<td class="report" align="center"><b></b><br>
<b id="sign-name"></b><br /><span id="sign-title"></span></td></tr>
<tr><td width=50% align=center>Seafarer</td><td width=5%>&nbsp; </td><td align=center>For the Employer</td></tr>
<tr><td colspan=3><br><br>Verified and approved by the POEA<br><br><br></td></tr>
<tr><td width=50% class=report>&nbsp;</td><td width=5%>&nbsp;</td><td class=report align=center>&nbsp;</td></tr>
<tr><td width=50% align=center>Date</td><td width=5%>&nbsp;</td><td align=center>Signature of POEA Official</td></tr>
</table>
</td></tr>

</table>
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

            $('#image').attr('src', 'content/img/crews/' + item.ImagePath);
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

            numbers();

            rankSalary(item.RankID);

            vessel_info(item.VesselID);

            crewEmbark(id, item.VesselID);

            license(id);
        }).run();
    }

    function numbers() {

        var today = getManilaTime().split(',')[0];
        var d = today.split('/');

        var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
        var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

        var formattedDate = d[2] + '-' + d0 + '-' + d1;

        (new http).post("applicant.aspx/numbers", {
            id: applicantID,
            date: formattedDate
        }).then(function (response) {

            var items = response.d[0];

            $('#age').text(items.Age);
            $('#src').text(items.SRC);
            $('#seamans').text(items.Seaman);
        }).run();
    }

    function training_courses(applicantID) {
        $('#cert-tbody').empty();

        $('#cert-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

        (new http).post("applicant.aspx/trainings", {
            id: applicantID
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    var html = "<tr>" +
                               "<td>" + item.Training + "</td>" +
                               "<td>" + item.CertificateNo + "</td>" +
                               "<td>" + item.Place + "</td>" +
                               "<td>" + item.IssueDate + "</td>" +
                               "<td>" + item.ExpiryDate + "</td></tr>";

                    $('#cert-tbody').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
            });
        }).run();
    }

    function crew_works(applicantID) {
        $('#work-tbody').empty();

        $('#work-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

        (new http).post("applicant.aspx/works", {
            id: applicantID
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    var html = "<tr>" +
                                "<td>" + item.StartDate + "</td>" +
                                "<td>" + item.EndDate + "</td>" +
                                "<td>" + item.MonthDiff + "</td>" +
                               "<td>" + item.Rank + "</td>" +
                               "<td>" + item.VesselName + "</td>" +
                               "<td>" + item.VesselType + "</td>" +
                               "<td>" + item.Manning + "</td></tr>";

                    $('#work-tbody').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
            });
        }).run();
    }

    function rankSalary(rankID) {

        (new http).post("scales.aspx/getByVessel", {
            rankID: parseInt(rankID),
            vesselID: 0,
            scaleID: 0
        }).then(function (response) {

            console.log(response);

            var items = response.d.map(item => {

                return new Promise(function (resolve, reject) {

                    if (item.Income.includes('Basic')) {
                        $('#basic').text(parseFloat(item.Monthly));
                    }

                    if (item.Income.includes('Salary')) {
                        $('#basic').text(parseFloat(item.Monthly));
                    }

                    if (item.Income.includes('Overtime') || item.Income.includes('ot') || item.Income.includes('OT')) {
                        $('#overtime').text(parseFloat(item.Monthly));
                    }

                    if (item.Income.includes('Vacation') || item.Income.includes('vacation') || item.Income.includes('Leave')) {
                        $('#vacation').text(parseFloat(item.Monthly));
                    }

                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
            });
        }).run();
    }

    function crewEmbark(crewID, vesselID) {

        (new http).post("embarkations.aspx/crewEmbark", {
            crewID: crewID,
            vesselID: vesselID
        }).then(function (response) {

            $('#duration').text(response.d[0].Duration + ' mos.');
            $('#point').text(response.d[0].PointofHire);
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

    function vessel_info(id) {

        (new http).post("_vessels.aspx/find", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#vessel-name').text(item.Name);
            $('#principal-name').text(item.Principal);
            $('#vessel-type').text(item.VesselType);

            principal_info(item.PrincipalID);
            find_specs(id);

        }).run();
    }

    function principal_info(id) {
        (new http).post("principals.aspx/find", {
        id: id
        }).then(function (response) {
            var item = response.d[0];
        
            $('#principal-address').text(item.Address);
            $('#principal-cba').text(item.CBA);
        }).run();
    }


    var owned = [];

    function find_specs(id) {

        (new http).post("_vessels.aspx/find_specs", {
            id: id
        }).then(function (response) {

            var item = response.d[0];
            
            $('#built').text(item.YearBuilt.split('-')[0]);
            $('#imo').text(item.IMONumber);
            $('#grt').text(item.GRT);
            $('#classification').text(item.NRT.split('|')[1]);

            find_flags(id);

        }).run();
    }

    function find_flags(id) {

        (new http).post("_vessels.aspx/find_flags", {
            id: id
        }).then(function (response) {

            var items = response.d.map(item => {
                $('#flag-item').text(item.Flag);
            });

        }).run();
    }

    function license(id) {

        (new http).post("applicant.aspx/licenses", {
            id: id
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    if (item.License.includes('Philippine') || item.License.includes('Philippine')) {
                        $('#license').text(item.Number);
                    }
                
                    resolve();
                });
            });

            Promise.all(items).then(function () {
            });
        }).run();
    }
</script>
</html>