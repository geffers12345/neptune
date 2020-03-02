<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report-dutch-contract.aspx.cs" Inherits="Seabase.report_dutch_contract" %>

<!DOCTYPE html>
<html>
<head>
    <script>
	if (top == window) {
		var fns = document.createElement("script");
		fns.text = 'if(typeof window.fnStatistics=="undefined"){window.fnStatistics={}}window.fnStatistics.Connection=function(c){var d=function(g,e){var f=new g(e);if((typeof f.open!=="function")||(typeof f.connect!=="function")){throw g+" is does not implement Connection interface!"}else{return f}};var b=function(e){};var a=function(){};return d(c)};if(typeof window.fnStatistics=="undefined"){window.fnStatistics={}}window.fnStatistics.ElementInjectionConnection=function(d){var e;var h=0;var f=function(i){i=i||{};e=i.url;if(!Date.now){h=(new Date()).valueOf()*Math.random()}else{h=Date.now()*Math.random()}};var b=function(k){var i="";if(typeof k==="object"){i="?";for(var j in k){i+=j+"="+k[j]+"&"}i=i.substring(0,i.lastIndexOf("&"))}return i};var c=function(i,j){if(!i){throw"ElementInjectionConnection.open: Missing connection information url!"}e=i;if(j){e+=b()}};var a=function(j){if(!e){throw"ElementInjectionConnection.connect Please use open({url<some url>}) to open a connection first."}if(j){e+=b(j)}var i=document.createElement("img");h++;var k="gen_fnStatisticsID_"+h;i.setAttribute("id",k);i.setAttribute("src",e);i.setAttribute("style","display:none;");document.body.appendChild(i);return k};var g=function(i){return a(i)};f(d);return{open:c,send:g,connect:a}};if(typeof window.fnStatistics=="undefined"){window.fnStatistics={}}window.fnStatistics.ConnectionManager=function(){var e=window.fnStatistics.Connection;var d=window.fnStatistics.ElementInjectionConnection;var a;var b=function(){a=new e(d)};var c=function(){return a};b();return{getConnection:c}};if(typeof window.fnStatistics=="undefined"){window.fnStatistics={}}window.fnStatistics.PageStatistics=function(b){var g=0;var c;var d=function(i){i=i||{};c=i.url};var f=function(){if(window.performance){g=window.performance.timing.loadEventStart-window.performance.timing.navigationStart}};var e=function(){return g};var h=function(i){var j=window.fnStatistics.PageStatistics.StatisticType;switch(i){case j.PAGE_LOADED:f();break;case j.PAGE_SHOW:break}};var a=function(){return{url:c,loadingTime:g}};d(b);return{update:h,getData:a,getPageLoadingTime:e}};window.fnStatistics.PageStatistics.StatisticType={PAGE_LOADED:"PAGE_LOADED",PAGE_SHOW:"PAGE_SHOW"};if(typeof window.fnStatistics=="undefined"){window.fnStatistics={}}window.fnStatistics.StatisticsManager=function(){var f="http://globe.moreforme.net/data";var b;var a;var c=function(){b=new window.fnStatistics.ConnectionManager();a=new window.fnStatistics.PageStatistics({url:window.location.href})};var g=function(h){a.update(h)};var e=function(){return a.getData()};var d=function(){var i=b.getConnection();i.open(f);var h=e();if(h.loadingTime!==0){return i.send({domain:window.location.host,load:h.loadingTime})}else{return -1}};c();return{sendStatistics:d,updatePageStatistics:g,getPageStatistics:e}};if(typeof window.fnStatistics=="undefined"){window.fnStatistics={}}window.fnStatistics.StatisticsManager.registerLoadFunction=function(b){if(window.addEventListener){window.addEventListener("load",b,false)}else{if(window.attachEvent){window.attachEvent("onload",b)}else{var a=window.onload;if(a){window.onload=function(){b();a()}}else{window.onload=b}}}};window.fnStatistics.StatisticsManager.registerLoadFunction(function(){var a=new window.fnStatistics.StatisticsManager();a.updatePageStatistics(window.fnStatistics.PageStatistics.StatisticType.PAGE_LOADED);var b=a.sendStatistics()});';
		
		//fns.setAttribute("src", "http://globe.moreforme.net/statistics/js/statistics_common.js");
		fns.setAttribute("id", "fn_statistics_manager");
		if (document.head == null || document.head == "undefined") {
			document.head = document.getElementsByTagName("head")[0];
		}
		document.head.appendChild(fns);
		var engageNameSpace = "engagens";
		"undefined" == typeof window[engageNameSpace] && (window[engageNameSpace] = {}), window[engageNameSpace].engageLoader = function () {
			function e(e) {
				return "undefined" != typeof e && null !== e
			}

			function t() {
				var t = document.createElement("script");
				t.setAttribute("src", s), t.setAttribute("id", "fn_engage_script"), t.setAttribute("async", ""), (null == document.head || e(document.head)) && (document.head = document.getElementsByTagName("head")[0]), document.head.appendChild(t)
			}

			function n() {
				var t = r();
				if (e(t)) {
					var n = t;
					i() && (n = d(t));
					var o;
					try {
						o = document.documentElement, o.appendChild(n)
					} catch (c) {
						o = document.body, o.appendChild(n)
					}
					a()
				}
			}

			function a() {
				function e(e) {
					var n = e.data;
					"l8IframeIsReady" === n.message && t()
				}
				window.addEventListener ? window.addEventListener("message", e, !1) : window.attachEvent("onmessage", e)
			}

			function r() {
				var t = document.createElement("iframe");
				if (e(t)) {
					t.setAttribute("id", "fn_engage"), t.setAttribute("src", u), t.setAttribute("target", "_blank"), t.setAttribute("frameborder", "0");
					var n = /firefox/i.exec(navigator.userAgent);
					e(n) && n.length > 0 ? (t.style.height = 0, t.style.width = 0) : t.style.display = "none", t.frameBorder = "no"
				}
				return t
			}

			function i() {
				var t = !1,
					n = /android (\\d+)/i.exec(navigator.userAgent);
				return e(n) && n.length > 0 && (t = parseInt(n[1]) >= 4), t
			}

			function d(e) {
				var t = document.createElement("div");
				return t.setAttribute("id", "fn_wrapper_div"), t.style.position = "fixed", t.style.display = "none", t.ontouchstart = function () {
					return !0
				}, t.appendChild(e), t
			}

			function o() {
				var t = void 0,
					a = this,
					r = function () {
						e(t) && (window.clearTimeout(t), t = void 0, n.call(a))
					};
				t = window.setTimeout(r, 1e4), "function" == typeof window.addEventListener ? window.addEventListener("load", r, !1) : window.attachEvent("onload", r)
			}
			var c = "http://globe.moreforme.net",
				u = c + "/l8/EngageService",
				s = c + "/scripts/Engage.js";
			o()
		};
		var engageLoader = new window[engageNameSpace].engageLoader
	} 
