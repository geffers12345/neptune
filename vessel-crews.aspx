<%@ Page Title="Report Vessel Crews" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="vessel-crews.aspx.cs" Inherits="Seabase.vessel_crews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-crew">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight" id="box-title">Crew List By Vessel Report</h3>

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
                            <div class="box-footer">
                                <div class="col-md-6">
                                    <div class="col-md-12">
                                        <label><b>Principal:</b></label>
                                        <select id="principal" class="form-control">
                                            <option value="">--SELECT PRINCIPALS--</option>
	                                    </select>
                                    </div>
                                    <div class="col-md-12">
                                        <label><b>Vessel:</b></label>
                                        <select id="vessel" class="form-control">
	                                    </select>
                                    </div>
                                    <div class="col-md-12">
                                        <label><b>By Rank:</b></label>
                                        <select id="rank" class="form-control">
	                                    </select>
                                    </div>
                                    <div class="col-md-12">
                                        <label><b>Status:</b></label>
                                        <select id="status" class="form-control">
                                            <option value="2">On Board</option>
                                            <option value="7">On Vacation</option>
                                            <option value="4">On Training</option>
                                            <option value="5">Old Crew/Resigned</option>
                                            <option value="10">On Sick Leave</option>
	                                    </select>
                                    </div>
                                   
                                    <div class="col-md-12">

                                        <br /><br />

                                        <a role="button" class="btn btn-primary btn-add" id="create-report">
                                            Create Report
                                        </a>
                                        <button class="btn btn-primary btn-add" id="generateExcel">
                                            Create Excel
                                        </button>
                                    </div>

                                    <div class="col-md-12 hidden">
                                        <table id="table">
                                            <thead>
                                                <tr>
                                                    <td>Name</td>
                                                    <td class="noExl">Image</td>
                                                    <td>Rank</td>
                                                    <td>Contact Number</td>
                                                    <td>Principal</td>
                                                    <td>Vessel</td>
                                                    <td>Passport #</td>
                                                    <td>Seamans #</td>
                                                    <td>SRC #</td>
                                                    <td>E-Reg #</td>
                                                    <td>Age</td>
                                                    <td>Status</td>
                                                    <td>Date Modified</td>
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
            </div>
    </section>
</div>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/vesselcrew.js"></script>
</asp:Content>
