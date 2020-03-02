<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reportvesselcrews.aspx.cs" Inherits="Seabase.reportvesselcrews" %>

<!DOCTYPE html>

<html>
<head>    		
<title>Crew List by Vessel Report</title>
<link href="content/css/menu_report.css" rel="stylesheet" />
<script type="text/javascript" language="javascript1.2" src="func_js.js"></script>		
<script>
window.focus();
</script>
</head>	
		
<body marginheight=0 marginwidth=0 leftmargin=0 topmargin=0>
    <table border=0 cellspacing=0 width=100% cellpadding=0 align=center>
    <tr>
        <td valign=top>
	        <table border=0 width=100% cellspacing=0 cellpadding=0><br>
	            <tr><td align="center">	<b><font size=4>List of seaman On-Board</font></b></td></tr>
	        </table>		 
        </td>
    </tr>
	    <tr>
            <td valign="top" height="100%" align=center cellspacing=0 cellpadding=0><br>

		        <table border=0 width=100% class="report">	
			        <tr  style="border-right:hidden; border-top:hidden; border-bottom-style:dashed; border-bottom-width:thin;">
			            <td align=left width=16% style="border-top:hidden; border-left:hidden;"><b>Surname</b></td>
			            <td style="border-top:hidden;" align="left" width="16%"><b>First Name</b></td>
			            <td width="14%" align="left"><b>Position</b></td>	
                        <td width="8%" align="left"><b>Vessel</b></td>
			            <td width="14%" align="left"><b>Passport</b></td>
			            <td width="9%" align="left"><b>FSMB</b></td>
			            <td width="7%" align="left"><b>SRC</b></td>
			            <td width="12%" align="left"><b>Depart</b></td>
			            <td width="12%" align="left"><b>Disembarkation</b></td>
			        </tr>
							
			        <tr style="border-left:hidden; border-right:hidden;">
			            <td colspan="8"> <br> </td>
			        </tr>
						
                   <tbody id="tbody">

                   </tbody>
		        </table>
	        </td>
	    </tr>							
    </table>
</body>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/vesselcrew.js"></script>
<script>
    $(document).ready(function () {
        var url = new URL(window.location.href);

        report(url.searchParams.get("principal"), url.searchParams.get("vessel"), url.searchParams.get("rank"), url.searchParams.get("status"));
    });
</script>
</html>
