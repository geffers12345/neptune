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
                                        <label class="text-primary">Select Principal:</label><br />
                                        <select id="principal" class="form-control" data-name="Principal">
                                            <option value="">--SELECT PRINCIPAL--</option>
                                        </select>
                                        <label id="error-principal" class="text-danger" style="display: none"></label>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="text-primary">Select Vessel:</label><br />
                                        <select id="vessel" class="form-control" data-name="Vessel">

                                        </select>
                                        <label id="error-vessel" class="text-danger" style="display: none"></label>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <button id="view-report" class="btn btn-primary btn-add">
                                        View Report
                                        <span class="tooltiptext">Click to view</span>
                                    </button>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="table-responsive">
                                    <table id="table">
                                        <thead>
                                            <tr>
                                                <td>Principal</td>
                                                <td>Vessel</td>
                                                <td>Crew</td>
                                                <td>Incident</td>
                                                <td>Reported By</td>
                                                <td>Date Created</td>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody">

                                        </tbody>
                                    </table><br />
                                    <button class="btn btn-primary btn-add" id="generateExcel">
                                        Export (.xls)
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
<script src="scripts/WebForms/incident.js"></script>
</asp:Content>
