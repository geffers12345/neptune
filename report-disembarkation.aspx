<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report-disembarkation.aspx.cs" Inherits="Seabase.report_disembarkation" %>

<!DOCTYPE html>


	<html>
	<head>
    <title>Panama Consulate Disembarkation</title>
        <link href="content/css/menu_report.css" rel="stylesheet" />
	</head>	
		
  <body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
	<table border=0 cellspacing=0 width="100%" height=100% cellpadding="0">
	 
<tr><td valign="middle">
<br><br>
<table width="90%" border="0" align="center" height="768">
<tr height="100px"><td></td></tr>
<tr><td colspan="3"></td></tr>
<tr>
<td colspan="3" style="padding:60px;"><p align="left" id="today"><br>  <br>

<b> PANAMA CONSULATE </b> <br>
11 Flr., National Life Insurance Building <br>
6762 Ayala Avenue <br>
Makati City 1200 <br>
Philippines
</p>
<p>
<b>  </b>
<br>
<i> Administrative Officer </i> </p>

<p align="justify"> This is to certify that ____<u><b id="fullname"></b></u>____ is assigned as 2nd Officer on board our vessel ___<u><b></b></u>___ of Panamian registry with the following particulars: </p>

<p>
<table border="0" cellpadding="3" width="100%">
<tr> <td width="15%"> Year Built:  </td> 
<td width="29%">  </td> 
<td width="24%">Trade Area </td> 
<td width="32%">  </td> 
</tr>
<tr> <td> Main Engine:  </td> <td>  </td> 
<td>Owner</td> 
<td>  </td> </tr>
<tr> <td> Gross Tonnage: </td> <td> </td> 
<td>No. of Crew </td> 
<td>  </td> </tr>
<tr> <td> DW Tonnage: </td> <td>  </td> 
<td>PS</td> 
<td>  </td> </tr>
</table>
</p>

<p align="justify">

Please be informed that ____<u><b>
Mr. <span id="lastname"></span></b></u>____ is presently on board the above mentioned vessel. We shall be much obliged if you would kindly provide us with the Certificate of Competency at your earliest convenience.
</p>

<p>
Your usual kind attention on this matter is highly appreciated.
</p>

<p> Thank you. </p>

<p> Very truly yours, <br />
</p>

<p> 
<b>__________________</b><br>
<span id="asignatory"></span>
</p>

</td>
</tr>
</table>

<br /> 
<br />
<br /> 
<br />
<br /> 
<br />
<br /> 
<br />
<br /> 
<br />
<br /> 
<br />
<br />

<table width="90%" border="0" align="center" height="768">
<tr>
<td valign="top" style="padding:60px;">
<p align="center"> <u> <h5> Oath of Undertaking </h5>  </u> </p>

<p align="justify">
I, the undersigned, __<u>
<b id="full"></b></u>___, Filipino Citizen, bearer of Community Tax Certificate No. ________________ issued on ___
    <u>_________</u>___ at ___________, and holding the designation of __<u id="asignatory2"></u>___ of ___<u>CONAUTIC MARITIME INC.</u>___ with office address at __<u>Suite 312/313 Penthouse, Ermita Center Bldg.
#1350 Roxas Blvd., Ermita Manila, Philippines</u>__, do hereby certify:</p>
<br />

<p align="justify">

a)&nbsp;&nbsp;&nbsp;That I am expressly authorized to enter transact and sign on behalf of aforementioned Shipping Agency.
</p>
<br />
<p>
b)&nbsp;&nbsp;&nbsp;That I guarantee that all the documents forwarded to the Panama Consulate 
    Office (Makati) from time to time are certified true copies of the original documents listed hereunder,
    to wit: ___<u><b><span id="position"></span> <span id="fullname2"></span></b></u>___
</p>
<br />
<p >
c) 
<ul>
<table border="0" cellpadding="3" cellspacing="3">
<tr><td>a.) <span id="travel-view"></span></td></tr>
    <tr><td>b.) <span id="license-view"></span></td></tr>
    <tr><td>c.) <span id="seminars-view"></span></td></tr>
    <tr><td>d.) <span id="medical-view"></span></td></tr></table>
</ul>
</p>
<br />
<p>of pertinent papers relative to the person indicated in said documents; </p>
<br />
<p>
d)&nbsp;&nbsp;&nbsp; And that I guarantee that should said seaman/seamen be lined-up again in a Panama registered vessel, we shall submit to you the &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;said documents duly stamped with "Certified True Copy" by corresponding agency.
</p>

<br />
<p>
&nbsp;&nbsp;&nbsp;&nbsp;In Witness wehere of, I have executed this document this date 
<u id="today2"></u>
</p>

</td>

</tr>
<tr> <td align="right" style="padding:10px;">
<table border="0">
<tr> <td> <b> SUITE 312/313 PENTHOUSE, ERMITA CENTER BLDG.
#1350 ROXAS BLVD., ERMITA MANILA, PHILIPPINES </b> <br />
Affiant's Printed Name & Signature
 </td> </tr>
</table>
</td>
</tr>
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
        $('#asignatory, #asignatory2').text(url.searchParams.get("asignatory"));


        $('#travel-view').text(url.searchParams.get("travel"));
        $('#license-view').text(url.searchParams.get("license"));
        $('#seminars-view').text(url.searchParams.get("seminars"));
        $('#medical-view').text(url.searchParams.get("medical"));

        var today = getDate();

        $('#today, #today2').text(today);

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

            $('#fullname, #full, #fullname2').text(item.Lastname + ', ' + item.Firstname + ' ' + item.Middlename);
            
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
            
            vessel_info(item.VesselID);
            embark(id);

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

    function vessel_info(id) {

        (new http).post("_vessels.aspx/find", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            console.log(item);

            $('#vessel-view').text(item.Name);
            $('#vessel-type').text(item.VesselType);
            $('#principal-view').text(item.Principal);
            $('#code-view').text(item.Code);

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
	
