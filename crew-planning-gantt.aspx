<%@ Page Title="Crew Planning" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="crew-planning-gantt.aspx.cs" Inherits="Seabase.crew_planning_gantt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-board">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Crew Planning</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-wrench"></i>
                                    </button>
                                </div>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="box-footer">
                                <div class="row">
                                    <div class="col-md-12 gantt-div">
                                        <div id="chart_div"></div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table id="lineups-table">
                                        <thead>
                                            <tr>
                                                <td>Crew Name</td>
                                                <td>Date Embarkation</td>
                                                <td>Date Disembarkation</td>
                                                <td>Action</td>
                                            </tr>
                                        </thead>
                                        <tbody id="lineups-tbody">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</div>

<div class="modal fade" id="documents-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                   Crew Documents</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <div class="col-md-12 section-header">
                        <h3 class="animated slideInRight">Licenses</h3>
                    </div>

                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table id="license-table" style="width: 100%;">
                                <thead>
                                    <tr>
                                        <td>Type</td>
                                        <td>License Number</td>
                                        <td>Issue Date</td>
                                        <td>Expiry Date</td>
                                        <td>File</td>
                                    </tr>
                                </thead>
                                <tbody id="license-tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <%--end licenses--%>


                    <%--flags--%>

                    <div class="col-md-12 section-header">
                        <h3 class="animated slideInRight">Flags</h3>
                    </div>

                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table id="flag-table" style="width: 100%;">
                                <thead>
                                    <tr>
                                        <td>Flag Type</td>
                                        <td>License</td>
                                        <td>Document Number</td>
                                        <td>Rank</td>
                                        <td>Issue Date</td>
                                        <td>Expiry Date</td>
                                        <td>File</td>
                                    </tr>
                                </thead>
                                <tbody id="flag-tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <%--end flags--%>


                    <%--travels--%>

                    <div class="col-md-12 section-header">
                        <h3 class="animated slideInRight">Travel Documents</h3>
                    </div>

                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table id="travel-table" style="width: 100%;">
                                <thead>
                                    <tr>
                                        <td>Document</td>
                                        <td>Document Number</td>
                                        <td>Issue Date</td>
                                        <td>Expiry Date</td>
                                        <td>Place Issued</td>
                                        <td>File</td>
                                    </tr>
                                </thead>
                                <tbody id="travel-tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <%--end travel--%>

                    <%--certifiicates--%>

                    <div class="col-md-12 section-header">
                        <h3 class="animated slideInRight">Trainings & Other Certificates</h3>
                    </div>

                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table id="cert-table" style="width: 100%;">
                                <thead>
                                    <tr>
                                        <td>Course</td>
                                        <td>Certificate Number</td>
                                        <td>Issue Date</td>
                                        <td>Expiry Date</td>
                                        <td>Institution</td>
                                        <td>Place</td>
                                        <td>STWC Code</td>
                                        <td>MLC</td>
                                        <td>File</td>
                                    </tr>
                                </thead>
                                <tbody id="cert-tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <%--end certificates--%>

                    <%--libraries--%>

                    <div class="col-md-12 section-header">
                        <h3 class="animated slideInRight">Document Library</h3>
                    </div>

                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table id="library-table" style="width: 100%;">
                                <thead>
                                    <tr>
                                        <td>Document Name / Type</td>
                                        <td>File</td>
                                    </tr>
                                </thead>
                                <tbody id="library-tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <%--end libraries--%>
                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button data-dismiss="modal" class="btn btn-danger">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/planning.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>

    $(document).ready(function () {
        var url = new URL(window.location.href);
        jID = url.searchParams.get("_jsdofisokjs");
        vesselID = url.searchParams.get("_yjsodiaewadasdc");

        setTimeout(function () {
            lineups(jID, vesselID);
        }, 3000);
    });

    function lineups(joID, vesselID) {
        $('#lineups-tbody').text('');

        $('#lineups-tbody').append("<tr class=\"loading\"><td colspan=\"10\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

        (new http).post("crew-planning.aspx/find", {
            joID: joID,
            vesselID: vesselID
        }).then(function (response) {

            var crews = [];

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    crews.push(['' + item.ID + '', '' + item.Firstname + ' ' + item.Lastname + '', '',
                        new Date(parseInt(item.EmbarkationDate.split('-')[0]), parseInt(item.EmbarkationDate.split('-')[1]),
                            parseInt(item.EmbarkationDate.split('-')[2])), new Date(parseInt(item.DisembarkationDate.split('-')[0]),
                                parseInt(item.DisembarkationDate.split('-')[1]), parseInt(item.DisembarkationDate.split('-')[2])), null, 0, null]);

                    var html = "<tr>" +
                               "<td>" + item.Firstname + ' ' + item.Lastname + "</td>" +
                               "<td>" + item.EmbarkationDate + "</td>" +
                               "<td>" + item.DisembarkationDate + "</td>" +
                               "<td>" +
                                    "<i data-id='" + item.CrewID + "' data-toggle='modal' data-target='#documents-modal' class=\"fa fa-file-text-o view-documents\"> " +
                                        "<span class=\"tooltiptext\">Click to view documents</span>" +
                                    "</i>" +
                                    "<a href='/embarkations?_mbrckns=" + item.CrewID + "' target='_blank'>" +
                                        "<i class=\"fa fa-anchor view-embarkations\">" +
                                        "<span class=\"tooltiptext\">Click to change embarkations</span>" +
                                    "</i></a></td>" +
                               "</tr>";

                    $('#lineups-tbody').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
                $('#lineups-table').DataTable();

                drawChart(crews);
            });
        }).run();
    }

    google.charts.load('current', { 'packages': ['gantt'] });
    //google.charts.setOnLoadCallback(drawChart);

    function drawChart(crews) {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Task ID');
        data.addColumn('string', 'Task Name');
        data.addColumn('string', 'Resource');
        data.addColumn('date', 'Start Date');
        data.addColumn('date', 'End Date');
        data.addColumn('number', 'Duration');
        data.addColumn('number', 'Percent Complete');
        data.addColumn('string', 'Dependencies');

        data.addRows(crews);

        var options = {
            height: 400,
            gantt: {
                trackHeight: 30
            }
        };

        var chart = new google.visualization.Gantt(document.getElementById('chart_div'));
        google.visualization.events.addListener(chart, 'ready', changeColors);
        google.visualization.events.addListener(chart, 'onmouseover', changeColors);
        google.visualization.events.addListener(chart, 'onmouseout', changeColors);
        google.visualization.events.addListener(chart, 'select', changeColors);
        google.visualization.events.addListener(chart, 'error', changeColors);
        google.visualization.events.addListener(chart, 'click', changeColors);
        google.visualization.events.addListener(chart, 'animationfinish', changeColors);

        chart.draw(data, options);
        
    }

    function changeColors() {
        $("text[fill='#5e97f6']").attr('fill', "#0099D8"); // Left Text
        $("rect[fill='#5e97f6']").attr('fill', "#0099D8"); // Full bar
        $("path[fill='#2a56c6']").attr('fill', '#006B99'); // Percentage completed
        $("rect[fill='#2a56c6']").attr('fill', '#0099D8'); // Hover Full Bar
        $("path[fill='#204195']").attr('fill', '#006B99'); // Hover Percentage

        // Change Old red to new Red
        $("text[fill='#db4437']").attr('fill', "#D41647");
        $("rect[fill='#db4437']").attr('fill', "#D41647");
        $("path[fill='#a52714']").attr('fill', '#A21135');
        $("rect[fill='#a52714']").attr('fill', '#D41647');
        $("path[fill='#7c1d0f']").attr('fill', '#A21135');

        // Change Old Yellow to new Yellow
        $("text[fill='#f2a600']").attr('fill', "#FCB813");
        $("rect[fill='#f2a600']").attr('fill', "#FCB813");
        $("path[fill='#ee8100']").attr('fill', '#C98e03');
        $("rect[fill='#ee8100']").attr('fill', '#FCB813');
        $("path[fill='#b36100']").attr('fill', '#C98e03');

    }
</script>
</asp:Content>
