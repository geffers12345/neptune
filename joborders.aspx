<%@ Page Title="Job Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="joborders.aspx.cs" Inherits="Seabase.joborders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-board">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Job Orders</h3>

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
                                            Add New Item
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
                                                <td>Job Order</td>
                                                <td>Principal</td>
                                                <td>Vessel</td>
                                                <td>Vessel Type</td>
                                                <td>Group #</td>
                                                <td>Principal Status</td>
                                                <td>Approved</td>
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
                    Add New Job Order</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Job Number:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="text" id="id-number" class="form-control" data-name="ID" disabled/>
                            </div>
                            <label id="error-id" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
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

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Source:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="source" class="form-control">
                                    <option value="Email">Email</option>
                                    <option value="Call">Call</option>
                                    <option value="Text">Text</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Requested By:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="text" id="requested" class="form-control" data-name="Requested"/>
                            </div>
                            <label id="error-requested" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Received By:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="user" class="form-control"></select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Received Date:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="date" id="recieved-date" class="form-control" data-name="Recieved Date" />
                            </div>
                            <label id="error-recieved" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Vessel:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="vessel" class="form-control">
                                    <option value="">--SELECT VESSEL--</option>
                                </select>
                            </div>
                            <label id="error-vessel" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Group:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="group" class="form-control">
                                    <option value="1">Group 1</option>
                                    <option value="2">Group 2</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Remarks:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="text" id="remarks" class="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12" style="border-top: 1px solid #bcbcbc;">
                        <h3 class="text-success">Line Up</h3>
                        <button class="btn btn-primary" data-toggle="modal" 
                            id="add-item" data-target="#add-item-modal">Add New Line Up</button>
                    </div>

                    <div class="col-md-12">
                        <div class="col-md-8">
                            <label>Total</label>
                        </div>

                        <div class="col-md-4">
                            <label id="total"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <table>
                            <thead>
                                <tr>
                                    <td>Rank</td>
                                    <td>Crew</td>
                                    <td>Action</td>
                                </tr>
                            </thead>
                            <tbody id="tbody-items">

                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="save" class="btn btn-primary">Save Job Order
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="add-item-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                   Add New Line Up</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Rank:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="rank" class="form-control" data-name="Rank">
                                    <option value="">--SELECT RANK--</option>
                                </select>
                            </div>
                            <label id="error-rank" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Available Crew:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="crew" class="form-control" data-name="Crew">
                                    <option value="">--SELECT CREW--</option>
                                </select>
                            </div>
                            <label id="error-crew" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="add-row" class="btn btn-primary">Save Item
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
<script src="scripts/WebForms/joborder.js"></script>
</asp:Content>
