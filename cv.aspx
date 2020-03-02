<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cv.aspx.cs" Inherits="Seabase.cv" %>

<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Seaman's Information System</title>
<link href="content/css/cv.css" rel="stylesheet" />
</head>
<body id="export-content">
<h1 align="center"><i><u><a class="word-export" href="javascript:void(0)"
    title="Click to view Info to the Master in Word format." style="color: #000;">Conautic Maritime Inc.</a></u></i></h1>
<h3 align="center">Curriculum Vitae</h3>

<table width="991" border="0" cellpadding="0" cellspacing="0">
<tr>
    <td>
        <b><font style="font-size:14px" id="position"></font></b>
    </td>
</tr>
<tr><td height="5"></td></tr>
<tr>
	<td valign="top">
        <table width="100%" border="0" cellpadding="2" cellspacing="2">
		    <tr>
                <td><font style="font-size:13px"><b><u>Personal Information</u></b></font></td>
		    </tr>
		    <tr>
                <td>
		            <table width="100%" border="0" cellpadding="2" cellspacing="2">
		                <tr>
                            <td align="left" width="105"><b>Availability:</b></td>
                            <td align="left" width="331"></td>
                            <td align="left" width="105"></td>
                            <td align="right" width="450" rowspan="8" valign="top">
                                 <table>
					                 <tr>
                                         <td class="photo" width="150" height="150" align="center">
						                    <img id="image" src="#" alt="image" width="150" height="150" border="0" />
						                 </td>
					                 </tr>
					             </table>
                            </td>
		                </tr>
		            <tr>
                        <td align="left"><b>Last name:</b></td>
                        <td align="left"><b id="lastname"></b></td>
                        <td align="left"></td>
		            </tr>
		            <tr>
                        <td align="left"><b>First name:</b></td>
                        <td align="left"><b id="firstname"></b></td>
                        <td align="left"></td>
		            </tr>
		            <tr>
                        <td align="left"><b>Middle name:</b></td>
                        <td align="left" id="middlename"></td>
                        <td align="left"></td>
		            </tr>
		            <tr>
                        <td align="left"><b>Date of birth:</b></td>
                        <td align="left" id="birthdate"></td>
                        <td align="left"><b>Age: <span id="age"></span></b></td>
		            </tr>
		            <tr>
                        <td align="left"><b>Place of birth:</b></td>
                        <td align="left" id="birthplace"></td>
                        <td align="left"></td>
		            </tr>
		            <tr>
                        <td align="left"><b>Nationality:</b></td>
                        <td align="left" id="nationality"></td>
                        <td align="left"></td>
		            </tr>
		            <tr>
                        <td align="left"><b>Religion:</b></td>
                        <td align="left" id="religion"></td>
                        <td align="left"></td>
		            </tr>
		            <tr>
                        <td align="left"><b>Height/Weight:</b></td>
		                <td align="left" id="heightweight"></td>
                        <td align="left"></td>
                        <td align="left"></td>
		            </tr>
		            <tr>
                        <td align="left"><b>Email Address:</b></td>
                        <td align="left" id="email"></td>
                        <td align="left"></td>
                        <td align="left"></td>
		            </tr>
		            <tr>
                        <td align="left"><b>Marital Status:</b></td>
                        <td align="left" id="civil-status"></td>
                        <td align="left"></td><td align="left"></td>
		            </tr>
		            <tr>
                        <td align="left"><b>Language:</b></td>
                        <td align="left" id="languages"></td></tr>
		            </table>
		        </td>
		    </tr>
		</table>
    </td>
</tr>
<tr><td height="10"></td></tr>
<tr>
	<td valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="cv_report">
		    <tr>
                <th colspan="11" align="left"><font style="font-size:13px">Documents and Certificates</font></th>
		    </tr>
		    <tr>
                <th align="center" width="331">Description</th>
                <th align="center" width="200">Number</th>
                <th align="center" width="200">Place Issued</th>
                <th width="130" align="center">Date Issued</th>
                <th width="130" align="center">Valid Until</th>
		    </tr>
            <tbody id="cert-tbody">
            </tbody>
		</table>
	</td> 
</tr>
<tr><td height="10"></td></tr>
<tr>
    <td valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="cv_report">
        <tr>
            <th colspan="11" align="left"><font style="font-size:13px">Previous SEA Experience</font></th>
        </tr>
        <tr>
            <th align="center">From</th>
            <th align="center">To</th>
            <th align="center"># months</th>
            <th align="center">Position</th>
            <th align="center">Vessel</th>
            <th align="center">Type</th>
            <th align="center">Company</th>
        </tr>
        <tbody id="work-tbody">
        </tbody>
	    </table>
    </td>
</tr>
<tr><td height="10"></td></tr>
<%--<tr>
	<td valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="cv_report">
            <tr><th colspan="11" align="left"><font style="font-size:13px">STCW78*95 Certificates</font></th></tr>
            <tr>
                <th align="center" width="311">Training / Certificates</th>
                <th align="center" width="100">Code</th>
                <th align="center" width="170">Number</th>
                <th width="180" align="center">Place Issued</th>
                <th width="115" align="center">Date Issued</th>
                <th width="115" align="center">Valid Until</th>
            </tr>
            <tr>
                <td align="left">Certificate - Anti Piracy Training</td>
	            <td align="left">CAPT</td>
	            <td align="left">CMI APC No. 2019-030</td>
	            <td align="left">Manila</td>
	            <td align="left">05/24/2019</td>
	            <td align="left"></td>
            </tr>
		</table>
	</td>
</tr>--%>
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
    });

    function applicant(id) {
        (new http).post("applicants.aspx/applicant", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

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
            $('#civil-status').text(item.CivilStatus).change();
            $('#languages').text(item.Languages);
            $('#position').html('Position Applied for:&nbsp;' + item.Rank);

            numbers();

            training_courses(id);
            crew_works(id);

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

    function getManilaTime() {
        var options = {
            timeZone: 'Asia/Manila',
            year: 'numeric', month: 'numeric', day: 'numeric',
            hour: 'numeric', minute: 'numeric', second: 'numeric',
        },

        formatter = new Intl.DateTimeFormat([], options);
        return formatter.format(new Date())
    }

     $("a.word-export").click(function(event) {
         $("#export-content").wordExport("CV");
    });
</script>
</html>