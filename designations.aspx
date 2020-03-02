<%@ Page Title="Designation and Ranks" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="designations.aspx.cs" Inherits="Seabase.designations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper div-admin">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Designation and Ranks</h3>

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
                                            Add New
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
                                                <td>Rank Name</td>
                                                <td>Code</td>
                                                <td>Type</td>
                                                <td>Order</td>
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
                    Add New Designation</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Rank Name:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="text" id="name" class="form-control" data-name="Rank Name"/>
                            </div>
                            <label id="error-name" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Code:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="text" id="code" class="form-control" data-name="Code"/>
                            </div>
                            <label id="error-code" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Type:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="type" class="form-control">
                                    <option value="1">Officer</option>
                                    <option value="2">Rating</option>
                                    <option value="3">Others</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Rank Numeric Level:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="number" id="order" class="form-control" data-name="Level"/>
                            </div>
                            <label id="error-order" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Group:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="group" class="form-control">
                                    <option value="1">Deck</option>
                                    <option value="2">Engine</option>
                                    <option value="3">Special Rank</option>
                                    <option value="4">Office</option>
                                    <option value="5">Others</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Level:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="level" class="form-control">
                                    <option value="1">Operation</option>
                                    <option value="2">Management</option>
                                    <option value="3"> &lt; 500 Tons or &lt; 3000 Kw </option>
                                    <option value="4">Rating</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Description:</label><br />
                            <textarea  id="description" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">STCW:</label><br />
                           <textarea  id="stcw" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Regulation:</label><br />
                            <textarea  id="regulation" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Capacity:</label><br />
                            <textarea  id="capacity" class="form-control"></textarea>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="save" class="btn btn-primary">Save
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
                    Principal Info</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Rank Name:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="text" id="name-view" class="form-control"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Code:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="text" id="code-view" class="form-control"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Type:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="type-view" class="form-control">
                                    <option value="1">Officer</option>
                                    <option value="2">Rating</option>
                                    <option value="3">Others</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Rank Numeric Level:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="number" id="order-view" class="form-control" data-name="Level"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Group:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="group-view" class="form-control">
                                    <option value="1">Deck</option>
                                    <option value="2">Engine</option>
                                    <option value="3">Special Rank</option>
                                    <option value="4">Office</option>
                                    <option value="5">Others</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Level:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="level-view" class="form-control">
                                    <option value="1">Operation</option>
                                    <option value="2">Management</option>
                                    <option value="3"> &lt; 500 Tons or &lt; 3000 Kw </option>
                                    <option value="4">Rating</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Description:</label><br />
                            <textarea  id="description-view" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">STCW:</label><br />
                            <textarea  id="stcw-view" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Regulation:</label><br />
                            <textarea  id="regulation-view" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Capacity:</label><br />
                            <textarea  id="capacity-view" class="form-control"></textarea>
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
                    Modify Pricipal</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Rank Name:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="text" id="name-edit" class="form-control" data-name="Rank Name"/>
                            </div>
                            <label id="error-name-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Code:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="text" id="code-edit" class="form-control" data-name="Code"/>
                            </div>
                            <label id="error-code-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Type:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="type-edit" class="form-control">
                                    <option value="1">Officer</option>
                                    <option value="2">Rating</option>
                                    <option value="3">Others</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Rank Numeric Level:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input type="number" id="order-edit" class="form-control" data-name="Level"/>
                            </div>
                            <label id="error-order-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Group:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="group-edit" class="form-control">
                                    <option value="1">Deck</option>
                                    <option value="2">Engine</option>
                                    <option value="3">Special Rank</option>
                                    <option value="4">Office</option>
                                    <option value="5">Others</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Level:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="level-edit" class="form-control">
                                    <option value="1">Operation</option>
                                    <option value="2">Management</option>
                                    <option value="3"> &lt; 500 Tons or &lt; 3000 Kw </option>
                                    <option value="4">Rating</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Description:</label><br />
                            <textarea id="description-edit" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">STCW:</label><br />
                            <textarea  id="stcw-edit" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Regulation:</label><br />
                            <textarea  id="regulation-edit" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Capacity:</label><br />
                            <textarea  id="capacity-edit" class="form-control"></textarea>
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
<script src="scripts/WebForms/designation.js"></script>
</asp:Content>
