<%@ Page Title="Crew Incidents" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="incidents.aspx.cs" Inherits="Seabase.incidents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-maintenance">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Crew Incidents</h3>

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
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="text-primary">Select Vessel:</label><br />
                                        <select id="vessel" class="form-control">
                                            <option value="">--ALL VESSELS--</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="text-primary">Select Rank:</label><br />
                                        <select id="rank" class="form-control">
                                            <option value="">--ALL RANKS--</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label class="text-primary">Status</label>
                                    <select id="status" class="form-control">
                                        <option value="">--ALL--</option>
                                        <option value="On-Going">On-Going</option>
                                        <option value="Stop Treatment">Stop Treatment</option>
                                        <option value="Disability Grading">Disability Grading</option>
                                        <option value="Fit to Work">Fit to Work</option>
                                    </select>
                                </div>

                            </div>
                            <div class="box-footer">
                                <div class="table-responsive">
                                    <table id="table">
                                        <thead>
                                            <tr>
                                                <td>Vessel</td>
                                                <td>Rank</td>
                                                <td>Illness Date</td>
                                                <td>Repatriation Date</td>
                                                <td>Illness/Injury</td>
                                                <td>Type</td>
                                                <td>Disability</td>
                                                <td>Clinic</td>
                                                <td>Status</td>
                                                <td>Date Pronounced</td>
                                                <td>Date Settled</td>
                                                <td>Remarks</td>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody">

                                        </tbody>
                                    </table>
                                </div>
                                <br />
                                <button class="btn btn-primary btn-add" id="generateExcel">
                                    Export (.xls)
                                </button>
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
<script src="scripts/WebForms/incident.js"></script>
</asp:Content>
