<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report-spa.aspx.cs" Inherits="Seabase.report_spa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>SPECIAL POWER OF ATTORNEY</title>
<style type="text/css">
.body,td{
FONT-FAMILY: arial, verdana, helvetica, geneva, sans-serif; 
font-size: 12px;
}
</style>
</head>

<body>
	<h2 align="center"><u>SPECIAL POWER OF ATTORNEY</u></h2>

<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
<tr><td align="left" colspan="2">KNOW ALL MEN BY THESE PRESENTS:</td></tr>
<tr><td height="10" colspan="2"></td></tr>
<tr><td colspan="2" style="text-indent:90px">I, <b class="fullname"></b>, of legal age, Philippine nationality, with residence at <span id="address"></span>, have named, constituted and appointed</td></tr>

<tr><td height="10" colspan="2"></td></tr>
<tr><td colspan="2" style="text-indent:90px"><b>CONAUTIC MARITIME INC.</b> and/or any of its duly authorized officers and personnel, with office at Suite 312/313 Penthouse, Ermita Center Bldg.
#1350 Roxas Blvd., Ermita Manila, Philippines,</td></tr>
<tr><td height="10" colspan="2"></td></tr>
<tr><td colspan="2" style="text-indent:90px">-and-</td></tr>
<tr><td height="10" colspan="2"></td></tr>
<tr><td colspan="2" style="text-indent:90px"><b id="principal-name"></b> and/or any of its duly authorized officers and personnel, with office at a <span id="principal-address"></span>,</td></tr>
<tr><td height="10" colspan="2"></td></tr>
<tr><td colspan="2" align="left">
to be my true and lawful attorneys-in-fact, for me and in my name, place and stead, to do and perform all or any of the following acts and things, namely:

</td></tr>

<tr><td height="10" colspan="2"></td></tr>

<tr><td colspan="2" align="left">
<p style="text-indent:90px">
<b>"To act on my behalf, execute, file and deliver, the appropriate claim before any office or body, government or private, any unpaid remuneration or 
compensation owing to me as a consequence of my employment onboard the vessel <b id="vessel-name"></b>, and for whatever moneys or benefit due to me under my POEA-approved employment contract, over
 which Conautic Maritime Inc. and/or <b id="principal"></b> has become obliged to pay and honor being my employer.
<br /><br />
</b>
 </p> 
 <p style="text-indent:90px"><b>
To execute, grant and deliver on my behalf full acquittances, subrogation of rights, contracts, waivers and receipts for all and whatever payments are made in settlement of and
 discharge of my claim under this instrument.</b>
 <br /><br />  
 </p> 
<p style="text-indent:90px"><b>
And in general, to do and perform all and every act and thing which may be requisite, necessary or proper to carry out the above purposes."
</b></p> 
</td></tr>
<tr><td height="10" colspan="2"></td></tr>

<tr><td colspan="2" align="left" style="text-indent:90px">
<b>HEREBY GIVING AND GRANTING</b> unto my said attorneys-in-fact full power and authority to do and perform all and every act and thing whatsoever requisite and necessary to be
 done in and about the premises as we might or can lawfully be done if present, with power of substitution and revocation, hereby ratifying and confirming all that our said
 attorneys-in-fact shall lawfully do or cause to be done by virtue of this presents. 
</td></tr>
<tr><td height="10" colspan="2"></td></tr>

<tr><td colspan="2" align="left" style="text-indent:90px">
<b>IN WITNESS WHEREOF</b>, we have hereunto set my hand this ________ day of _______________, 2020, in _______________.</td></tr>

<tr><td height="10" colspan="2"></td></tr>
<tr><td colspan="2" align="right">
<table width="400" border="0">
<tr><td align="center"><b id="fullname"></b></td></tr>
<tr><td align="center">Grantor</td></tr>
</table>
</td></tr>

<tr><td colspan="2" align="center"><b>ACKNOWLEDGEMENT</b></td></tr>
<tr><td colspan="2" align="left">REPUBLIC OF THE PHILIPPINES)</td></tr>
<tr><td colspan="2" align="left">_______________ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;) S.S.</td></tr>
<tr><td height="10" colspan="2"></td></tr>
<tr><td colspan="2" align="left" style="text-indent:90px">
<b>BEFORE ME, NOTARY PUBLIC</b> at the place above mentioned, on this day <span id="date-today"></span>, personally appeared <span id="full"></span>, with Passport No. <span id="passport"></span>, issued at NCR Central, Philippines,
 known to me and me known to be the same person who executed the foregoing instrument and acknowledged to me that the same is his free and voluntary act and deed.
</td>
</tr>

<tr><td height="10" colspan="2"></td></tr>

<tr><td colspan="2" align="left" style="text-indent:90px">

<b>IN WITNESS WHEREOF</b>, I have hereunto set my hand on the date and place first above-written.
<tr><td height="20" colspan="2"></td></tr>
<tr><td colspan="2" align="left">
<table width="100%" border="0">
<tr><td width="70%">Doc. No. ______ ; </td><td width="30%"><b>NOTARY PUBLIC</b></td></tr>
<tr><td width="100%" align="left" colspan="2">Page No. ______ ;</td></tr>
<tr><td width="100%" align="left" colspan="2">Book No. ______ ;</td></tr>
<tr><td width="100%" align="left" colspan="2">Series of 2020.</td></tr>
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

        var today = getDate();

        $('#date-today').text(today);
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

            $('#fullname, .fullname, #full').text(item.Lastname.toUpperCase() + ', ' + item.Firstname.toUpperCase());
            $('#address').html(item.NoOrBldg + ' ' +  item.StreetOrBrgy + ' ' + item.Municipality + ' ' + item.Province);
            $('#birthdate').text(item.Birthdate);
            $('#civil-status').text(item.CivilStatus);

            vessel_info(item.VesselID);
            numbers(id);
        }).run();
    }

    function vessel_info(id) {

        (new http).post("_vessels.aspx/find", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#vessel-name').text(item.Name.toUpperCase());

            principal_info(item.PrincipalID);

        }).run();
    }

    function principal_info(id) {
        (new http).post("principals.aspx/find", {
        id: id
        }).then(function (response) {
            var item = response.d[0];
            $('#principal-name, #principal').text(item.Principal.toUpperCase());
            $('#principal-address').text(item.Address);
            $('#principal-cba').text(item.CBA);
        }).run();
    }

    function numbers(id) {

        var today = getManilaTime().split(',')[0];
        var d = today.split('/');

        var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
        var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

        var formattedDate = d[2] + '-' + d0 + '-' + d1;

        (new http).post("applicant.aspx/numbers", {
            id: id,
            date: formattedDate
        }).then(function (response) {

            var items = response.d[0];

            $('#passport').text(items.Passport);
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