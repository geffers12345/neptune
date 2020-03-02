<%@ Page Title="Crews" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="crews.aspx.cs" Inherits="Seabase.crews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-crew">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight" id="box-title">Crews</h3>

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
                                <div class="table-responsive">
                                    <div class="col-md-12">
                                        <label>Filters <i class="fa fa-filter"></i> </label>
                                    </div>
                                    <div class="col-md-3">
                                        <label><b>By Rank:</b></label>
                                        <select id="rank">
                                            <option value="">--ALL RANKS--</option>
	                                    </select>
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
                                    <div class="col-md-3">
                                        <label><b>Status:</b></label>
                                        <select id="status">
                                            <option value="">--ALL STATUSES--</option>
                                            <option value="On Board">On Board</option>
                                            <option value="On Vacation">On Vacation</option>
                                            <option value="On Training">On Training</option>
                                            <option value="Old Crew/Resigned">Old Crew/Resigned</option>
                                            <option value="Available">Available</option>
	                                    </select>
                                    </div>
                                    <br />
                                    <div class="col-md-3">
                                        <label><b>Municipality:</b></label>
                                        <select id="municipality">
                                            <option value="">--ALL MUNICIPALITY--</option>
	                                    </select>
                                    </div>
                                    <br />
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
                                                <td class="noExl hidden">Municipality</td>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody">

                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-12">
                                    <button class="btn btn-primary btn-add" id="generateExcel">
                                        Export Crews
                                    </button>
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
<script src="scripts/WebForms/crew.js"></script>
</asp:Content>
