<%@ Page Title="Document Monitoring" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="document-monitoring.aspx.cs" Inherits="Seabase.document_monitoring" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-board">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Document Monitoring</h3>

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
                                    <table id="table">
                                        <thead>
                                            <tr>
                                                <td>Vessel Name</td>
                                                <td>Principal</td>
                                                <td>Vessel Type</td>
                                                <td>Group #</td>
                                                <td>Status</td>
                                                <td>Date Created</td>
                                                <td>Action</td>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody">

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

<div class="modal fade" id="list-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    All Crew Embarkations</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table id="lineups-table">
                        <thead>
                            <tr>
                                <td>Crew Name</td>
                                <td>Date Embarkation</td>
                                <td>Date Disembarkation</td>
                                <td>Add New Embarkation</td>
                            </tr>
                        </thead>
                        <tbody id="lineups-tbody">

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-danger">Close</button>
            </div>
        </div>
    </div>
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
<script src="scripts/docmonitoring.js"></script>
</asp:Content>
