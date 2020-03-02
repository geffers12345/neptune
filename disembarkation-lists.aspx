<%@ Page Title="Disembarkations" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="disembarkation-lists.aspx.cs" Inherits="Seabase.disembarkation_lists" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-board">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Disembarkation Lists</h3>

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
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <button class="btn btn-primary" data-toggle="modal" data-target="#add-disembark-modal">Add New Disembarkation</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="table-responsive">
                                    <table id="disembark-table" style="width: 100%;">
                                        <thead>
                                            <tr>
                                                <td>ID</td>
                                                <td>Principal</td>
                                                <td>Vessel</td>
                                                <td>Arrival Date</td>
                                                <td>Arrival Airport</td>
                                                <td>Disembarkation Port</td>
                                                <td>Disembarkation Date</td>
                                                <td>Crew List</td>
                                            </tr>
                                        </thead>
                                        <tbody id="disembark-tbody">

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
                <div class="col-md-12">
                    <table id="lineups-table">
                        <thead>
                           <tr>
                                <td>ID</td>
                                <td>Crew</td>
                                <td>Position</td>
                                <td>Remarks</td>
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

<div class="modal fade" id="add-disembark-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Disembarkation</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Code:</label><br />
                            <input type="text" id="dis-code" class="form-control" disabled />
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="text-primary">Principal:</label><br />
                            <select id="embark-principal" class="form-control" data-name="Principal">
                                <option value="">--SELECT PRINCIPAL--</option>
                            </select>
                            <label id="error-principal" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Vessel:</label><br />
                            <select id="embark-vessel" class="form-control" data-name="Vessel">

                            </select>
                            <label id="error-vessel" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Tentative Arrival Date:</label><br />
                            <input type="date" id="arrival-date" class="form-control"/>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Arrival Airport:</label><br />
                            <input type="text" id="arrival-airport" placeholder="Departure Airport" class="form-control" />
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Port of Disembarkation:</label><br />
                            <select id="disembarkation-port" class="form-control" data-name="Embarkation Port">

                            </select>
                            <label id="error-disembarkation" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Disembarkation Date:</label><br />
                            <input type="date" id="disembarkation-date" class="form-control" data-name="Disembarkation"/>
                            <label id="error-disembark-date" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Remarks:</label><br />
                            <textarea id="remarks" class="form-control"></textarea>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="save-disembark" class="btn btn-primary">Save Disembarkation
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/maintenance.js"></script>
<script src="scripts/WebForms/embarkationlists.js"></script>
</asp:Content>
