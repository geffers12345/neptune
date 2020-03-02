<%@ Page Title="Invoices" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="invoices.aspx.cs" Inherits="Seabase.invoices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-vessel">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Invoice Management</h3>

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
                                            Add New Invoice
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
                                                <td>Invoice Number</td>
                                                <td>Principal</td>
                                                <td>Total</td>
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
                    Add New Invoice</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

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
                            <label class="text-primary">Invoice Number:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="text" id="id-number" class="form-control" data-name="ID" disabled/>
                            </div>
                            <label id="error-id" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12" style="border-top: 1px solid #bcbcbc;">
                        <h3 class="text-success">Invoices Items</h3>
                        <button class="btn btn-primary" data-toggle="modal" 
                            id="add-item" data-target="#add-item-modal">Add New Invoice Item</button>
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
                                    <td>Item</td>
                                    <td>Quantity</td>
                                    <td>Unit Price</td>
                                    <td>Total</td>
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
                    <button id="save" class="btn btn-primary">Save Invoice
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
                   Add New Item</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="text-primary">Item Description:</label><br />
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="text" id="item" placeholder="Item Description" class="form-control" data-name="Item"/>
                        </div>
                        <label id="error-item" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-12">
                        <label class="text-primary">Quantity:</label><br />
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="quantity" min="0" class="form-control" data-name="Quantity"/>
                        </div>
                        <label id="error-quantity" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-12">
                        <label class="text-primary">Unit Price:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="price" min="0" class="form-control" data-name="Price"/>
                        </div>
                        <label id="error-price" style="display: none" class="text-danger"></label>
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
<script src="scripts/WebForms/invoice.js"></script>
</asp:Content>
