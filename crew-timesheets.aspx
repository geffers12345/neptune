<%@ Page Title="Crew Timesheets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="crew-timesheets.aspx.cs" Inherits="Seabase.crew_timesheets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-maintenance">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title animated slideInRight">Crew Timesheets</h3>

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
                        <select class="form-control" id="scales" style="display: none; opacity: 0;" disabled></select>
                        <div class="box-footer">
                            <div class="table-responsive">
                                <table id="admin-table">
                                    <thead>
                                        <tr>
                                            <td>ID</td>
                                            <td>Principal</td>
                                            <td>Vessel</td>
                                            <td>Rank</td>
                                            <td>Crew</td>
                                            <td>Duration</td>
                                            <%--<td>Basic Daily Salary</td>--%>
                                            <%--<td>Fixed Daily OT</td>--%>
                                            <%--<td>Total</td>--%>
                                            <td>Salary</td>
                                            <%--<td>Grand Total</td>--%>
                                        </tr>
                                    </thead>
                                    <tbody id="admin-tbody">

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

<div class="modal fade" id="others-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Crew Salary</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table id="table-salary">
                        <thead>
                            <tr>
                                <td>Rank/Position</td>
                                <td>Income Description</td>
                                <td>Monthly (USD)</td>
                                <td>Daily (USD)</td>
                                <td>Percentage</td>
                                <td>Days</td>
                                <td>Remarks</td>
                            </tr>
                        </thead>
                        <tbody id="rank-tbody">

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <%--<button id="save-others" class="btn btn-primary">Save Changes
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>--%>
                <button data-dismiss="modal" class="btn btn-danger">Close</button>
            </div>
        </div>
    </div>
</div>

<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/timesheet.js"></script>
<script>
    $(document).ready(function () {
        all_timesheets();
    });
</script>
</asp:Content>
