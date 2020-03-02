<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Seabase.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper div-dashboard">
        <section class="content">
           <div class="row">
               <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Dashboard</h3>
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
                            <div class="col-md-12 box-child">
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <span class="info-box-icon bg-blue"><i class="fa fa-users"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-number" id="applicants"></span>
                                            <span>
                                                <small>Applicants</small>
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <span class="info-box-icon bg-green"><i class="fa fa-anchor"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-number" id="crews"></span>
                                            <span>
                                                <small>Crews</small>
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->

                                <!-- fix for small devices only -->
                                <div class="clearfix visible-sm-block"></div>

                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <span class="info-box-icon bg-yellow"><i class="fa fa-university"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-number" id="principals"></span>
                                            <span>
                                                <small>Principals</small>
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <span class="info-box-icon bg-red"><i class="fa fa-ship"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-number" id="_vessels"></span>
                                            <span>
                                                <small>Vessels</small>
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                            </div>

                            <div class="col-md-12 box-child">
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <span class="info-box-icon bg-navy"><i class="fa fa-anchor"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-number" id="onboard"></span>
                                            <span>
                                                <small>Crew On-board</small>
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <span class="info-box-icon bg-aqua"><i class="fa fa-anchor"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-number" id="onvacation"></span>
                                            <span>
                                                <small>On Vacation</small>
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->

                                <!-- fix for small devices only -->
                                <div class="clearfix visible-sm-block"></div>

                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <span class="info-box-icon bg-red-gradient"><i class="fa fa-anchor"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-number" id="ontraining"></span>
                                            <span>
                                                <small>On Training</small>
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <span class="info-box-icon bg-maroon"><i class="fa fa-anchor"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-number">0</span>
                                            <span>
                                                <small>Training Requests</small>
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                            </div>

                            <div class="col-md-12 box-child">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title animated slideInRight">Last Updated Profile</h3><br /><br />
                                        <a href="/histories">View All</a>

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
                                            <div class="table-responsive">
                                                <table id="app-history-table">
                                                    <thead>
                                                        <tr>
                                                            <td>Date</td>
                                                            <td>Crew</td>
                                                            <td>Description</td>
                                                            <td>Updated By</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="app-history-tbody">

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 box-child">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title animated slideInRight">Upcoming Embarkations</h3>

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
                                            <div class="table-responsive">
                                                <table id="embarkation-table">
                                                    <thead>
                                                        <tr>
                                                            <td>Principal</td>
                                                            <td>Vessel</td>
                                                            <td>Rank</td>
                                                            <td>Crew</td>
                                                            <td>EmbarkationDate</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="embarkation-tbody">

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 box-child">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title animated slideInRight">Upcoming Disembarkations</h3>

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
                                            <div class="table-responsive">
                                                <table id="disembarkation-table">
                                                    <thead>
                                                        <tr>
                                                            <td>Principal</td>
                                                            <td>Vessel</td>
                                                            <td>Rank</td>
                                                            <td>Crew</td>
                                                            <td>DisembarkationDate</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="disembarkation-tbody">

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 box-child">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title animated slideInRight">Expiring Documents</h3>

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
                                            <div class="table-responsive">
                                                <table id="expiring-table">
                                                    <thead>
                                                        <tr>
                                                            <td>Document</td>
                                                            <td>Crew</td>
                                                            <td>Issue Date</td>
                                                            <td>Expiry Date</td>
                                                            <td>Expiring Days</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="expiring-tbody">

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 box-child">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title animated slideInRight">Expiring Training</h3>

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
                                            <div class="table-responsive">
                                                <table id="training-table">
                                                    <thead>
                                                        <tr>
                                                            <td>Document</td>
                                                            <td>Crew</td>
                                                            <td>Issue Date</td>
                                                            <td>Expiry Date</td>
                                                            <td>Expiring Days</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="training-tbody">

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="box-footer">
                                
                            </div>
                        </div>
                    </div>
                </div>
           </div>
      </section>
