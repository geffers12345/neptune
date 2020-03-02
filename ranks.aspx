<%@ Page Title="Ranks" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ranks.aspx.cs" Inherits="Seabase.ranks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper div-maintenance">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                      <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title animated slideInRight">Ranks</h3>

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
                                              Add New Rank
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
                                                    <td>Name</td>
                                                    <td>Code</td>
                                                    <td>STCW</td>
                                                    <td>Regulation</td>
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
                        Add New Rank</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="text-primary">Rank Name:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="name" placeholder="Name" type="text" class="form-control" data-name="Name"/>
                                </div>
                                <label id="error-name" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">Rank Code:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="code" placeholder="Code" type="text" class="form-control" data-name="Code"/>
                                </div>
                                <label id="error-code" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">STCW:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="stcw" placeholder="STCW" type="text" class="form-control" data-name="STCW"/>
                                </div>
                                <label id="error-stcw" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Regulation:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="regulation" placeholder="Regulation" type="text" class="form-control"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Description:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <textarea id="desc" placeholder="Description" class="form-control" data-name="Description"></textarea>
                                </div>
                                <label id="error-desc" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Department:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="department" class="form-control" data-name="Department">
                                        <option value="">--SELECT DEPARTMENT--</option>
                                    </select>
                                </div>
                                <label id="error-dept" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button id="save" class="btn btn-primary">Save Rank
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
                        Rank Info</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="text-primary">Rank Name:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="name-view" placeholder="Name" type="text" class="form-control"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">Rank Code:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="code-view" placeholder="Code" type="text" class="form-control"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">STCW:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="stcw-view" placeholder="STCW" type="text" class="form-control"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Regulation:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="regulation-view" placeholder="Ragulation" type="text" class="form-control"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Description:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <textarea id="desc-view" placeholder="Description" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Department:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="department-view" class="form-control">
                                        <option value="">--SELECT DEPARTMENT--</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Required Trainings:</label><br />
                                <select id="trainings-view" class="form-control" name="states[]" multiple="multiple"></select>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Required Documents:</label><br />
                                <select id="documents-view" class="form-control" name="states[]" multiple="multiple"></select>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Required Vaccines:</label><br />
                                <select id="vaccines-view" class="form-control" name="states[]" multiple="multiple"></select>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <button data-dismiss="modal" class="btn btn-primary">Close</button>
                    </div>
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
                        Modify Rank</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="text-primary">Rank Name:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="name-edit" placeholder="Name" type="text" class="form-control" data-name="Name"/>
                                </div>
                                <label id="error-name-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">Rank Code:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="code-edit" placeholder="Code" type="text" class="form-control" data-name="Code"/>
                                </div>
                                <label id="error-code-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">STCW:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="stcw-edit" placeholder="STCW" type="text" class="form-control" data-name="STCW"/>
                                </div>
                                <label id="error-stcw-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Regulation:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="regulation-edit" placeholder="Fax" type="text" class="form-control"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Description:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <textarea id="desc-edit" placeholder="Description" class="form-control" data-name="Description"></textarea>
                                </div>
                                <label id="error-desc-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Department:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <select id="department-edit" class="form-control" data-name="Department">
                                        <option value="">--SELECT DEPARTMENT--</option>
                                    </select>
                                </div>
                                <label id="error-dept-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Trainings Required:</label><br />
                                <select id="trainings" class="form-control" name="states[]" multiple="multiple"></select>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Required Documents:</label><br />
                                <select id="documents-edit" class="form-control" name="states[]" multiple="multiple"></select>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Required Vaccines:</label><br />
                                <select id="vaccines-edit" class="form-control" name="states[]" multiple="multiple"></select>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <button id="saveChanges" class="btn btn-primary">Save Changes
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
<script src="scripts/WebForms/rank.js"></script>
</asp:Content>
