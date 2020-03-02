<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report-employment-contract.aspx.cs" Inherits="Seabase.report_employment_contract" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Seafarer Employment Contract</title>
	<style type="text/css" media="print">
		  @page { size: landscape; }
	</style>
    <link href="content/css/menu_report.css" rel="stylesheet" />
</head>	
		
<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
	<table border=0 cellspacing=0 width="100%" height="100%" cellpadding="0">
	    <tr>
            <td height="100%" align="center" valign="top">
                <table width="100%">

                <tr>
                    <td width="74%" class="reportse_header"><!--OEC NO. <u>&nbsp;4022266&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>--></td>
                </tr>
                <tr>
                    <td valign=top colspan="2">
				        <table border=0 width=100% cellspacing=0 cellpadding=0>			  				
				            <tr>
                                <td align="center" class="reportse_header" colspan="2">
				                <!--
				                Republic of the Philippines<br>
				                Department of Labor and Employment<br>
				                PHILIPPINE OVERSEAS EMPLOYMENT ADMINISTRATION<br><br>
				                -->
				                <b><a role="button" class="reportse_header">SEAFARER EMPLOYMENT CONTRACT</a></b>
				                </td>
				            </tr> 			   
			            </table>		 
                    </td>
                </tr>

                <tr>
	                <td colspan="2" class="reportse_noborder" id="date">
	                </td> 
                </tr>
	
                <tr><td height='100%' align=center valign=top colspan="2">

	                <table cellpadding='0' cellspacing='0' width=100% class=report>
		                <tr>
		                   <td class="reportse">This employment contract is entered into between the Seafarer and the Employer</td>
		                </tr>
	                </table>

                </td></tr>

                <!--THE SEAFARER-->
                <tr>
	                <td class="reportse_header" colspan="2"><br><b> THE SEAFARER </b> </td> 
                </tr>
                <tr><td height='100%' align=center valign=top colspan="2">
	                <table cellpadding='0' cellspacing='0' width=100% class=report>
		                <tr>
		                   <td class="reportse" colspan="4" width="50%">Surname : <b id="lastname"></b></td>
		                   <td class="reportse" colspan="4">Given Names: <b id="firstname">Jerwin</b></td>
		                </tr>
		                <tr>
		                   <td class="reportse" colspan="4"
                               rowspan="3" valign="top">Full home address :<span id="address"></span></td>
		                   <td class="reportse_norightbottomborder" colspan="1">Date of Birth:</td>
		                   <td class="reportse_noleftbottomborder" colspan="3" id="birthdate"></td>
		                </tr>
		                <tr>
		                   <td class="reportse_leftonly" colspan="1">Place of Birth:</td>
		                   <td class="reportse_rightonly" colspan="3" id="birthplace"></td>
		                </tr>
		                <tr>
		                   <td class="reportse_notopright" colspan="1">Nationality:</td>
		                   <td class="reportse_notopleft" colspan="3" id="nationality"></td>
		                </tr>
		                <tr>
		                   <td class="reportse" colspan="4" width="50%">Position: <b id="position"></b></td>
		                   <td class="reportse_noright" colspan="1">Medical certificates issued on:</td>
		                   <td class="reportse_noleft" colspan="3"></td>
		                </tr>
		                <tr>
		                   <td class="reportse_nobottom" colspan="8">Certificates(s) of competence</td>
		                </tr>
		                <tr height="20">
		                   <td class="reportse_noborder" valign="top">Course Title:</td>
		                   <td class="reportse_noborder" valign="top">Certificate No:</td>
		                   <td class="reportse_noborder" valign="top">Issue Date:</td>
		                   <td class="reportse_noborder" valign="top">Expiry Date:</td>
		                   <td class="reportse_noborder" valign="top">Institution:</td>
		                   <td class="reportse_noborder" valign="top">Place:</td>
		                   <td class="reportse_noborder" valign="top">STCW Code:</td>
		                   <td class="reportse_rightonly">&nbsp;</td>
		                </tr>
                        <tbody id="cert-tbody">

                        </tbody>       
				        <tr>
		                   <td class="reportse_norightbottomborder" colspan="1" valign="top" rowspan="2">Sign on Date:</td>
		                   <td class="reportse_noleftbottomborder" colspan="3" valign="top" rowspan="2"></td>
		                   <td class="reportse_norightbottomborder" colspan="1" valign="top">International Seaman's book no:</td>
		                   <td class="reportse_noleftbottomborder" colspan="3" valign="top"></td>
		                </tr>
		
		                <tr>
			               <td class="reportse_norightbottomborder" colspan="1" valign="top">Passport no:</td>
		                   <td class="reportse_noleftbottomborder" colspan="1" valign="top" id="passportsnumber"></td>
		                   <td class="reportse_norightbottomborder" colspan="1">Philippine Seaman's book no:</td>
		                   <td class="reportse_noleftbottomborder" colspan="1" id="seamansnumber"> </td>
		                </tr>
		
	                </table>	
                </td></tr>
                <!--end of THE SEAFARER-->

                <!--THE EMPLOYER-->
                <tr>
	                <td class="reportse_header" colspan="2"><br><b> THE EMPLOYER</b> </td>
                </tr>
                <tr><td height='100%' align=center valign=top colspan="2">
                <table cellpadding='0' cellspacing='0' width=100% class="report">
                <tr>
                   <td class="reportse" width="10%">Name :</td>
                   <td class="reportse">&nbsp;&nbsp;<b>Conautic Maritime Inc.</b></td>
                </tr>
                <tr>
                   <td class="reportse" width="10%">Address :</td>
                   <td class="reportse">&nbsp;&nbsp;Suite 312/313 Penthouse, Ermita Center Bldg. #1350 Roxas Blvd., Ermita Manila, Philippines</td>
                </tr>
                </table>
                </td></tr>
                <!--end THE EMPLOYER-->

                <!--SHIP'S OPERATOR-->
                <tr>
	                <td class="reportse_header" colspan="2"><br>
                        <b>SHIP'S OPERATOR</b>
                        <span class="reportse_noborder">to be filled in if the employer is not the same person as the ship's operator</span>
	                </td>
                </tr>
                <tr><td height='100%' align=center valign=top colspan="2">
                <table cellpadding='0' cellspacing='0' width=100% class="report">
                <tr>
                   <td class="reportse" width="10%">Name : </td>
                   <td class="reportse">&nbsp;&nbsp;<b id="principal-view"></b></td>
                </tr>
                <tr>
                   <td class="reportse" width="10%">Address :</td>
                   <td class="reportse" id="principal-address"></td>
                </tr>
                </table>
                </td></tr>
                <!--end SHIP'S OPERATOR-->


                <!--THE VESSEL-->
                <tr>
	                <td class="reportse_header" colspan="2"><br><b>THE VESSEL</b></td>
                </tr>
                <tr><td height='100%' align=center valign=top colspan="2">
                <table cellpadding='0' cellspacing='0' width=100% class="report">
                <tr>
                   <td class="reportse" width="50%">Name : <b id="vessel-view"></b></td>
                   <td class="reportse">Code: <b id="code-view"></b></td>
                </tr>
                </table>
                </td></tr>
                <!--end THE VESSEL-->

	
                <!--TERMS OF CONTRACT-->
                <tr>
	                <td class="reportse_header" colspan="2"><br><b>TERMS OF CONTRACT</b></td>
                </tr>
                <tr><td height='100%' align=center valign=top colspan="2">
                <table cellpadding='0' cellspacing='0' width="100%" class="report">
                <tr>
                   <td class="reportse" valign="top">Duration of Contract: <br><br><b id="contract"></b></td>
                   <td class="reportse" valign="top">Hours of work:<br><br></td>
                   <td class="reportse" valign="top"></td>
                </tr>
                <tr>
                   <td class="reportse" valign="top">Basic monthly Salary: <br><br><b id="basic"></b></td>
                   <td class="reportse" valign="top">Vacation Leave with Pay: <br><br></td>
                   <td class="reportse" valign="top">Collective Bargaining Agreement:<br><br></td>
                </tr>
                <tr>
                   <td class="reportse">Guaranteed overtime: <br><br><b id="overtime"></b></td>
                   <td class="reportse">Point of Hire: <br><br>Manila, Philippines</td>
                   <td class="reportse">Owner's Bonus: <br><br></td>
                </tr>
                <tr>
                   <td class="reportse_small" colspan="3">The current CBA-PSU 2020 Dutch Flag shall be considered to be incorporated into and forming part of this contract. The seafarer authorizes the employer to take care of all necessary actions to meet the standards set by Dutch Law. Furthermore it is expressly understood that the seafarer will observe and abide to the instructions and regulations provided by or on behalf of the employer including ISM instructions and regulations being applicable on board which amongst others contain strict provisions as to use of drugs , alcohol and/or medication.
                   Employee confirms that he or she has been given opportunity to examine and seek advice before signing this agreement. Employee confirms that he or she has not paid employer for finding employment on a ship. Social security benefits is written down in Art 21 and repatriation in Art 8 of the CBA.</td>
                </tr>
                </table>
                </td></tr>
                <!--end TERMS OF CONTRACT-->

                <!--CONFIRMATION OF THE CONTRACT-->
                <tr>
	                <td class="reportse_header" colspan="2"><br><b>CONFIRMATION OF THE CONTRACT</b></td>
                </tr>
                <tr><td height='100%' align=center valign=top colspan="2">
                <table cellpadding='0' cellspacing='0' width=100% class=report>
                <tr>
                   <td class="reportse" width="50%" valign="top">
   			                (The Master) 
			                <br><br><br>
	                </td>
                   <td class="reportse" valign="top">
   			                (Seafarer) 
   			                <br><br><br>
 			                <center id="fullname"></center>
                   </td>
                </tr>
                </table>
                </td></tr>
                <!--end CONFIRMATION OF THE CONTRACT-->
                </table>
                </td>
	        </tr>
	
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

        applicant(applicantID);
    });

    function applicant(id) {
        (new http).post("applicants.aspx/applicant", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#fullname').text(item.Lastname + ', ' + item.Firstname);

            $('#image').attr('src', 'content/img/crews/' + item.ImagePath);
            $('#lastname').text(item.Lastname);
            $('#firstname').text(item.Firstname);
            $('#middlename').text(item.Middlename);
            $('#address').html('<br>' + item.NoOrBldg + ' ' +  item.StreetOrBrgy + ' ' + item.Municipality + ' ' + item.Province);
            $('#birthdate').text(item.Birthdate);
            $('#age').text(item.Birthdate);
            $('#birthplace').text(item.Birthplace);
            $('#nationality').text(item.Nationality);
            $('#languages').text(item.Languages);
            $('#position').html(item.Rank);

            embark(id);
            training_courses(id);
            numbers();

            all_timesheets();
            vessel_info(item.VesselID);

        }).run();
    }

    function vessel_info(id) {

        (new http).post("_vessels.aspx/find", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#vessel-view').text(item.Name);
            $('#principal-view').text(item.Principal);
            $('#code-view').text(item.Code);

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
                               "<td>" + item.IssueDate + "</td>" +
                                "<td>" + item.ExpiryDate + "</td>" +
                                "<td>" + item.Center + "</td>" +
                                "<td>" + item.Place + "</td>" +
                            "<td>" + item.STCW + "</td></tr > ";

                    $('#cert-tbody').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
            });
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

    function embark(id) {
    
        (new http).post("embarkations.aspx/embarkation_crew_lists", {
            id: parseInt(id)
        }).then(function (response) {

            var html = "";

            var items = response.d.map(item => {

                return new Promise(function (resolve, reject) {

                    var dateToday = getDate();

                    html = 'Date:  ' + dateToday + '  and agreed to be effective from date of departure  Manila, Philippines.' +
                            '' + item.EmbarkationPort + ' ,  ' + item.EmbarkationDate + ' of commencement of service on board.'

                    resolve();
                });
            });

            Promise.all(items).then(function () {

                $('#date').text(html);
            });
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

            $('#seamansnumber').text(items.Seaman);
            $('#passportsnumber').text(items.Passport);

        }).run();
    }

    function all_timesheets() {

        (new http).post("timesheets.aspx/crewPayroll", {
            id: applicantID
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    (new http).post("timesheets.aspx/other_salaries", {
                        id: item.CrewEmbarkID
                    }).then(function (response) {

                        var data = response.d[0];

                        if (response.d.length == 0) {
                            grand = item.Total;

                            $('#basic').text(item.BasicSalaryActual);
                            $('#contract').text(item.Duration + ' months');
                            $('#overtime').text('' + item.OvertimeActual + ' (N/A$/hr if excess overtime)');

                            resolve();
                        } else {
                            grand = item.Total + ((data.Rejoining + data.LeavePay + data.PensionPay + data.ChristmasPay + data.Others) - data.Deduction);

                            $('#basic').text(item.BasicSalaryActual);
                            $('#contract').text(item.Duration + ' months');
                            $('#overtime').text('' + item.OvertimeActual + ' (N/A$/hr if excess overtime)');

                            resolve();
                        }

                    }).run();
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
