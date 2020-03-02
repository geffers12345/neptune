<%@ Page Title="My Timesheets" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="timesheets.aspx.cs" Inherits="Seabase.timesheets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper div-maintenance">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                      <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title animated slideInRight">My Timesheets</h3>

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
                                        <div class="col-md-8">
                                            <button data-toggle="modal" data-target="#addModal" class="btn btn-primary btn-add">
                                              Add New Timesheet
                                                <span class="tooltiptext">Click to add new item</span>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <div class="table-responsive">
                                        <table id="table">
                                            <thead>
                                                <tr>
                                                    <td>ID</td>
                                                    <td>Principal</td>
                                                    <td>Vessel</td>
                                                    <td>Start Date</td>
                                                    <td>End Date</td>
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

    <div class="modal fade" id="addModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New Timesheet</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Principal:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="principal" class="form-control" data-name="Principal">
                                        <option value="">--SELECT PRINCIPAL--</option>
                                    </select>
                                </div>
                                <label id="error-principal" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Vessel:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="vessel" class="form-control" data-name="Vessel">

                                    </select>
                                </div>
                                <label id="error-vessel" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Start Date:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="start"  type="date" class="form-control" data-name="Start Date"/>
                                </div>
                                <label id="error-start" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">End Date:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="end"  type="date" class="form-control" data-name="End Date"/>
                                </div>
                                <label id="error-end" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Notes:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <textarea id="notes" placeholder="Address" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button id="save" class="btn btn-primary">Save Timesheet
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="viewModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Timesheet Info</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Principal:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="principal-view" class="form-control" data-name="Principal">
                                        <option value="">--SELECT PRINCIPAL--</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Vessel:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="vessel-view" class="form-control" data-name="Vessel">

                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Start Date:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="start-view"  type="date" class="form-control" data-name="Start Date"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">End Date:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="end-view"  type="date" class="form-control" data-name="End Date"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Notes:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <textarea id="notes-view" placeholder="Address" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-primary">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Modify Timesheet</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Principal:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="principal-edit" class="form-control" data-name="Principal">
                                        <option value="">--SELECT PRINCIPAL--</option>
                                    </select>
                                </div>
                                <label id="error-principal-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Vessel:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="vessel-edit" class="form-control" data-name="Vessel">

                                    </select>
                                </div>
                                <label id="error-vessel-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Start Date:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="start-edit"  type="date" class="form-control" data-name="Start Date"/>
                                </div>
                                <label id="error-start-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">End Date:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="end-edit"  type="date" class="form-control" data-name="End Date"/>
                                </div>
                                <label id="error-end-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Notes:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <textarea id="notes-edit" placeholder="Address" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button id="saveChanges" class="btn btn-primary">Save Changes
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/timesheet.js"></script>
</asp:Content>
