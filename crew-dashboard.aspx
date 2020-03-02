<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="crew-dashboard.aspx.cs" Inherits="Seabase.crew_dashboard" %>
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
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <span class="info-box-icon bg-blue"><i class="fa fa-ship"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-number" id="on-board-duration"></span>
                                            <span>
                                                <small>No. of Days on Board</small>
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>

                                <!-- fix for small devices only -->
                                <div class="clearfix visible-sm-block"></div>

                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <span class="info-box-icon bg-yellow"><i class="fa fa-file-text-o"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-number" id="expiring-docx"></span>
                                            <span>
                                                <small>Expiring Documents</small>
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <span class="info-box-icon bg-red"><i class="fa fa-anchor"></i></span>

                                        <div class="info-box-content">
                                            <span class="info-box-number" id="expiring-training"></span>
                                            <span>
                                                <small>Expiring Training</small>
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                            </div>

                            <div class="col-md-12 box-child">
                                <div class="box" style="margin-top: 1% !important;">
                                    <div class="box-header with-border">
                                        <h3 class="box-title animated slideInRight">Announcements</h3>
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
                                        <div class="box-child" style="width: 100%;">
                                            <div class="box-child-header">
                                                <h4>Announcement for Today</h4>
                                            </div>
                                            <div class="row box-child-body fortoday">
                                                <div class="col-md-8" id="fortoday">
                                                    <h4><b id="subject"></b></h4>
                                                    <p id="created"></p>
                                                    <br />
                                                    <br />
                                                    <div id="content">

                                                    </div>
                                                    <br />
                                                    <div class="form-group">
                                                        <label>Attachment:</label><br />
                                                        <a href="#" target="_blank" id="attachView"></a>
                                                    </div>
                                                </div>
                                                <div class="col-md-4" style="border-left: 1px solid #bebcbc">
                                                    <h4><b>Other Announcements</b></h4>
                                                    <ul id="announcements">
                                            
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="box-child-footer">
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                
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
    var applicantID = 0;

    $(document).ready(function () {
        duration();

        var url = new URL(window.location.href);
        applicantID = url.searchParams.get("_hsdlwhx");

        setTimeout(function () {
            expiringDocuments();
            trainingDocuments();
        }, 2000);
    });

    function duration() {
        (new http).post("crew-dashboard.aspx/duration", {
        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    $('#on-board-duration').text(item.Duration);

                });
            });

            Promise.all(items).then(function () {

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

            var html = "";

            var i = 0;

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    if (item.CrewID == applicantID) {

                        i++;

                        html += "<tr>" +
                                "<td>" + item.Document + "</td>" +
                                "<td>" + item.Crew + "</td>" +
                                "<td>" + item.IssueDate + "</td>" +
                                "<td>" + item.ExpiryDate + "</td>" +
                                "<td>" + item.Remaining + "</td></tr>";
                    }

                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();

                $('#expiring-docx').text(i);

                $('#expiring-tbody').append(html);
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

            var i = 0;

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {
                    var html = "<tr>" +
                                "<td>" + item.Document + "</td>" +
                                "<td>" + item.Crew + "</td>" +
                                "<td>" + item.IssueDate + "</td>" +
                                "<td>" + item.ExpiryDate + "</td>" +
                                "<td>" + item.Remaining + "</td></tr>";

                    if (item.CrewID == applicantID) {

                        i++;

                        $('#training-tbody').append(html);
                    }

                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();

                $('#expiring-training').text(i);

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
</script>
</asp:Content>