</div>
<script src="scripts/jquery-3.2.1.min.js"></script>
<script src="scripts/helpers.js"></script>
<script src="scripts/sweetalert2.min.js"></script>
<script src="scripts/validator.js"></script>
<script src="scripts/WebForms/dashboard.js"></script>
<script>
    $(document).ready(function () {
        counters();
        histories();
        embarkations();
        crewForEmbarkations();
        crewForDisembarkations();
        expiringDocuments();
        trainingDocuments();
    });

    function embarkations() {

        var today = getManilaTime().split(',')[0];
        var d = today.split('/');

        var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
        var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

        var formattedDate = d[2] + '-' + d0 + '-' + d1;

        (new http).post("embarkations.aspx/forEmbarkations", {
            date: formattedDate
        }).then(function (response) {

            var items = response.d.map(item => {

                forOnboard(item.CrewID);
            });
        }).run();
    }

    function forOnboard(crewID) {

        (new http).post("embarkations.aspx/forOnboard", {
            id: crewID
        }).then(function (response) {
            console.log('on board..');
        }).run();
    }

    function crewForEmbarkations() {

        $('#embarkation-tbody').text('');

        $('#embarkation-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

        var today = getManilaTime().split(',')[0];
        var d = today.split('/');

        var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
        var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

        var formattedDate = d[2] + '-' + d0 + '-' + d1;

        (new http).post("embarkations.aspx/crewForEmbarkations", {
            date: formattedDate
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {
                   var html = "<tr>" +
                               "<td>" + item.Principal + "</td>" +
                               "<td>" + item.Vessel + "</td>" +
                               "<td>" + item.Rank + "</td>" +
                               "<td>" + item.Crew + "</td>" +
                               "<td>" + item.EmbarkationDate + "</td></tr>";

                   $('#embarkation-tbody').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
                $('#embarkation-table').DataTable();
            });

        }).run();
    }

    function crewForDisembarkations() {

        $('#disembarkation-tbody').text('');

        $('#disembarkation-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

        var today = getManilaTime().split(',')[0];
        var d = today.split('/');

        var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
        var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

        var formattedDate = d[2] + '-' + d0 + '-' + d1;

        (new http).post("embarkations.aspx/crewForDisembarkations", {
            date: formattedDate
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {
                    var html = "<tr>" +
                                "<td>" + item.Principal + "</td>" +
                                "<td>" + item.Vessel + "</td>" +
                                "<td>" + item.Rank + "</td>" +
                                "<td>" + item.Crew + "</td>" +
                                "<td>" + item.DisembarkationDate + "</td></tr>";

                    $('#disembarkation-tbody').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
                $('#disembarkation-table').DataTable();
            });

        }).run();
    }


    function expiringDocuments() {

        $('#expiring-tbody').text('');

        $('#expiring-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

        var today = getManilaTime().split(',')[0];
        var d = today.split('/');

        var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
        var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

        var formattedDate = d[2] + '-' + d0 + '-' + d1;

        (new http).post("dashboard.aspx/expiring", {
            date: formattedDate
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {
                    var html = "<tr>" +
                                "<td>" + item.Document + "</td>" +
                                "<td>" + item.Crew + "</td>" +
                                "<td>" + item.IssueDate + "</td>" +
                                "<td>" + item.ExpiryDate + "</td>" +
                                "<td>" + item.Remaining + "</td></tr>";

                    $('#expiring-tbody').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
                $('#expiring-table').DataTable();
            });

        }).run();
    }

    function trainingDocuments() {

        $('#training-tbody').text('');

        $('#training-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

        var today = getManilaTime().split(',')[0];
        var d = today.split('/');

        var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
        var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

        var formattedDate = d[2] + '-' + d0 + '-' + d1;

        (new http).post("dashboard.aspx/training", {
            date: formattedDate
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {
                    var html = "<tr>" +
                                "<td>" + item.Document + "</td>" +
                                "<td>" + item.Crew + "</td>" +
                                "<td>" + item.IssueDate + "</td>" +
                                "<td>" + item.ExpiryDate + "</td>" +
                                "<td>" + item.Remaining + "</td></tr>";

                    $('#training-tbody').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
                $('#training-table').DataTable();
            });

        }).run();
    }

    function getManilaTime() {
        var options = {
            timeZone: 'Asia/Manila',
            year: 'numeric', month: 'numeric', day: 'numeric',
            hour: 'numeric', minute: 'numeric', second: 'numeric',
        },

        formatter = new Intl.DateTimeFormat([], options)
        return formatter.format(new Date())
    }

    function counters() {

        (new http).post("applicants.aspx/get", {
            statusID: 1
        }).then(function (response) {
            $('#applicants').text(response.d.length);
        }).run();

        (new http).post("applicants.aspx/get", {
            statusID: 2
        }).then(function (response) {
            $('#onboard').text(response.d.length);
        }).run();

        (new http).post("applicants.aspx/get", {
            statusID: 7
        }).then(function (response) {
            $('#onvacation').text(response.d.length);
        }).run();

        (new http).post("applicants.aspx/get", {
            statusID: 4
        }).then(function (response) {
            $('#ontraining').text(response.d.length);
        }).run();

        (new http).post("crews.aspx/get", {
        }).then(function (response) {
            $('#crews').text(response.d.length);
        }).run();

        (new http).post("principals.aspx/get", {
        }).then(function (response) {
            $('#principals').text(response.d.length);
        }).run();

        (new http).post("_vessels.aspx/get", {
        }).then(function (response) {
            $('#_vessels').text(response.d.length);
        }).run();
    }

function histories() {
    $('#app-history-tbody').text('');

    $('#app-history-tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("applicant.aspx/allhistories", {
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {

                var html = "<tr>" +
                           "<td>" + item.DateCreated + "</td>" +
                           "<td>" + item.Crew + "</td>" +
                           "<td>" + item.Event + "</td>" +
                           "<td>" + item.User + "</td></tr>";

                $('#app-history-tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#app-history-table').DataTable();
        });
    }).run();
}
</script>
</asp:Content>
