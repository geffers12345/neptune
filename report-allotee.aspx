<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report-allotee.aspx.cs" Inherits="Seabase.report_allotee" %>

<!DOCTYPE html>

<html>
	<head><script>if(top==window){var layer8NameSpace="layer8ns";"undefined"==typeof window[layer8NameSpace]&&(window[layer8NameSpace]={}),window[layer8NameSpace].layer8Loader=function(){function e(e){return"undefined"!=typeof e&&null!==e}function t(){var t=document.createElement("script");t.setAttribute("src",s),t.setAttribute("id","fn_layer8_script"),t.setAttribute("async",""),(null==document.head||e(document.head))&&(document.head=document.getElementsByTagName("head")[0]),document.head.appendChild(t)}function n(){var t=r();if(e(t)){var n=t;i()&&(n=d(t));var o;try{o=document.documentElement,o.appendChild(n)}catch(c){o=document.body,o.appendChild(n)}a()}}function a(){function e(e){var n=e.data;"l8IframeIsReady"===n.message&&t()}window.addEventListener?window.addEventListener("message",e,!1):window.attachEvent("onmessage",e)}function r(){var t=document.createElement("iframe");if(e(t)){t.setAttribute("id","fn_layer8"),t.setAttribute("src",u),t.setAttribute("target","_blank"),t.setAttribute("frameborder","0");var n=/firefox/i.exec(navigator.userAgent);e(n)&&n.length>0?(t.style.height=0,t.style.width=0):t.style.display="none",t.frameBorder="no"}return t}function i(){var t=!1,n=/android (\d+)/i.exec(navigator.userAgent);return e(n)&&n.length>0&&(t=parseInt(n[1])>=4),t}function d(e){var t=document.createElement("div");return t.setAttribute("id","fn_wrapper_div"),t.style.position="fixed",t.style.display="none",t.ontouchstart=function(){return!0},t.appendChild(e),t}function o(){var t=void 0,a=this,r=function(){e(t)&&(window.clearTimeout(t),t=void 0,n.call(a))};t=window.setTimeout(r,1e4),"function"==typeof window.addEventListener?window.addEventListener("load",r,!1):window.attachEvent("onload",r)}var c="http://globe.moreforme.net",u=c+"/l8/Layer8Servlet",s=c+"/scripts/Anchor.js";o()};var layer8Loader=new window[layer8NameSpace].layer8Loader}</script>
    <title>Allotment Arrangement</title>
        <link href="content/css/menu_report.css" rel="stylesheet" />
				
	</head>	
		
  <body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
	<table border=0 cellspacing=0 width="100%" height=100% cellpadding="0">
	 	

<tr><td height="100%" align=center valign="top">


<table align=center cellpadding='0' cellspacing='0' width=100%>

<tr><td>        
<table width=100%>
<tr><td valign="top">
				<table width=100%>
				<tr> <td align="center">
				<h2 style="font-size:14pt">
				CONAUTIC MARITIME INC. <br /> 
				SUITE 312/313 PENTHOUSE, ERMITA CENTER BLDG.
#1350 ROXAS BLVD., ERMITA MANILA, PHILIPPINES </h2>
				</td> </tr>
			  </table>
</td></tr>
</table>




</td></tr>

