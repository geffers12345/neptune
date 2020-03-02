<%@ Page Title="User Roles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="roles.aspx.cs" Inherits="Seabase.roles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper div-role div-security">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                      <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title animated slideInRight">User Roles</h3>

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
                                              Add New Role
                                                <span class="tooltiptext">Add new user role</span>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <div class="table-responsive">
                                        <table id="myTable">
                                            <thead>
                                                <tr>
                                                    <td>ID</td>
                                                    <td>Role Name</td>
                                                    <td>Status</td>
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
        <div class="modal-dialog modal-md" style="width: 100% !important;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New User Role</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Role Name:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="name" placeholder="Role Name" type="text" class="form-control" data-name="Role Name"/>
                                </div>
                                <label id="errorName" style="display: none" class="text-danger"></label>
                            </div>
                        </div>  
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Description:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="desc" placeholder="Description" type="text" class="form-control" data-name="Description"/>
                                </div>
                                <label id="errorDesc" style="display: none" class="text-danger"></label>
                            </div>
                        </div>  
                        <div class="col-md-12">
                            <label class="text-primary">Permissions:</label><br />
                            <div style="overflow-x:auto;">
                                <table>
                                    <tr>
                                        <th>Module Name</th>
                                        <th>View</th>
                                        <th>Create</th>
                                        <th>Modify</th>
                                        <th>Delete</th>
                                    </tr>
                                    <tr>
                                        <td>Dashboard</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewDashboard" value="1">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateDashboard" value="2">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyDashboard" value="3">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteDashboard" value="4">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Manning</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewManning" value="5">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateManning" value="6">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyManning" value="7">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteManning" value="8">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>Crew Management</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewCrew" value="9">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateCrew" value="10">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyCrew" value="11">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteCrew" value="12">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>On Board Management</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewBoard" value="13">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateBoard" value="14">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyBoard" value="15">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteBoard" value="16">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Human Resources</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewHuman" value="17">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateHuman" value="18">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyHuman" value="19">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteHuman" value="20">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Vessel and Principal</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewVessel" value="21">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateVessel" value="22">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyVessel" value="23">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteVessel" value="24">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Maintenance</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewMaintenance" value="25">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateMaintenance" value="26">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyMaintenance" value="27">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteMaintenance" value="28">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Document Manager</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewDocument" value="29">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateDocument" value="30">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyDocument" value="31">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteDocument" value="32">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Security</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewSecurity" value="33">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateSecurity" value="34">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifySecurity" value="35">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteSecurity" value="36">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                </table>
                           </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="save" class="btn btn-primary">Save Role
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="viewModal" role="dialog">
        <div class="modal-dialog modal-md" style="width: 100% !important;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        User Role Info</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-group">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Role Name:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="nameView" type="text" class="form-control"/>
                                </div>
                            </div>
                        </div>  
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Description:</label><br />
                                <textarea id="descView" class="form-control"></textarea>
                            </div>
                        </div>
                            <div class="col-md-12">
                            <label class="text-primary">Permissions:</label><br />
                            <div style="overflow-x:auto;">
                                <table>
                                    <tr>
                                        <th>Module Name</th>
                                        <th>View</th>
                                        <th>Create</th>
                                        <th>Modify</th>
                                        <th>Delete</th>
                                    </tr>
                                    <tr>
                                        <td>Dashboard</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewDashboardView" value="1">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateDashboardView" value="2">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyDashboardView" value="3">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteDashboardView" value="4">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Manning</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewManningView" value="5">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateManningView" value="6">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyManningView" value="7">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteManningView" value="8">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>Crew Management</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewCrewView" value="9">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateCrewView" value="10">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyCrewView" value="11">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteCrewView" value="12">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>On Board Management</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewBoardView" value="13">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateBoardView" value="14">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyBoardView" value="15">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteBoardView" value="16">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Human Resources</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewHumanView" value="17">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateHumanView" value="18">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyHumanView" value="19">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteHumanView" value="20">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Vessel and Principal</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewVesselView" value="21">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateVesselView" value="22">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyVesselView" value="23">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteVesselView" value="24">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Maintenance</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewMaintenanceView" value="25">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateMaintenanceView" value="26">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyMaintenanceView" value="27">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteMaintenanceView" value="28">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Document Manager</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewDocumentView" value="29">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateDocumentView" value="30">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifyDocumentView" value="31">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteDocumentView" value="32">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Security</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canViewSecurityView" value="33">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboard" id="canCreateSecurityView" value="34">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canModifySecurityView" value="35">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboard" id="canDeleteSecurityView" value="36">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                </table>
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
    </div>

    <div class="modal fade" id="editModal" role="dialog">
        <div class="modal-dialog modal-md" style="width: 100% !important;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Modify User Role</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Role Name:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="nameEdit" placeholder="Role Name" type="text" class="form-control" data-name="Role Name"/>
                                </div>
                                <label id="errorNameEdit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>  
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Description:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="descEdit" type="text" placeholder="Description" class="form-control" data-name="Description"/>
                                </div>
                                <label id="errorDescEdit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label class="text-primary">Permissions:</label><br />
                            <div style="overflow-x:auto;">
                                <table>
                                    <tr>
                                        <th>Module Name</th>
                                        <th>View</th>
                                        <th>Create</th>
                                        <th>Modify</th>
                                        <th>Delete</th>
                                    </tr>
                                    <tr>
                                        <td>Dashboard</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canViewDashboardEdit" value="1">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboardEdit" id="canCreateDashboardEdit" value="2">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canModifyDashboardEdit" value="3">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canDeleteDashboardEdit" value="4">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Manning</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canViewManningEdit" value="5">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboardEdit" id="canCreateManningEdit" value="6">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canModifyManningEdit" value="7">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canDeleteManningEdit" value="8">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>Crew Management</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canViewCrewEdit" value="9">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboardEdit" id="canCreateCrewEdit" value="10">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canModifyCrewEdit" value="11">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canDeleteCrewEdit" value="12">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>On Board Management</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canViewBoardEdit" value="13">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboardEdit" id="canCreateBoardEdit" value="14">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canModifyBoardEdit" value="15">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canDeleteBoardEdit" value="16">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Human Resources</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canViewHumanEdit" value="17">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboardEdit" id="canCreateHumanEdit" value="18">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canModifyHumanEdit" value="19">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canDeleteHumanEdit" value="20">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Vessel and Principal</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canViewVesselEdit" value="21">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboardEdit" id="canCreateVesselEdit" value="22">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canModifyVesselEdit" value="23">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canDeleteVesselEdit" value="24">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Maintenance</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canViewMaintenanceEdit" value="25">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboardEdit" id="canCreateMaintenanceEdit" value="26">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canModifyMaintenanceEdit" value="27">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canDeleteMaintenanceEdit" value="28">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Document Manager</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canViewDocumentEdit" value="29">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboardEdit" id="canCreateDocumentEdit" value="30">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canModifyDocumentEdit" value="31">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canDeleteDocumentEdit" value="32">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Security</td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canViewSecurityEdit" value="33">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                                <input type="checkbox" class="dashboardEdit" id="canCreateSecurityEdit" value="34">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canModifySecurityEdit" value="35">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="containers">
                                              <input type="checkbox" class="dashboardEdit" id="canDeleteSecurityEdit" value="36">
                                              <span class="checkmark"></span>
                                            </label>
                                        </td>
                                    </tr>
                                </table>
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
<script src="scripts/WebForms/roles.js"></script>
</asp:Content>