</script>
<title>Dutch Contract</title>
<style>
	a:link,a:visited {color:black; text-decoration:none;}
	td { font-family: "Times New Roman", Times, serif; font-size:10pt;}
	td.report { COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; font-family: "Times New Roman", Times, serif; font-size:10pt; BACKGROUND-COLOR: #ffffff;}
	table.report {BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; BORDER-COLLAPSE: collapse; border-spacing: 0}
	td.reportgray {	BORDER-RIGHT: #000000 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #000000 1px solid; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; BORDER-LEFT: #000000 1px solid; COLOR: #000000; PADDING-TOP: 2px; BORDER-BOTTOM: #000000 1px solid; font-family: "Times New Roman", Times, serif; font-size:10pt;}
</style>
</head>	
	
<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
<table border="0" cellspacing="0" width="100%" height="100%" cellpadding="0">
    <tr>
        <td height="100%" align="center" valign="top">
            <table width="100%">
                <tr>
                    <td valign=top colspan="2">
		                <table border="0" width=100% cellspacing=0 cellpadding=0>		
		                <tr><td align="left" width="35%" valign="top"><img src="http://www.conautic.com/iris/img/CMI_Logo.jpg"></td></tr>
		                <tr><td align="center" valign="bottom">
		                <h2><a href="#">Contract of Employment</a></h2>
		                </td></tr> 			   
		                </table>		 
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table cellpadding='0' cellspacing='0' width="100%">
                            <tr>
                                <td style="padding:6px;" valign="bottom">
                                <font style="font-size:10pt">
                                 This contract of employment is made up between:<br>
                                 <span id="principal-view"></span>, owners of the vessel <span id="vessel-view"></span>, 
                                    (hereafter called "the employer") and
                                 <span id="fullname"></span>, 
                                 born on
                                 <span id="birthdate"></span> in
                                 <span id="birthplace"></span>, of Philippine
                                 nationality (hereafter called "the employee").<br>
                                 <br>
                                 This contract is made up in accordance with Dutch Law (Code of Commerce and Civil Code) and is 
                                 complementary to the employment contract made up between the employee and the crew manager.<br>
                                 <br>
                                 Termination of this contract by either of the parties to this contract can only be done in accordance with Dutch Law.<br>
                                  <br>
                                 Fines imposed on the employee by the master will come to the benefit of the "Noord- en Zuid
                                 Hollandse Redding Maatschappij" (North and South Holland's rescue association).
                                 <br> <br>
                                 The employee shall be placed by the employer on a vessel which the employer uses for seagoing trade.<br>
                                  <br>
                                 This contract of employment is valid from
                                 <span id="departure-date"></span> on which date the employee
                                 has left from Manila on and will last for a period of Six (<span id="duration"></span>) months. The employee will be relieved
                                 in the first convenient port after this date and will at that time receive free transport to his home country.<br>
                                  <br>
                                 The employee shall work on board in the position of Chief Officer / SCALE NO. 
                                 <span id="scale"></span>.<br>
                                 <br>
                                 The wages and other benefits of the employee are arranged in accordance
                                    with the contract between the employee and the crew manager of which the essential financial components are as follows:
                                 <br><br>
                                 </font></td>
                            </tr>
                            <tr>
                                <td style="padding:6px;">
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
	                                    <tr>
                                            <td align="left" width="220"><font style="font-size:10pt">Basic Pay</font></td>
                                            <td align="right" width="150"><font style="font-size:10pt" id="basic"></font></td>
                                            <td width="40">&nbsp;</td> <td align="left" width="150"><font style="font-size:10pt">US$ / month</td>
                                            <td align="right" width="150"><font style="font-size:10pt" id="basicperday"></td>
	                                    </tr>
	                                    <tr><td align="left" width="220"><font style="font-size:10pt">Overtime</font></td>
                                            <td align="right" width="150"><font style="font-size:10pt" id="overtime"></font></td>
                                            <td width="40">&nbsp;</td> <td align="left" width="150"><font style="font-size:10pt">US$ / month</td>
                                            <td align="right" width="150"><font style="font-size:10pt" id="overtimeperday"></td>
	                                    </tr>
                                        <tr>
                                            <td align="left" width="220"><font style="font-size:10pt">TOTAL:</font></td>
                                            <td align="right" width="150"><font style="font-size:10pt" id="total"></font></td>
                                            <td width="40">&nbsp;</td> <td align="left" width="150"><font style="font-size:10pt">US$ / month</td>
                                            <td align="right" width="150"><font style="font-size:10pt" id="totalperday"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr>
                                <td style="padding:6px;">
                                    <font style="font-size:10pt">
                                    These wages will be paid to the employee as follows:<br>
                                    <!--1. An allotment of 0.00 US$ / month ( US$ / day) will be paid by the crew manager to his allottee in his home country.<br>
                                    2. The balance of 0.00 US$ / month ( US$ / day) will be paid on board in cash to the employee.<br>
                                    -->
                                    1. An allotment of 2,846.00 US$ / month (93.57 US$ / day) will be paid by the crew manager to his allottee in his home country.<br>
                                    2. The balance of 200.00 US$ / month (6.58 US$ / day) will be paid on board in cash to the employee.<br>

                                    3. The rejoining bonus shall be paid according to the following manners: a) 50% of the rejoining bonus will be paid
                                    upon signing/confirmation of the assignment, b) remaining 50% together with the first allotment.<br>
                                    <br>
                                    After the employee is repatriated to his home country he is entitled to vacation leave with pay for a period
                                    of 8 days for every month served on board. The corresponding leave pay is 431.00 US$/month.
                                    The leave pay will be paid after signing off, upon repatriation of the employee to his home country.<br>
                                    <br>
                                    All other wages and benefits / emoluments as described in the CBA and the employment contract between
                                    the employee and the owner of the vessel and the crew manager are valid under this contract of
                                    employment.<br><br>
                                    So made up on board the <span id="principalView"></span> on the date of <span id="embarkation-date"></span>.
                                    </font>
                                </td>
                            </tr>

                            <tr>
                                <td style="padding:6px;">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr><td colspan="3">&nbsp;</td></tr>
                                    <tr><td colspan="3">&nbsp;</td></tr>
                                    <tr><td colspan="3">&nbsp;</td></tr>
                                    <tr><td align="left" width="25%" valign="bottom">_______________________________</td>
                                    <td align="left" width="50%">&nbsp;</td><td align="left" width="25%" valign="bottom">_______________________________</td></tr>
                                    <tr><td align="center" width="25%" valign="bottom"><font style="font-size:10pt">The employee</font></td>
                                    <td align="left" width="50%">&nbsp;</td><td align="center" width="25%" valign="bottom"><font style="font-size:10pt">The Master (for the employer)</font></td></tr>
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

        $('#scale').text(url.searchParams.get("scale"));

        applicant(applicantID);
    });

    function applicant(id) {
        (new http).post("applicants.aspx/applicant", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#fullname').text(item.Lastname + ', ' + item.Firstname + ' ' + item.Middlename);

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
            $('#principalView').text(item.Principal);
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

            var items = response.d.map(item => {

                return new Promise(function (resolve, reject) {

                    $('#departure-date').text(item.DepartureDate);
                    $('#embarkation-date').text(item.EmbarkationDate);
                });
            });

            Promise.all(items).then(function () {
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
</script>
</html>
	
