<%@ Page Title="Crew Planning" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="crew-planning.aspx.cs" Inherits="Seabase.crew_planning" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-board">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Crew Planning</h3>

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
                                    <table id="table">
                                        <thead>
                                            <tr>
                                                <td>Vessel Name</td>
                                                <td>Principal</td>
                                                <td>Vessel Type</td>
                                                <td>Group #</td>
                                                <td>Status</td>
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
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/planning.js"></script>
</asp:Content>