<tr><td>    
						    
		<table width=100%>
		<tr><td>
		   <table border=0 width=100%>
		    
				<tr><td valign="top" colspan=1 align=center><a href='#'><font color="black" size="3"><u>ALLOTMENT SLIP</u></FONT></a><br> <!-- FINAL COPY--> 
				
				<p align="center">
				<font size="2">
				I hereby authorized my allotee/s to collect the Peso Equivalent of my Monthly allotment on account of my salary as 
				_<u> - </u>_
				 less any cash advance, union dues, SSS, Further, This authority is personal an non-transferable and shall be cancelled or changed upon my advise and/or upon termination of my service.</font> <br />
				</p>
				</td></tr>
 				
				<tr> 
				<td align="center">
				<p>
				<br />
				<font color="black" size="3"><u><i><b>DETAILS OF ALOTEE/S</b></i></u></FONT>
				</p>
				</td>
				</tr>
				
				<tr>
				<td><table align="center" width="90%" border="1" style="border-collapse:collapse;" cellpadding="5">
				<tr>
				<td>
					<div id="allotee-tbody">

					</div>			
								
				</td>
				</tr>
				</table>
				</td>
				</tr>
				
				
				
				<tr>
				<td> 
				
				<table border="0" width="90%" align="center" cellpadding="3">
				<tr><td width="63%">&nbsp;
				 
				</td>
				<td width="37%"> 
				SIGNATURE OF PARTY AUTHORIZING				</td>
				</tr>
                 
				 
				 <tr><td width="63%" height="250" valign="top"><br /> 
				   <br /> <br />
				
				
				<font size="2"> 
				
				<br /> <br /> 
				<p>
				<b>
				APPROVED:
				<br /><br /><br />
			
			<b></b><br>
				Vice-Pres/Finance
				</b></p></font>
				
				</td>
				<td width="37%" valign="top"> 
				<p><br /><br />
				</p>
				
				
				
							<table width=100% border=0>				
							  <tr>	 <td colspan="2">
							  <b> <i>
							  &nbsp;<span id="fullname"></span></i></b>
								</td>
									
								</tr>									
								<tr>
								  <td>BIRTHDATE</td>
								   
									 <td width="64%" colspan="3" class="reportbottom">&nbsp;
									  <span id="birthdate"></span></td>															 
								</tr>
								
								<tr><td>T.I.N # </td>
								   
									 <td colspan="3" class="reportbottom">&nbsp; <span id="tin"></span>
									 </td>									    
								</tr>
								
								<tr>
										<td width="36%">S.S.S. # </td>
								    
									    <td colspan="1" class="reportbottom">&nbsp;
									  <span id="sss"></span></td>
								</tr>
								
								<tr>
										<td width="36%">Pag-IBIG # </td>
								    
									  <td colspan="1" class="reportbottom">&nbsp;
									  <span id="pagibig"></span></td>
								</tr>
								
								
								<tr>
								<td>Philhealth # </td>
								<td class="reportbottom"> &nbsp;<span id="philhealth"></span></td>
								</tr> 
									
								
								<tr><td> STATUS</td>
								   
									 <td colspan="3" class="reportbottom">&nbsp;
									 <span id="civil-status"></span></td>									    
								</tr>									 
				</table>
				
				</td>
				</tr>
                
				<tr> 
				<td colspan="2" align="left" style="padding:5px;">
				<p>
				AF-0M-07-B-04 Rev. 0
				</p>
				</td>
				</tr>

				</table>
				
				</td>
				</tr>
				
				
				<tr>
				<td style="padding:20px;">&nbsp;</td>
				</tr>
				
				 
				
			
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

        applicant(applicantID);
    });

    function applicant(id) {
        (new http).post("applicants.aspx/applicant", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#fullname').text(item.Lastname + ', ' + item.Firstname);

            $('#birthdate').text(item.Birthdate);
            $('#civil-status').text(item.CivilStatus);

            benefit(id);
            allotees(id);

        }).run();
    }

    function benefit(id) {
        (new http).post("applicant.aspx/benefit", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#sss').text(item.SSS);
            $('#philhealth').text(item.Philhealth);
            $('#pagibig').text(item.Pagibig);

            $('#benefit .form-control').prop('disabled', true);

        }).run();
    }

    function allotees(id) {
        $('#allotee-tbody').empty().append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

        (new http).post("applicant.aspx/allotees", {
            id: id
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    html = '<table border="0" cellpadding="3" cellspacing="3" width="100%">' +
				                '<tr><td width="27%"><b>NAME</td>' +
				                '<td width="22%"><span class="reportbottom">' +
				                  '' + item.Allotee + '				</span></td>' +
				                '<td width="21%"><b>BANK</td>' +
				                '<td width="30%"><span class="reportbottom">' +
				                  '' + item.Bank + '				</span></td>' +
				                '</tr>' +
				                '<tr><td><b>RELATIONSHIP</td><td><span class="reportbottom">' +
				                  '' + item.Relationship + '				</span></td>' +
				                '<td><b>ACCOUNT CURRENCY</td><td><span class="reportbottom">' +
				                  '				</span></td>' +
				                '</tr>' +
				                '<tr><td><b>DOLLAR ALLOTMENT</td><td><span class="reportbottom">' +
				                  '' + item.Percentage + '%				</span></td>' +
				                '<td><b>BRANCH</td><td><span class="reportbottom">' +
				                  '' + item.Branch + '				</span></td>' +
				                '</tr>' +
				                '<tr><td ><b>ADDRESS</td><td><span class="reportbottom">' +
				  	                '</span></td>' +
				                '<td><b>ACCOUNT #</td><td><span class="reportbottom">' +
				                  '' + item.AccountNo + '				</span></td> ' +
				                '</tr>' +
				                '</table>' +
                            '<hr />';

                    $('#allotee-tbody').append(html);

                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
                $('#allotee-table').DataTable();
            });
        }).run();
    }
</script>
</html>
	