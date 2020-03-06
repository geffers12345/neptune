<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report-poea.aspx.cs" Inherits="Seabase.report_poea" %>


<html>
<head>    		
<title>POEA Info Sheet</title>
<style>
	a:link,a:visited {color:black; text-decoration:none;}
	td { font-family: verdana, Helvetica, sans-serif; font-size:11px;}
	.smallv { font-family:  verdana, Helvetica, sans-serif; font-size:10px;}
	.medium { font-family:  verdana, Helvetica, sans-serif; font-size:12px;}
	.small {font-family:  arial,verdana, Helvetica, sans-serif; font-size:10px;}
	.smallu {font-family:  arial,verdana, Helvetica, sans-serif; font-size:10px; BORDER-BOTTOM: #000000 1px solid; PADDING-BOTTOM: 1px;}
	td.report { FONT-SIZE: 11px; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: verdana, arial, helvetica, geneva, sans-serif; BACKGROUND-COLOR: #ffffff;}	
	table.report {BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; BORDER-COLLAPSE: collapse; border-spacing: 0}
	td.box {	BORDER-RIGHT: #000000 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #000000 1px solid; PADDING-LEFT: 1px; FONT-SIZE: 11px; PADDING-BOTTOM: 1px; BORDER-LEFT: #000000 1px solid; COLOR: #000000; PADDING-TOP: 1px; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: verdana,arial, helvetica, geneva, sans-serif;}
</style>
</head>	
		
<body marginheight=0 marginwidth=0 leftmargin=0 topmargin=0>
<table border=0 cellspacing=0 width=100% cellpadding=1 align=center>
<tr><td valign=top>
    <table border=0 width=100% cellspacing=0 cellpadding=1>			
		    <tr>
			    <td valign="top">
				    <table>
						<tr>
						    <td width="200">
								<table class="report" width="100%">
									<tr><td class="small">LATEST PAYMENT MADE</td></tr>
										<tr><td>
													<table>
															<tr>
																	<td valign="top" class="small">1.</td>
																		<td valign="top" class="small">OWWA<br>Membership</td>
																		<td valign="top" class="smallu" width="100">&nbsp;</td>
																</tr>
														</table>
												</td>
										</tr>		
										<tr><td>				
														<table>
															<tr>
																	<td valign="top" class="small">2.</td>
																		<td valign="top" class="small">Philhealth/Medicare</td>
																		<td valign="top" class="smallu" width="60">&nbsp;</td>
																</tr>
														</table>
											</td>
										</tr>
								</table>
							</td>
					    </tr>
							<tr>
								<td>
										<table cellpadding=1 cellspacing=0 width="100%">
												<tr>
														<td>
																<table cellpadding=1 cellspacing=0 width="100%">
																		<tr>
																				<td valign="top" class="small" width="55%">OFW e-Card / ID No.</td>
																					<td valign="top" class="smallu">&nbsp;</td>
																			</tr>
																	</table>
															</td>
													</tr>
													<tr>
														<td>
																<table cellpadding=1 cellspacing=0 width="100%">
																		<tr>
																				<td valign="top" class="small" width="25%">SSS No.</td>
																					<td valign="top" class="smallu" id="sss"></td>
																			</tr>
																	</table>
															</td>
													</tr>
													<tr>
														<td>
																<table cellpadding=1 cellspacing=0 width="100%">
																		<tr>
																				<td valign="top" class="small" width="36%">SRC No</td>
																					<td width="64%" valign="top" class="smallu" id="src"></td>
																	</tr>
																	</table>
															</td>
													</tr>
													<tr>
														<td>
																<table cellpadding=1 cellspacing=0 width="100%">
																		<tr>
																				<td valign="top" class="small" width="37%">Philhealth No.</td>
																					<td valign="top" class="smallu" id="philhealth"></td>
																			</tr>
																	</table>
															</td>
													</tr>
											</table>
									</td>
							</tr>
					</table>
			    </td>
					<td valign="middle" align="center">
							<table>				  
						<tr><td align=center>
											PHILIPPINE OVERSEAS EMPLOYMENT ADMINISTRATION<br>
											OVERSEAS WORKERS WELFARE ADMINISTRATION<br>
											PHILIPPINE HEALTH INSURANCE CORPORATION<br>
									</td></tr>
							<tr height=15><td></td></tr>		
							<tr><td align=center class="medium">
											<a href="#" ><b>INFORMATION SHEET</b></a>
									</td></tr>
							</table>		
				 	</td>
					<td valign="top" align="right">
						<table>
							<tr>
								<td width="200">
									<table class="report" width="100%">
											<tr><td class="small" align="center"><b>DO NOT WRITE ON THIS SPACE</b><br>
													(For POEA, OWWA, Philhealth Use Only)
														</td></tr>														
												<tr height=5><td></td></tr>						
												<tr><td>
															<table width="100%" cellpadding=1 cellspacing=0>
																	<tr>
																				<td valign="top" class="small" width="20%">CG No.</td>
																				<td valign="top" class="smallu">&nbsp;</td>
																		</tr>
																</table>
														</td>
												</tr>		
												<tr><td>				
																<table width="100%" cellpadding=1 cellspacing=0>
																	<tr>
																				<td valign="top" class="small" width="20%">RPS No.</td>
																				<td valign="top" class="smallu">&nbsp;</td>
																		</tr>
																</table>
													</td>
												</tr>
												<tr><td>				
																<table width="100%" cellpadding=1 cellspacing=0>
																	<tr>
																				<td valign="top" class="small" width="45%">Assessment No.</td>
																				<td valign="top" class="smallu">&nbsp;</td>
																		</tr>
																</table>
													</td>
												</tr>
												<tr><td>				
																<table width="100%" cellpadding=1 cellspacing=0>
																	<tr>
																				<td valign="top" class="small" colspan=3>Assessment Amount</td>
																		</tr>
																		<tr>																										
																				<td valign="top" width="10%">&nbsp;</td>
																				<td valign="top" class="small" width="20%">POEA</td>
																				<td valign="top" class="smallu">&nbsp;</td>
																		</tr>
																		<tr>																										
																				<td valign="top">&nbsp;</td>
																				<td valign="top" class="small">OWWA</td>
																				<td valign="top" class="smallu">&nbsp;</td>
																		</tr>
																		<tr>																										
																				<td valign="top">&nbsp;</td>
																				<td valign="top" class="small">PHILHEALTH</td>
																				<td valign="top" class="smallu">&nbsp;</td>
																		</tr>
																</table>
													</td>
												</tr>
												<tr height=5><td></td></tr>
										</table>
								</td>
							</tr>										
						</table>		
					</td>
		    </tr>				   
		</table>		 
    </td>
</tr>
	

<tr>
    <td>
		<table width="100%" cellpadding="0" cellspacing="0">
		<tr><td valign="top" width="85%"><font face='arial' style="font-size:10px"><b>I. <u>PERSONAL DATA</u></td>
					<td valign="top" width="15%" align="center" class="smallv"><font face='arial' style="font-size:10px"><b><u>Change/s (if any)</u></b></td>
				</tr>	
		<tr><td colspan="2" align="right"><span class="smallv"><font face='arial'>(for balik-manggagawa only)</span></td></tr>					
		</table>
	</td>
</tr>
		
<tr><td>

<table width=100% cellpadding=1 cellspacing=0>
    <tr>
        <td width=80><font face='arial' style="font-size:10px"><b>Name</b></td>
		    <td class=report><font face='arial' id="lastname"></td>
			<td class=report><font face='arial' id="firstname"></td>
			<td class=report><font face='arial' id="middlename"></td>
		</tr>
		<tr><td></td>
		    <td class="smallv">Family Name (Apelyido)</td>
				<td class="smallv">First Name (Pangalan)</td>
				<td class="smallv">Middle Name (Gitnang Apelyido)</td>
		</tr>		
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
        <td width=250><font face='arial' style="font-size:10px"><b>Address in the Philippines: (Tirahan)</td>
        <td class=report><font face='arial' style="font-size:10px" id="address"></td>
    </tr>
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
        <td width="15%"><font face='arial' style="font-size:10px"><b>Telephone No.</td>
        <td width="16%" class=report><font face='arial' id="tel"></td>
		<td width="15%" align="right"><font face='arial' style="font-size:10px"><b>Cellphone No.</td>
        <td width="16%" class=report><font face='arial' id="cellphone"></td>
		<td width="16%" align="right"><font face='arial' style="font-size:10px"><b>Email Address</td>
        <td width="22%" class=report><font face='arial' id="email">&nbsp;</td>
	</tr>
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
        <td width="15%" valign="top"><font face='arial' style="font-size:10px"><b>Date of Birth</td>
		<td width="16%" valign="top">
			<table cellpadding=1 cellspacing=0>
				<tr><td class=report>&nbsp;<font face='arial' style="font-size:10px" id="birthdate"></td></tr>
				<tr><td class="smallv">YYYY&nbsp;MM&nbsp;DD</td></tr>
			</table>
		</td>            
		<td width="15%" align="right"><font face='arial' style="font-size:10px"><b>Sex</td>
        <td width="16%">
			<table>
				<tr>
					<td id="sex"></td>
				</tr>
			</table>
		</td>
		<td width="16%" align="right"><font face='arial' style="font-size:10px"><b>Civil Status</td>
        <td width="16%">
			<table>
				<tr>
					<td width="50" id="civil-status"></td>
				</tr>
			</table>
		</td>
		</tr>
		<tr>
			<td width="15%"><font face='arial' style="font-size:10px"><b>Place of Birth</b></td>
			<td class=report colspan="3"><font face='arial' id="birthplace"></font></td>
		<td colspan="1"></td>
		</tr>
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
		<td width="6%"><font face='arial' style="font-size:10px"><b>SIRB No.</td>
		<td width="16%"  class=report><font face='arial' id="seamans"></td>
		<td width="10%" align="right"><font face='arial' style="font-size:10px"><b>Passport No.</td>
		<td width="16%"  class=report><font face='arial' id="passport"></td>
		<td width="20%" align="right"><font face='arial' style="font-size:10px"><b>Highest Educational Attainment</td>
        <td class=report><font face='arial'>&nbsp; <span id="highest"></span></td>
	</tr>
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
        <td width="27%"><font face='arial' style="font-size:10px"><b>Name of Spouse (if married)</td>
		<td width="16%" class=report>&nbsp;<font face='arial' id="spouse"></td>
		<td width="30%" align="right"><font face='arial' style="font-size:10px"><b>Mother's Full Maiden Name</b></td>
        <td class=report><font face='arial' id="mother"></td>
	</tr>
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr><td><font face='arial' style="font-size:10px"><b>Legal Beneficiaries (Mga tatanggap ng benepisyo mula sa OWWA)</td></tr>
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
		    <td width="35%" class="smallv" align="center"><font face='arial' style="font-size:10px"><b>Name</td>
				<td width="25%" class="smallv" align="center"><font face='arial' style="font-size:10px"><b>Relationship to Worker</td>
				<td width="40%" class="smallv" align="center"><font face='arial' style="font-size:10px"><b>Address</td>		    
		</tr>
		<tbody id="beneficiaries-tbody">
            
		</tbody>	
		<tr>
		    <td class="report" align="center"><font face='arial'>&nbsp;  </td>
				<td class="report" align="center"><font face='arial'>&nbsp;</td>
				<td class="report" align="center"><font face='arial'>&nbsp;</td>
		</tr>		
		<tr>
		    <td class="report" align="center"><font face='arial'>&nbsp;  </td>
				<td class="report" align="center"><font face='arial'>&nbsp;</td>
				<td class="report" align="center"><font face='arial'>&nbsp;</td>
		</tr>		
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr><td><font face='arial' style="font-size:10px"><b>Allottee (Itinalaga ng padadalhan ng bahagi ng sahod ng OFW/Seafarer)</td></tr>
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
		<tr>
				<td class="report" id="allotee"></td>
		</tr>
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr><td><font face='arial' style="font-size:10px"><b>Legal Dependents (Mga tatanggap ng benepisyo mula sa Philhealth)</td></tr>
</table>


<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
		<td width="35%" class="smallv" align="center"><u><font face='arial' style="font-size:10px"><b>Name of Spouse/Children/Parent</td>
			<td width="10%" class="smallv" align="center"><u><font face='arial' style="font-size:10px"><b>Sex</td>
			<td width="25%" class="smallv" align="center"><u><font face='arial' style="font-size:10px"><b>Relationship of Dependent to Worker</td>
			<td width="30%" class="smallv" align="center"><u><font face='arial' style="font-size:10px"><b>Date of Birth</td>		    
	</tr>

    <tbody id="dependents"></tbody>
					
</table>

</td></tr>

<tr height="20"><td></td></tr>

<tr>
    <td>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
		    <tr><td valign="top" width="85%"><font face='arial' style="font-size:10px"><b>II. <u>CONTRACT PARTICULARS</u></td>
						<td valign="top" width="15%" align="center" class="smallv"><font face='arial' style="font-size:10px"><b><u>Change/s (if any)</u></b></td>
					</tr>	
			<tr><td colspan="2" align="right"><span class="smallv"><font face='arial'>(for balik-manggagawa only)</span></td></tr>					
		</table>
	</td>
</tr>

<tr><td valign="top">

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
		    <td class="smallv" width="35%"><b>Name of Principal / Company / Employer</b></td>
				<td class="report" width="49%"><span face='arial' id="principal-name"></span></td>
				<td width="1%">&nbsp;</td>
				<td width="15%" class="report"></td>
		</tr>		
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
		    <td class="smallv" width="10%"><b>Address</b></td>
				<td class="report" width="35%"><span face='arial' id="principal-address"></span>&nbsp; </td>
				<td class="smallv" width="15%" align="right"><b>Email Address</b></td>
				<td class="report" width="24%"><span face='arial' id="principal-email"></span>&nbsp; </td>
				<td width="1%">&nbsp;</td>
				<td width="15%" class="report"></td>
		</tr>		
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
		    <td class="smallv" width="15%"><font face='arial' style="font-size:10px"><b>Name of Vessel</b></td>
				<td class="report" width="35%"><font face='arial'>&nbsp; <span id="vessel-name"></span></td>
				<td class="smallv" width="10%" align="right"><font face='arial' style="font-size:10px"><b>Tel No.</b></td>
				<td class="report" width="24%"><font face='arial'>&nbsp; <span id="vessel-contact"></span></td>
				<td width="1%">&nbsp;</td>
				<td width="15%" class="report"><font face='arial'>&nbsp;</td>
		</tr>		
</table>


<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
		    <td class="smallv" width="24%"><font face='arial'><b>Position of OFW/Seafarer</b></td>
				<td class="report" width="28%"><font face='arial'>&nbsp; <span id="position"></span></td>
				<td class="smallv" width="16%" align="right"><font face='arial'><b>Contract Duration</b></td>
				<td class="report" width="16%"><font face='arial'>&nbsp;&nbsp; <span id="duration"></span></td>
				<td width="1%"><font face='arial'>&nbsp;</td>
				<td width="15%" class="report"><font face='arial'>&nbsp;</td>
		</tr>		
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
		    <td class="smallv" width="20%"><font face='arial'><b>Monthly Salary</b></td>
				<td class="report" width="30%"><font face='arial' id="basic"></td>
				<td class="smallv" width="18%" align="right"><font face='arial'><b>Currency</b></td>
				<td class="report" width="16%"><font face='arial'>&nbsp;USD</td>
				<td width="1%"><font face='arial'>&nbsp;</td>
				<td width="15%" class="report"><font face='arial'>&nbsp;</td>
		</tr>		
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
		    <td class="smallv" width="60%"><font face='arial'><b>Last date of arrival in the Phils. of the OFW balik-manggagawa/seafarer</td>
				<td class="report" width="24%"><font face='arial'>&nbsp;</td>
				<td width="1%"><font face='arial'>&nbsp;</td>
				<td width="15%" class="report"><font face='arial'>&nbsp;</td>
		</tr>		
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
		    <td class="smallv" width="60%"><font face='arial'><b>Date of scheduled departure/return of balik-manggagawa to the jobsite</td>
				<td class="report" width="24%"><font face='arial'>&nbsp;</td>
				<td width="1%"><font face='arial'>&nbsp;</td>
				<td width="15%" class="report"><font face='arial'>&nbsp;</td>
		</tr>		
</table>

<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
		    <td class="smallv" width="51%"><font face='arial'><b>Name of Philippine Recruitment/Manning Agency (if applicable)</td>
				<td class="report" width="33%"><font face='arial'>&nbsp;Conautic Maritime Inc.</td>
				<td width="1%"><font face='arial'>&nbsp;</td>
				<td width="15%" class="report"><font face='arial'>&nbsp;</td>
		</tr>		
</table>

</td>
</tr>

<tr height="12"><td></td></tr>

<tr><td valign="top">
<table width=100% cellpadding=1 cellspacing=0  border=0>
    <tr>
				<td><font face='arial'>I hereby certify that the above statements are true and correct and further declare that the above-named dependents have not been declared by my spouse/brother/sister. 
				(Ako ay nagpapatunay na ang nasa itaas na pahayag ay totoo at tama at dagdag kong inihahayag na ang mga nasabing makikinabang sa itaas ay hindi inihayag ng aking asawa o kapatid.)
				</
				</td>
		</tr>		
</table>

</td></tr>

<tr><td>&nbsp;</td></tr>

<tr>
<td align=right>
    <table width=30% cellpadding=1 cellspacing=0 border=0>
    <tr><td class="report">&nbsp;</td></tr>
		<tr><td align="center"><font face='arial' style="font-size:10px"><b>Signature/Thumbmark of OFW/Seafarer</td></tr>
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

            numbers();

            rankSalary(item.RankID);
            education(id);
            benefit(id);
            family(id);
            allotees(id);
            beneficiary(id);
            crewEmbark(id, item.VesselID);
            vessel_info(item.VesselID);
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
            $('#license').text(items.Eregistration);
            $('#seamans').text(items.Seaman);
            $('#passport').text(items.Passport);
        }).run();
    }

    function benefit(id) {
        (new http).post("applicant.aspx/benefit", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#sss').text(item.SSS);
            $('#philhealth').text(item.Philhealth);

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

            var alls = [];

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    alls.push(item.Allotee);

                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('#allotee, #allotee-beneficiary').text(alls.join(', '));
            });
        }).run();
    }

    function education(id) {

        (new http).post("applicant.aspx/education", {
            id: id
        }).then(function (response) {

            $('#highest').text(response.d[0].Course);

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

    function beneficiary(id) {
        $('#beneficiaries-tbody').empty();

        (new http).post("applicant.aspx/beneficiary", {
            id: id
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    var html = '<tr>' +
		                            '<td class="report" align="center"><font face="arial">' + item.Name + '</td>' +
				                        '<td class="report" align="center"><font face="arial">' + item.Relationship + '</td>' +
				                        '<td class="report" align="center"><font face="arial">' + item.Address + '</td>' +
                        '</tr>';

                    if (item.DateUpdated == "1") {
                        $('#dependents').append('<tr>' +
		                                '<td class="report" align="center"><font face="arial">&nbsp;' + item.Name + '</td>' +
				                            '<td class="report" align="center"><font face="arial">&nbsp;' + item.Sex + '</td>' +
				                            '<td class="report" align="center"><font face="arial">&nbsp;' + item.Relationship + '</td>' +
				                            '<td class="report" align="center"><font face="arial">&nbsp;' + item.Birthday + '</td>' +
		                            '</tr>');
                    }

                    $('#beneficiaries-tbody').append(html);

                    resolve();
                });
            });

            Promise.all(items).then(function () {
            });
        }).run();
    }

    function crewEmbark(crewID, vesselID) {

        (new http).post("embarkations.aspx/crewEmbark", {
            crewID: crewID,
            vesselID: vesselID
        }).then(function (response) {

            $('#duration').text(response.d[0].Duration + ' mos.');
        }).run();
    }

    function vessel_info(id) {

        (new http).post("_vessels.aspx/find", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#vessel-name').text(item.Name);
            $('#principal-name').text(item.Principal);
            $('#vessel-contact').text(item.ContactPersonNumber);

            principal_info(item.PrincipalID);

        }).run();
    }

    function principal_info(id) {
        (new http).post("principals.aspx/find", {
        id: id
        }).then(function (response) {
            var item = response.d[0];
        
            $('#principal-address').text(item.Address);
            $('#principal-email').text(item.Email);
        }).run();
    }
</script>
</html>