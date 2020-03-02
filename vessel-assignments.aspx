<%@ Page Title="Vessel Assignments" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="vessel-assignments.aspx.cs" Inherits="Seabase.vessel_assignments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-board">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Vessel Assignments</h3>

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
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="table-responsive">
                                    <div class="col-md-12">
                                        <label>Filters <i class="fa fa-filter"></i> </label>
                                    </div>
                                    <div class="col-md-3">
                                        <label><b>Principal:</b></label>
                                        <select id="principal">
                                            <option value="">--ALL PRINCIPALS--</option>
	                                    </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label><b>Vessel:</b></label>
                                        <select id="vessel">
                                            <option value="">--ALL VESSELS--</option>
	                                    </select>
                                    </div>
                                    <br />
                                    <table id="table">
                                        <thead>
                                            <tr>
                                                <td>Principal</td>
                                                <td>Vessel</td>
                                                <td>Name</td>
                                                <td>Rank</td>
                                                <td class="noExl">Action</td>
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
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/assignment.js"></script>
</asp:Content>
