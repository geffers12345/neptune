<%@ Page Title="Licenses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="licenses.aspx.cs" Inherits="Seabase.licenses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper div-documents">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                      <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title animated slideInRight">Licenses</h3>

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
                                              Add New License
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
                                                    <td>License</td>
                                                    <td>Code</td>
                                                    <td>Days to Notify</td>
                                                    <td>Date Created</td>
                                                    <td>Date Modified</td>
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
                        Add New License</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">License Name:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="name" placeholder="Name" type="text" class="form-control" data-name="Name"/>
                                </div>
                                <label id="error-name" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Code:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="text" id="code" placeholder="Code" class="form-control" data-name="Code"/>
                                </div>
                                <label id="error-code" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Days to Notify:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="days" class="form-control" data-name="Days"/>
                                </div>
                                <label id="error-days" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button id="save" class="btn btn-primary">Save License
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
                        License Info</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">License Name:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="name-view" placeholder="Name" type="text" class="form-control"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Code:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="text" id="code-view" placeholder="Code" class="form-control" />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Days to Notify:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="days-view" class="form-control"/>
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
                        Modify License</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">License Name:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="name-edit" placeholder="Name" type="text" class="form-control" data-name="Name"/>
                                </div>
                                <label id="error-name-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Code:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="text" id="code-edit" placeholder="Code" class="form-control" data-name="Code"/>
                                </div>
                                <label id="error-code-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Days to Notify:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="days-edit" class="form-control" data-name="Days"/>
                                </div>
                                <label id="error-days-edit" style="display: none" class="text-danger"></label>
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
<script src="scripts/WebForms/license.js"></script>
</asp:Content>
