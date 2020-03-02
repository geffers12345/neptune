<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report-info-sheet.aspx.cs" Inherits="Seabase.report_info_sheet" %>

<!DOCTYPE html>


<html>
	<head>
    <title>Seafarer Info Sheet</title>
        <link href="content/css/menu_report.css" rel="stylesheet" />
	</head>	
		
  <body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
	<table border=0 cellspacing=0 width="100%" height=100% cellpadding="0">
	<tr><td height='100%' align=center valign=top>
<table width=100%>

<!--
<tr><td class="is" colspan="2"><b>FM-POEA-03SB-09<BR><BR></td></tr>
-->

<tr><td width="74%" class="is"><!--OEC NO. <u>&nbsp;7970446&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>--></td>
</tr>
				
<tr><td valign=top colspan="2">
		<table border=0 width=100% cellspacing=0 cellpadding=0>			  				
		<tr><td align=center class="is" colspan="2">
		<!--
		Republic of the Philippines<br>
		Department of Labor and Employment<br>
		PHILIPPINE OVERSEAS EMPLOYMENT ADMINISTRATION<br><br>
		-->
		<a href="#">SEAFARER INFO SHEET</a>
		</td></tr> 			   
		</table>		 
</td></tr>

<tr>
	   <td class="is"><br> <b> A. PERSONAL DATA </b> </td> <td width="26%" valign="bottom" class="is"> Code &nbsp; FM-POEA-03SB-09</td>
</tr>
	
<tr><td height='100%' align=center valign=top colspan="2">
<table cellpadding='0' cellspacing='0' width=100% class=report>

  <tr>
	   <td class="headis" width=24% style="border-right:hidden;">Family Name</td>
		 <td width="76%" class="reportis" id="lastname"></td>
	</tr>
	<tr>
	   <td class="headis" style="border-right:hidden;">Given Name</td>
		 <td class="reportis" id="firstname"></td>
	</tr>
	<tr>
	   <td class="headis" style="border-right:hidden;">Middle Name</td>
		 <td class="reportis" id="middlename"></td>
	</tr>
	<tr>
	   <td class="headis" style="border-right:hidden;">Birth Date</td>
		 <td class="reportis" id="birthdate"></td>
	</tr>
	<tr>
	   <td class="headis" style="border-right:hidden;"> <!-- Present--> Address</td>
		 <td class="reportis" id="address"></td>
	</tr>
	
	<!--
	<tr>
	   <td class="headis">Provincial Address</td>
		 <td class="reportis">92 Pluto St., Tumaga Int.,, Zamboanga City7000</td>
	</tr>
	-->
	
	<tr>
	   <td class="headis" style="border-right:hidden;">Tel. No. &nbsp;<span id="tel"></span></td>
	<td class="headis" style="border-right:hidden;">Civil Status &nbsp; <span id="civil-status"></span>
	   </td>
	</tr>
			 	 	
</table>
</td></tr>

<tr>
	   <td class="is" colspan="2"><br> <b> B. BENEFICIARY </b> </td>
</tr>

<tr><td height='100%' align=center valign=top colspan="2">
<table cellpadding='0' cellspacing='0' width=100% class=report>

  <tr>
	   <td class="headis" width=24% style="border-right:hidden;">Full Name</td>
		 <td width="76%" class="reportis" id="allotee"></td>
	</tr>
	<tr>
	   <td class="headis" style="border-right:hidden;">Relationship to Seafarer</td>
		 <td class="reportis" id="allotee-relationship"></td>
	</tr>
	<tr>
	   <td class="headis" style="border-right:hidden;">Address</td>
		 <td class="reportis"></td>
	</tr>
</table>
</td></tr>
</table>
</td></tr>
	
</table>
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
        $('#asignatory').text(url.searchParams.get("asignatory"));


        var today = getDate();

        $('#today').text(today);

        applicant(applicantID);
    });

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
            
            allotees(id);
            family(id);

        }).run();
    }

    function family(id) {
        (new http).post("applicant.aspx/family", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#mother').text(item.Mother);
            $('#spouse').text(item.Spouse);

        }).run();
    }

    function allotees(applicantID) {
        (new http).post("applicant.aspx/allotees", {
            id: applicantID
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    $('#allotee').text(item.Allotee);
                    $('#allotee-relationship').text(item.Relationship);
                    $('#allotee-branch').text(item.Branch);
                    $('#allotee-accountNo').text(item.AccountNo);

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
</body>
</html>
	