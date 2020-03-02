<%@ Page Title="Salary Scales" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="scales.aspx.cs" Inherits="Seabase.scales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-maintenance">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                      <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title animated slideInRight">Salary Scale</h3>

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
                                            <h3 id="principal-name">Some Principal</h3>
                                        </div>
                                        <div class="col-md-4">
                                            <label>Salary Scale</label>
                                            <select class="form-control" id="scales">
                                            </select>
                                        </div>
                                        <div class="col-md-4">
                                            <label style="color: #fff">Action</label>
                                            <div class="box-tools">
                                                <button type="button" class="btn btn-box-tool"
                                                    data-toggle="modal" data-target="#add-salary-scale" style="font-size: 2rem;">
                                                    <i class="fa fa-plus">
                                                        <span class="tooltiptext" style="font-size: 11px">Click to add new item</span>
                                                    </i>
                                                </button>
                                                <button type="button" class="btn btn-box-tool edit-salary-scale"
                                                    data-toggle="modal" data-target="#edit-salary-scale" style="font-size: 2rem;">
                                                    <i class="fa fa-edit">
                                                        <span class="tooltiptext" style="font-size: 11px">Click to add modify item</span>
                                                    </i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-8">
                                            <button data-toggle="modal" data-target="#addModal" class="btn btn-primary btn-add">
                                              Add New Salary
                                                <span class="tooltiptext">Click to add new item</span>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
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
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New Salary</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Rank:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="position" class="form-control" data-name="Position">
                                        <option value="">--SELECT RANK--</option>
                                    </select>
                                </div>
                                <label id="error-position" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Income Description:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="income" placeholder="Income Description" type="text" class="form-control" data-name="Income"/>
                                </div>
                                <label id="error-income" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Remarks:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="remarks" placeholder="remarks" type="text" class="form-control" data-name="Remarks"/>
                                </div>
                                <label id="error-remarks" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Monthly (USD):</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="monthly" type="number" min="0" class="form-control" data-name="Monthly"/>
                                </div>
                                <label id="error-monthly" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Daily (USD):</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="daily" type="number" min="0" class="form-control" data-name="Daily"/>
                                </div>
                                <label id="error-daily" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Percentage:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="percentage" type="number" min="0" class="form-control" value="0"/>
                                </div>
                                <label id="error-percentage" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="text-primary">Days:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="days" type="number" min="0" class="form-control" value="0"/>
                                </div>
                                <label id="error-days" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">Add to Total:</label><br />
                                <div class="input-group">
                                    <input id="total" type="checkbox"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Payout:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="payout" class="form-control">
                                        <option value="1">Rejoining</option>
                                        <option value="2">End of Contract</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <button id="save" class="btn btn-primary">Save Salary Scale
                            <i class="fa fa-spinner fa-spin hidden"></i>
                        </button>
                        <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editModal" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Modify Salary Scale</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Rank:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="position-edit" class="form-control" data-name="Position">
                                        <option value="">--SELECT RANK--</option>
                                    </select>
                                </div>
                                <label id="error-position-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Income Description:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="income-edit" placeholder="Income Description" type="text" class="form-control" data-name="Income"/>
                                </div>
                                <label id="error-income-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Remarks:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="remarks-edit" placeholder="remarks" type="text" class="form-control" data-name="Remarks"/>
                                </div>
                                <label id="error-remarks-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Monthly (USD):</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="monthly-edit" type="number" min="0" class="form-control" data-name="Monthly"/>
                                </div>
                                <label id="error-monthly-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Daily (USD):</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="daily-edit" type="number" min="0" class="form-control" data-name="Daily"/>
                                </div>
                                <label id="error-daily-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Percentage:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="percentage-edit" type="number" min="0" class="form-control" value="0"/>
                                </div>
                                <label id="error-percentage-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="text-primary">Days:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="days-edit" type="number" min="0" class="form-control" value="0"/>
                                </div>
                                <label id="error-days-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">Add to Total:</label><br />
                                <div class="input-group">
                                    <input id="total-edit" type="checkbox"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Payout:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="payout-edit" class="form-control">
                                        <option value="1">Rejoining</option>
                                        <option value="2">End of Contract</option>
                                    </select>
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

    <div class="modal fade" id="add-salary-scale" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New Salary Scale</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Salary Scale:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="salary-scale" placeholder="Salary Scale" type="text" class="form-control" data-name="Salary"/>
                                </div>
                                <label id="error-salary" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button id="save-salary-scale" class="btn btn-primary">Save Salary Scale
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="edit-salary-scale" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Modidy Salary Scale</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Salary Scale:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="salary-scale-edit" placeholder="Salary Scale" type="text" class="form-control" data-name="Salary"/>
                                </div>
                                <label id="error-salary-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button id="save-changes-salary-scale" class="btn btn-primary">Save Changes
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
<script src="scripts/WebForms/scale.js"></script>
<script>
    var principalID = 0;

    $(document).ready(function () {
        var url = new URL(window.location.href);
        principalID = url.searchParams.get("_mksnwrgd");

        scales(principalID);
        ranks(principalID);
    });
</script>
</asp:Content>
