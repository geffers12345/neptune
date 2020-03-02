<%@ Page Title="Histories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="histories.aspx.cs" Inherits="Seabase.histories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper div-log div-security">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title animated slideInRight">Crew Activity Logs</h3>

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
                                    <div class="col-md-12">
                                        <button class="btn btn-primary" id="generateExcel">
                                            Export Logs (.xls)
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
    </div>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
    <script>
        $(document).ready(function () {

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

        });

        $('#generateExcel').click(function () {
            var d = new Date();
            var date = d.toString().split(" ").slice(0, 4).join(" ");

            $("#app-history-table").table2excel({
                filename: "Crew Changes (" + date + ").xls",
                exclude: ".noExl"
            });
        });
    </script>
</asp:Content>
