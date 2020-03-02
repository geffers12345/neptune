<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report-jsu-contract.aspx.cs" Inherits="Seabase.report_jsu_contract" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSU Contract</title>
    <link href="content/css/menu_report.css" rel="stylesheet" />
	<link type="text/css" rel="stylesheet" href="calendar.css?random=20051112" media="screen" />
</head>

<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
	<table border="0" cellspacing="0" width="100%" height="100%" cellpadding="0">
        <tr>
            <td height='100%' align="center" valign="top">
                <table width="100%">
                    <tr>
                        <td valign=top colspan="2">
				            <table border=0 width=100% cellspacing=0 cellpadding=0>		
				                <tr>
				                    <td>
                                        <font face="Arial, Helvetica, sans-serif" size="-7"> Top Copy - Seafarer <br /> 
				                            Pink Copy - Ship's File <br />
				                            Green Copy - ITF London <br />
				                            Yellow Copy - Company File
				                        </font>
				                    </td>
				                </tr>	  				
				                <tr>
                                    <td align=center  colspan="2">
				                        <h2> SEAFARER'S EMPLOYMENT CONTRACT </h2>
				                    </td>
				                </tr> 			   
			                </table>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="-7" id="date-now"></font></td>
                    </tr>

                    <tr>
                        <td colspan="2">

                        <table cellpadding='0' cellspacing='0' width=100% class=report>
                        <tr>
                        <td class="reportis1" style="padding:6px;"> This Employment Contract is entered into between the Seafarer and the Onwer/Agent of the Owner of the Ship ................Marin Shipmanagement BV............... <br>
                        (hereinafter called the Company.) ............CONAUTIC MARITIME INC.............

                         </td>
                        </tr>
                        </table>

                        </td>
                    </tr>

                    <tr>
	                    <td class="is"><br>
	                    <b> THE SEAFARER </b>
	                    </td> 
	                    <td width="26%" valign="bottom" class="is">&nbsp;</td>
                    </tr>
	
        <tr>
            <td height='100%' align=center valign=top colspan="2">
                <table cellpadding='3' cellspacing='0' width=100% class=report>
                    <tr>
	                    <td class="reportis1" width=43% >Surname:
                            <br />
                            <span class="reportis1" id="lastname"></span>
	                    </td>
	                    <td width="57%" class="reportis1">Given Name:
                            <br />
                            <span class="headis" id="firstname"></span>
	                    </td>
                    </tr>
	                <tr>
	                   <td class="reportis1" colspan="2">
                           <span class="reportis1" >Full home address:
                           <span class="reportis1" id="address"></span></span>
	                   </td>
	                </tr>

                    <tr>
	                   <td class="reportis1" >Position<br />
                           <span class="headis" id="position"></span>
	                   </td>
		                 <td class="reportis1">Medical certificate isssued on:
                             <span class="headis"></span>
		                 </td>
	                </tr>

                    <tr>
	                   <td class="reportis1">Estimated time of taking up position:
                           <span class="headis" >
	                         <br>
		                     UPON DEPARTURE
	                       </span>
	                   </td>
		                 <td class="reportis1"> Port where position is taken up:
                             <span class="headis"><br>
		   	                </span>
		                 </td>
	                </tr>

                    <tr>
	                   <td class="reportis1" >Nationality:<br>
                           <span class="headis" id="nationality"></span>
	                   </td>
		               <td class="reportis1">Passport no:<br>
                           <span class="headis" id="passportsnumber"></span></td>
	                </tr>

                    <tr>
	                   <td class="reportis1" >Date of birth:<br />
                           <span class="reportis1"><span class="headis">
                           <span class="headis" id="birthdate"></span></span></span>
	                   </td>
		                 <td class="reportis1">Seaman's book no:<br>
                             <span class="headis" id="seamansnumber"></span>
		                 </td>
	                </tr>

                </table>
            </td>
        </tr>

        <tr>
	       <td class="is" colspan="2"><br> <b> THE EMPLOYER </b> </td>
        </tr>

        <tr>
            <td height='100%' align=center valign=top colspan="2">
                <table cellpadding='0' cellspacing='0' width=100% class=report>

                  <tr>
	                   <td class="reportis1" colspan="2">Name: <br />
	                    <span id="principal-view"></span>
                       </td>
		 
	                </tr>
	                <tr>
	                   <td class="reportis1" colspan="2">Address:</td>
		
	                </tr>
                </table>
            </td>
        </tr>


        <tr>
	        <td class="is" colspan="2"><br>
                <b> THE SHIP </b>
	        </td>
        </tr>

        <tr>
            <td height='100%' align=center valign=top colspan="2">
                <table cellpadding='0' cellspacing='0' width=100% class=report>

                    <tr>
	                   <td width="70%" class="reportis1" >Name: <br />
	                   <span id="vessel-view"></span>
	                   </td>
	   
	                   <td width="52%" class="reportis1" >IMO No: <br />
	                    
                       </td>
	                </tr>
	                <tr>
	                   <td class="reportis1" width="48%" >Flag: <br />
                         </td>
		
		                  <td class="reportis1">Port of registry: <br /></td>
	                </tr>
                </table>
            </td>
        </tr>

        <tr>
	       <td class="is" colspan="2"><br> <b> TERMS OF CONRACT </b> </td>
        </tr>

        <tr>
            <td height='100%' align=center valign=top colspan="2">
                <table cellpadding='0' cellspacing='0' width=100% class=report>

                    <tr>
	                   <td width="34%" class="reportis1" >Period of employment: <br />
	                    <span id="duration"></span>
	                   </td>
	   
	                   <td width="23%" class="reportis1" >Wages from and including: <br />
	                   <B> UPON DEPARTURE </B>   </td>
	   
	                    <td width="43%" class="reportis1" >Basic hours of work per week: <br />
	                   40 HOURS PER WEEK   </td>
	   
	   
	   	            </tr>
	                <tr>
	                   <td class="reportis1" width="34%" >Basic monthly wage: <br />
                            <span id="basic"></span>
	                   </td>
                       <td valign="top" class="reportis1">Monthly overtime<br />
                           <span id="overtime"></span>
			           </td>
                       <td width="43%" class="reportis1" >Overtime rate for hours worked in excess of xxx hrs: <br />

					   </td>
	                </tr>
	
	                <tr>
	                   <td class="reportis1" width="34%" >Leave: Number of days per month <br />

	                   </td>
                       <td class="reportis1" valign="top">Monthly leave pay: <br />
			                <span id="monthly"></span>
                       </td>
	   
	                    <td width="43%" class="reportis1" >Monthly substinence allowance on leave: <br /></td>
	                </tr>
	
	                <tr>
	                   <td class="reportis1" colspan="3" >1. The current IBF Collective shall be considered to be incorporated into and to form part of the contract </td>
		
	                </tr>
	
	                <tr>
	                   <td class="reportis1" colspan="3">2. The Ship's Artivles shall be deemed for all purposes to include the terms of this Contract (including the applicable IBF Agreement) and it shall be the duty  of the Company to ensure that the Ship's Article reflect these terms. These terms shall take precedence over all other terms. </td>
		
	                </tr>
	
	                <tr>
	                   <td class="reportis1" colspan="3" >3. The Seafarer has read, understood the agreed to the terms and conditions of employment as indentified in the Collective Agreement and entres into this Contract freely. </td>
		
	                </tr>
                </table>
            </td>
        </tr>

        <tr>
	        <td class="is" colspan="2"><br> <b> CONFIRMATION OF THE CONTRACT </b> </td>
        </tr>

        <tr>
            <td height='100%' align=center valign=top colspan="2">
                <table cellpadding='0' cellspacing='0' width=100% class="report">

                  <tr>
	                <td height="35" width="46%" class="reportis1" valign="top" >
	   		            <table width="100%">
				            <tr>
					            <td class="reportisnoborder" align="left" colspan="2">
					            Signature of Employer:  
					            </td>
				            </tr>
				            <tr>
                                <td class="reportisnoborder" align="left" width="30%"></td>
					            <td class="reportisnoborder" align="center">
					                <b></b>
                                    <span>-------------------</span>
					                <br />
                                    <span id="asignatory"></span>
					            </td>
				            </tr>
			            </table>
	                </td>
	   
	                <td width="54%" class="reportis1" valign="top">
	   	   	            <table width="100%">
				            <tr>
					            <td class="reportisnoborder" align="left" colspan="2">
					            Signature of Seafarer:  
					            </td>
				            </tr>
				            <tr><td class="reportisnoborder" align="left" width="30%"></td>
					            <td class="reportisnoborder" align="center">
					            <b id="sign-name"></b>
                                    <hr />
                                <span id="sign-title"></span>
					            </td>
				            </tr>
			            </table>

	                </td>
	                </tr>
                </table>
            </td>
        </tr>
	
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

        var dateNow = getDate();

        sign(url.searchParams.get("asignatory"));

        $('#date-now').text('Date ....................... '+ dateNow +' ....................   and agreed to be effective from     ..........................UPON DEPARTURE.............................');
    });

    function sign(id) {
        (new http).post("signatories.aspx/find", {
            id: id
        }).then(function (response) {
            var item = response.d[0];

            $('#sign-name').text(item.Signatory);
            $('#sign-title').text(item.Title);

        }).run();
    }

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

            $('#religion').text(item.Religion);
            $('#heightweight').text(item.Height + ' / ' + item.Weight);
            $('#email').text(item.Email);
            $('#civil-status').text(item.CivilStatus).change();
            $('#languages').text(item.Languages);
            $('#position').html(item.Rank);

            numbers();
            vessel_info(item.VesselID);
            all_timesheets();

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

            console.log(response.d);

            $('#duration').text(response.d[0].Duration + ' mons');

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
</script>
</html>
