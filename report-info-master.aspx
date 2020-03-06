<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report-info-master.aspx.cs" Inherits="Seabase.report_info_master" %>

<!DOCTYPE html>

<html>
<head>
<title>Info to the Master</title>
<style>
	a:link,a:visited {color:black; text-decoration:none;}
	td { font-family: "Times New Roman", Times, serif; font-size:12pt;}
	td.report { FONT-SIZE: 12pt; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: "Times New Roman", Times, serif; BACKGROUND-COLOR: #ffffff;}
	table.report {BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; BORDER-COLLAPSE: collapse; border-spacing: 0}
	td.reportgray {	BORDER-RIGHT: #000000 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #000000 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 9pt; PADDING-BOTTOM: 2px; BORDER-LEFT: #000000 1px solid; COLOR: #000000; PADDING-TOP: 2px; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: "Times New Roman", Times, serif;}
	table.info_master_rpt{
		FONT-FAMILY: "Times New Roman", Times, serif; FONT-SIZE: 10pt;
	}
	
	table.info_master_rpt td{
		FONT-FAMILY: "Times New Roman", Times, serif; FONT-SIZE: 10pt;
	}
	
	td.box { 
		BORDER-RIGHT: #000000 2px solid; PADDING-RIGHT: 2px; BORDER-TOP: #000000 2px solid; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; BORDER-LEFT: #000000 2px solid; COLOR: #000000; PADDING-TOP: 2px; BORDER-BOTTOM: #000000 2px solid; font-family: "Franklin Gothic Book"; font-size:9pt;
	}
	
	.companyName{ font-family:Arial, Helvetica, sans-serif; font-size:20pt;}

	.addressInfo{
		font-family:Arial, Helvetica, sans-serif; font-size:8pt;
	}
	
	td.infoLabel{
		font-family:"Courier New", Courier, monospace; font-size:10pt;
	}
	
	td.infoContent{
		font-family:"Courier New", Courier, monospace; font-size:10pt;
	}
	
	td.contentHead{
		font-family:Arial, Helvetica, sans-serif; font-size:10pt; text-decoration:underline;
	}
	
	td.contentLabel{
		font-family:Arial, Helvetica, sans-serif; font-size:7pt;
	}
	
	td.contentData{
		font-family: "Franklin Gothic Book"; font-size:9pt;
	}
	
</style>
</head>	
		
<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0" id="export-content">

<table border="0" cellspacing="0" width="100%" cellpadding="0" align="center">
    <tr>
        <td valign=top height=62>
	        <table border="0" width="100%" cellspacing="0" cellpadding="0">			  
	        <tr>
                <td width="30%" align="left" valign="top">
                    <a class="word-export" href="javascript:void(0)" title="Click to view Info to the Master in Word format.">
                        <img src="http://www.conautic.com/iris/img/CMI_Logo.jpg" border="0"></a></td>
	            <td width="70%" align="right" valign="top">
	                <div class="companyName" style=" padding-bottom:8pt"><i>Conautic Maritime Inc.</i></div>
	                <span class="addressInfo">Suite 312/313 Penthouse, Ermita Center Bldg.<br />#1350 Roxas Blvd., Ermita Manila, Philippines</span>
	                <br />
	                <span class="addressInfo">E-mail:operations@conautic.com</span>
	            </td>
	        </tr> 			   
	        </table>		 
        </td>
    </tr>

    <tr>
        <td>
	    <table width="100%" border="0" cellpadding="0" cellspacing="0">
	        <tr><td colspan="2" width="100%"><hr /></td></tr>
	        <tr>
                <td width="14%" class="infoLabel"><b>Date:</b></td>
                <td width="86%" align="left" class="infoContent" id="date-now"></td>
	        </tr>
	        <tr>
                <td width="14%" class="infoLabel"><b>Principal:</b></td>
                <td width="86%" align="left" class="infoContent" id="principal-view"></td>
	        </tr>
	        <tr>
                <td width="14%" class="infoLabel"><b>Attention:</b></td>
                <td width="86%" align="left" class="infoContent" id="attention"></td>
	        </tr>
	        <tr>
                <td width="14%" class="infoLabel"><b>Contact Number:</b></td>
                <td width="86%" align="left" class="infoContent" id="contact-number"></td>
	        </tr>
	        <tr>
                <td width="14%" class="infoLabel"><b>Regarding:</b></td>
                <td width="86%" align="left" class="infoContent">Info crew joining vessel : <span id="vessel-view"></span></td>
	        </tr>
	        <tr>
                <td colspan="2" width="100%"><hr /></td>
	        </tr>
	    </table>
	
	    <table width="100%" border="0" cellpadding="0" cellspacing="0">

	        <tr>
                <td width="42%" colspan="4">&nbsp;</td>
	            <td width="58%" colspan="4" align="left">&nbsp;</td>
	        </tr>

	        <tr>
                <td width="42%" colspan="4" align="left" class="contentHead"><b><i>Personal Info</i></b></td>
	            <td width="58%" colspan="4" align="left" class="contentHead"><b><i>Vessel, Position</i></b></td>
	        </tr>

	        <tr>
                <td width="42%" colspan="4">&nbsp;</td>
	            <td width="58%" colspan="4" align="left">&nbsp;</td>
	        </tr>

	        <tr>
                <td width="14%" class="contentLabel">Name of crew</td>
                <td width="24%" align="left" colspan="2" class="contentData"><b><i id="fullname"></i></b></td>
	            <td width="4%">&nbsp;</td>
                <td align="left" width="13%" class="contentLabel">Vessel</td>
                <td width="45%" colspan="3" align="left" class="contentData"><b><i id="vesselView"></i></b></td>
	        </tr>

	
	        <tr>
                <td width="14%" class="contentLabel">Date of Birth</td>
                <td width="24%" align="left" colspan="2" class="contentData"><b><i id="birthdate"></i></b></td>
	            <td width="4%">&nbsp;</td><td align="left" width="13%" class="contentLabel">Position</td>
                <td width="45%" colspan="3" align="left" class="contentData"><b><i id="position"></i></b></td>
	        </tr>

	
	        <tr>
                <td width="14%" class="contentLabel">Place of Birth</td>
                <td width="24%" align="left" colspan="2" class="contentData"><b><i id="birthplace"></i></b></td>
	            <td width="4%">&nbsp;</td><td align="left" width="13%" class="contentLabel">Departure Manila</td>
                <td width="45%" colspan="3" align="left" class="contentData"><b><i id="departure-date"></i></b></td>
	        </tr>
	
	        <tr>
                <td width="14%" valign="top" class="contentLabel">Status</td>
                <td width="24%" colspan="2" align="left" class="contentData"><b><i id="civil-status"></i></b></td>
	            <td width="62%" align="left" colspan="5" valign="top">&nbsp;</td>
	        </tr>

	
	        <tr>
                <td width="14%" valign="top" class="contentLabel">Address</td>
                <td width="86%" colspan="7" align="left" class="contentData"><b><i id="address"></i></b></td>
	        </tr>
	
	        <tr><td width="42%" colspan="4">&nbsp;</td>
	        <td width="58%" colspan="4" align="left">&nbsp;</td></tr>

	        <tr>
                <td width="38%" colspan="3" class="contentHead"><b><i>Official Documents</i></b></td>
	            <td width="4%">&nbsp;</td>
                <td width="58%" align="left" colspan="4" valign="top">&nbsp;</td>
	        </tr>
	
	        <tr><td width="14%">&nbsp;</td><td width="24%" colspan="2" align="left" class="contentLabel"><b><i><u>Nos.</u></i></b></td>
	        <td width="4%">&nbsp;</td><td align="left" width="13%" class="contentLabel"><b><i><u>Issued</u></i></b></td><td width="22%" class="contentLabel"><b><i><u>Expiry</u></i></b></td><td width="12%">&nbsp;</td>
	        <td width="16%">&nbsp;</td>
	        </tr>

	        <tbody id="official-docx" style="margin-bottom: 5%;">
                
	        </tbody>
	
	        <tr><td width="38%" colspan="3" class="contentHead"><b><i>Flag State Documents</i></b></td>
	        <td width="4%">&nbsp;</td><td width="58%" align="left" colspan="4" valign="top">&nbsp;</td>
	        </tr>
	
	        <tr><td width="14%">&nbsp;</td><td width="12%" align="right" class="contentLabel"><b><i><u>Issued</u></i></b></td>
	        <td width="12%" align="right" class="contentLabel"><b><i><u>Valid Till</u></i></b></td>
	        <td width="4%">&nbsp;</td><td align="left" width="13%">&nbsp;</td><td width="22%">&nbsp;</td><td width="12%">&nbsp;</td>
	        <td width="16%">&nbsp;</td>
	        </tr>

            <tbody id="flag-tbody"></tbody>
		
	        <tr><td width="42%" colspan="4">&nbsp;</td>
	        <td width="58%" colspan="4" align="left">&nbsp;</td></tr>

	        <!-- Wage Info -->

	        <tr>
                <td width="42%" colspan="4" class="contentHead"><b><i>Wage Info</i></b></td>
                <td colspan="4" width="58%" class="contentHead"><b><i>Payees</i></b></td>
	        </tr>
	
	        <tr>
                <td width="14%">&nbsp;</td>
                <td width="12%" align="right" class="contentLabel"><b><i><u>monthly</u></i></b></td>
	            <td width="4%">&nbsp;</td>
                <td align="left" width="13%">&nbsp;</td>
                <td width="17%"></td><td width="12%"></td>
	            <td width="16%"></td>
	        </tr>

	
	        <tr>
                <td width="14%" class="contentLabel">Basic</td>
                <td width="12%" align="right" class="contentData"><b><i id="basic"></i></b></td>
	            <td width="4%">&nbsp;</td><td align="left" width="13%" class="contentLabel">Name of Allottee</td>
                <td width="45%" colspan="3" align="left" class="contentData"><b><i id="allotee"></i></b></td></tr>

	        <tr>
                <td width="14%" class="contentLabel">Overtime</td>
                <td width="12%" align="right" class="contentData"><b><i id="overtime"></i></b></td>
	            <td width="4%">&nbsp;</td><td align="left" width="13%" class="contentLabel">Relationship</td>
                <td width="45%" colspan="3" align="left" class="contentData"><b><i id="allotee-relationship"></i></b></td>
	        </tr>
	
	        <tr>
                <td width="14%" class="contentLabel">Gas/Tanker Allowance</td>
                <td width="12%" align="right" class="contentData"><b><i>-</i></b></td>
	            <td width="4%">&nbsp;</td>
                <td align="left" width="13%" class="contentLabel">Bank, Branch</td>
                <td width="45%" colspan="3" align="left" class="contentData"><b><i id="allotee-branch"></i></b></td>
	        </tr>
 

	        <tr>
                <td width="14%" class="contentLabel">Owner's Bonus</td>
                <td width="12%" align="right" class="contentData"><b><i id="owner-bonus"></i></b></td>
	            <td width="4%">&nbsp;</td>
                <td align="left" width="13%" class="contentLabel">Bank Account No.</td>
                <td width="45%" colspan="3" align="left" class="contentData"><b><i id="allotee-accountNo"></i></b></td>
	        </tr>
	
	        <tr>
                <td width="14%" class="contentLabel">Total</td>
                <td width="12%" align="right" class="contentData"><b><i id="total"></i></b></td>
	            <td width="4%">&nbsp;</td>
                <td align="left" width="13%">&nbsp;</td><td width="45%" colspan="3" align="left">&nbsp;</td>
	        </tr>
 
	        <tr>
                <td width="14%" class="contentLabel">Allotment</td><td width="12%" align="right" class="contentData"><b><i></i></b></td>
	            <td width="4%">&nbsp;</td>
                <td align="left" width="13%" class="contentLabel">Beneficiary(Insur)</td>
                <td width="45%" colspan="3" align="left" class="contentData"><b><i id="allotee-beneficiary"></i></b></td>
	        </tr>

	        <tr>
                <td width="14%" class="contentLabel">Pay on Board</td>
                <td width="12%" align="right" class="contentData"><b><i></i></b></td>
	            <td width="4%">&nbsp;</td><td align="left" width="13%" class="contentLabel">Relationship</td>
                <td width="45%" colspan="3" align="left" class="contentData"><b><i id="allotee-beneficiary-relationship"></i></b></td>
	        </tr>
	
	        <tr>
                <td width="14%" class="contentLabel">OT/hour</td>
                <td width="12%" align="right" class="contentData"><b><i>If OT in excess of 85 hrs</i></b></td>
	            <td width="12%" align="right" class="contentData"><b><i>-</i></b></td>
	            <td width="4%">&nbsp;</td><td align="left" width="13%">&nbsp;</td>
                <td width="45%" colspan="3" align="left">&nbsp;</td>
	        </tr>

	        <tr>
	            <td width="14%" class="contentData" colspan="6"><br><b><i>
	            <b>NOTE: Total Leave pay shall be paid to Crew in Manila upon completion of the contract.</b></i></td>
	        </tr>

	        <!-- Wage Info -->

	        </table>
        </td>
    </tr>
</table>

<br clear="all" style="page-break-before:always">
<table border=0 cellspacing=0 width=100% cellpadding=0 align=center>
<tr><td>

	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	
	<tr>
        <td width="42%" colspan="4">&nbsp;</td>
	    <td width="58%" colspan="4" align="left">&nbsp;</td>
	</tr>
	
	<tr><td width="100%" class="infoLabel" colspan="8" align="left">
        <b>Name of Crew:</b>
        <span id="fname"></span>
	    </td></tr>

	<tr><td width="42%" colspan="4">&nbsp;</td>
	<td width="58%" colspan="4" align="left">&nbsp;</td></tr>

	<tr><td colspan="8" align="left" width="100%" class="contentHead"><b><i>Training and Other Certificates</i></b></td></tr>

	<tr>
        <td align="left" class="contentHead"><b><i>Course</i></b></td>
	    <td align="left" class="contentHead"><b><i>Training Center</i></b></td>
	    <td align="left" class="contentHead"><b><i>Issued</i></b></td>
	    <td align="left" class="contentHead"><b><i>Valid Till</i></b></td>
	</tr>
	<tbody id="cert-tbody"></tbody>
	</table>

</td></tr> 
</table>

</body>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="scripts/FileSaver.js"></script>
<script src="scripts/jquery.wordexport.js"></script>
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

        $('#date-now').text(getDate());
    });

    function applicant(id) {
        (new http).post("applicants.aspx/applicant", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#fullname, #fname').text(item.Lastname + ', ' + item.Firstname);

            $('#image').attr('src', 'content/img/crews/' + item.ImagePath);
            $('#lastname').text(item.Lastname);
            $('#firstname').text(item.Firstname);
            $('#middlename').text(item.Middlename);
            $('#birthdate').text(item.Birthdate);
            $('#age').text(item.Birthdate);
            $('#birthplace').text(item.Birthplace);
            $('#nationality').text(item.Nationality);
            $('#religion').text(item.Religion);
            $('#heightweight').text(item.Height + ' / ' + item.Weight);
            $('#email').text(item.Email);
            $('#civil-status').text(item.CivilStatus);
            $('#languages').text(item.Languages);
            $('#position').html(item.Rank);
            $('#address').html(item.NoOrBldg + ' ' +  item.StreetOrBrgy + ' ' + item.Municipality + ' ' + item.Province);

            numbers();

            training_courses(id);
            vessel_info(item.VesselID);

            travel(applicantID);

            embark(id);
            flag(applicantID);
            all_timesheets(applicantID);
            allotees(applicantID);

            rankSalary(item.RankID);

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
                        $('#basic').text(parseFloat(item.Monthly));
                    }

                    if (item.Income.includes('Salary')) {
                        $('#basic').text(parseFloat(item.Monthly));
                    }

                    if (item.Income.includes('Overtime') || item.Income.includes('ot') || item.Income.includes('OT')) {
                        $('#overtime').text(parseFloat(item.Monthly));
                    }

                    if (item.Income.includes('Vacation') || item.Income.includes('vacation') || item.Income.includes('leave')) {
                        $('#vacation').text(parseFloat(item.Monthly));
                    }

                    if (item.Income.includes('Bonus') || item.Income.includes('bonus') || item.Income.includes('Owner')) {
                        $('#owner-bonus').text(parseFloat(item.Monthly));
                    }

                    resolve();
                });
            });

            Promise.all(items).then(function () {

                var total = parseFloat($('#basic').text()) + parseFloat($('#overtime').text()) +
                    parseFloat($('#owner-bonus').text());

                $('#total').text(total);
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

    function vessel_info(id) {

        (new http).post("_vessels.aspx/find", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            console.log(item);

            $('#vessel-view').text(item.Name);
            $('#vesselView').text(item.Name);
            $('#principal-view').text(item.Principal);
            $('#attention').text(item.ContactPerson);
            $('#contact-number').text(item.ContactPersonNumber);

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

                     var html = '<tr><td class="contentLabel">' + item.Training + '</td>' +
                        '<td class="contentData"><b><i>' + item.Center + '</i></b></td>' +
                        '<td class="contentData"><b><i>' + item.IssueDate + '</i></b></td>' +
                        '<td class="contentData"><b><i>' + item.ExpiryDate + '</i></b></td></tr> ';

                    $('#cert-tbody').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
            });
        }).run();
    }

    function flag(applicantID) {
        $('#flag-tbody').text('');

        (new http).post("applicant.aspx/flags", {
            id: applicantID
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    var html = '<tr><td class="contentLabel">' + item.Flag + '</td>' +
                        '<td align="right" class="contentData"><b><i>' + item.IssueDate + '</i></b></td>' +
	                    '<td align="right" class="contentData"><b><i>' + item.ExpiryDate + '</i></b></td></tr>';

                    $('#flag-tbody').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
            });
        }).run();
    }

    function all_timesheets(applicantID) {

        (new http).post("timesheets.aspx/crewPayroll", {
            id: applicantID
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    (new http).post("timesheets.aspx/other_salaries", {
                        id: item.CrewEmbarkID
                    }).then(function (response) {

                        var data = response.d[0];

                        var total = 0;

                        if (response.d.length == 0) {
                            grand = item.Total;

                            total = (parseFloat(item.BasicSalaryActual) / 30) + (parseFloat(item.OvertimeActual) / 30).toFixed(2);

                            $('#basic').text(parseFloat(item.BasicSalaryActual));
                            $('#basicperday').text('(' + (parseFloat(item.BasicSalaryActual) / 30).toFixed(2) + ' US$ / day)');
                            $('#duration').text(item.Duration);
                            $('#overtime').text(parseFloat(item.OvertimeActual));
                            $('#overtimeperday').text('(' + (parseFloat(item.OvertimeActual) / 30).toFixed(2) + ' US$ / day)');

                            $('#total').text(parseFloat(total).toFixed(2));
                            $('#totalperday').text('(' + (parseFloat(total) / 30).toFixed(2) + ' US$ / day)');

                            resolve();
                        } else {
                            grand = item.Total + ((data.Rejoining + data.LeavePay + data.PensionPay + data.ChristmasPay + data.Others) - data.Deduction);

                            total = (parseFloat(item.BasicSalaryActual) / 30) + (parseFloat(item.OvertimeActual) / 30).toFixed(2);

                            $('#basic').text(parseFloat(item.BasicSalaryActual));
                            $('#basicperday').text('(' + (parseFloat(item.BasicSalaryActual) / 30).toFixed(2) + ' US$ / day)');
                            $('#duration').text(item.Duration);
                            $('#overtime').text(parseFloat(item.OvertimeActual));
                            $('#overtimeperday').text('(' + (parseFloat(item.OvertimeActual) / 30).toFixed(2) + ' US$ / day)');

                            $('#total').text(parseFloat(total).toFixed(2));
                            $('#totalperday').text('(' + (parseFloat(total) / 30).toFixed(2) + ' US$ / day)');
                        }

                    }).run();
                });
            });

            Promise.all(items).then(function () {

            });
        }).run();
    }

    function allotees(applicantID) {
        (new http).post("applicant.aspx/allotees", {
            id: applicantID
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    $('#allotee, #allotee-beneficiary').text(item.Allotee);
                    $('#allotee-relationship, #allotee-beneficiary-relationship').text(item.Relationship);
                    $('#allotee-branch').text(item.Branch);
                    $('#allotee-accountNo').text(item.AccountNo);

                    resolve();
                });
            });

            Promise.all(items).then(function () {
            });
        }).run();
    }

    function embark(id) {
    
        (new http).post("embarkations.aspx/embarkation_crew_lists", {
            id: parseInt(id)
        }).then(function (response) {

            var items = response.d.map(item => {

                return new Promise(function (resolve, reject) {

                    var dateToday = getDate();

                   $('#departure-date').text(item.DepartureDate);

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

    function getDate() {
        var today = new Date();  
        var offset = -(today.getTimezoneOffset() / 60); 

        var dateToday = new Date(new Date().getTime() + offset * 3600 * 1000).toUTCString().replace(/ GMT$/, "");

        var d = dateToday.split(' ');

        d.pop();

        return d.join(' ');
    }

    $("a.word-export").click(function(event) {
        $("#export-content").wordExport("Info Master");
    });

    function travel(applicantID) {
        $('#official-docx').text('');

        (new http).post("applicant.aspx/travels", {
            id: applicantID
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    var html = '<tr><td width="14%" class="contentLabel">' + item.Document + '</td>' +
                        '<td width="24%" colspan="2" align="left" class="contentData"><b><i>' + item.DocumentNo + '</i></b></td>' +
                        '<td width="4%">&nbsp;</td>' +
                        '<td align="left" width="13%" class="contentData"><b><i>' + item.IssueDate + '</i></b></td>' +
                        '<td width="17%" class="contentData"> <b><i>' + item.ExpiryDate + '</i></b></td>' +
                        '<td width="12%">&nbsp;</td>' +
	                    '<td width="16%" class="contentData">&nbsp;</td></tr>';

                    $('#official-docx').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
            });
        }).run();
    }

</script>
</html>
