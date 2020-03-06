<%@ Page Title="Embarkations" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="embarkation-lists.aspx.cs" Inherits="Seabase.embarkation_lists" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-board">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Embarkation Lists</h3>

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
                                    <div class="col-md-12">
                                        <button class="btn btn-primary" data-toggle="modal" data-target="#add-embark-modal">Add New Embarkation</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="table-responsive">
                                    <table id="embark-table" style="width: 100%;">
                                        <thead>
                                            <tr>
                                                <td>ID</td>
                                                <td>Principal</td>
                                                <td>Vessel</td>
                                                <td>Departure Date</td>
                                                <td>Departure Airport</td>
                                                <td>Embarkation Port</td>
                                                <td>Embarkation Date</td>
                                                <td>Contract (Mos.)</td>
                                                <td>Crew List</td>
                                                <td>Action</td>
                                            </tr>
                                        </thead>
                                        <tbody id="embark-tbody">

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

<div class="modal fade" id="add-embark-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Embarkation</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Code:</label><br />
                            <input type="text" id="code" class="form-control" disabled />
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="text-primary">Principal:</label><br />
                            <select id="embark-principal" class="form-control" data-name="Principal">
                                <option value="">--SELECT PRINCIPAL--</option>
                            </select>
                            <label id="error-principal" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Vessel:</label><br />
                            <select id="embark-vessel" class="form-control" data-name="Vessel">

                            </select>
                            <label id="error-vessel" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Departure Date:</label><br />
                            <input type="date" id="departure-date" class="form-control" data-name="Departure Date" />
                            <label id="error-departure-date" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Departure Airport:</label><br />
                            <input type="text" id="departure-airport" placeholder="Departure Airport" class="form-control" data-name="Departure Airport" />
                            <label id="error-departure-airport" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Port of Embarkation:</label><br />
                            <select id="embarkation-port" class="form-control" data-name="Embarkation Port">

                            </select>
                            <label id="error-embarkation" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Embarkation Date (Arrival in Vessel):</label><br />
                            <input type="date" id="embarkation-date" class="form-control" data-name="Embarkation Date"/>
                            <label id="error-embarkation-date" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Tentative Arrival Date:</label><br />
                            <input type="date" id="arrival-date" class="form-control"/>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Arrival Airport:</label><br />
                            <input type="text" id="arrival-airport" placeholder="Departure Airport" class="form-control" />
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Port of Disembarkation:</label><br />
                            <select id="disembarkation-port" class="form-control" data-name="Embarkation Port">

                            </select>
                            <label id="error-disembarkation" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Disembarkation Date:</label><br />
                            <input type="date" id="disembarkation-date" class="form-control" data-name="Disembarkation"/>
                            <label id="error-disembark-date" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Contract Duration:</label><br />
                            <input type="number" id="duration" class="form-control" data-name="Duration"/>
                            <label id="error-duration" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Point of Hire:</label><br />
                            <input type="text" id="point" class="form-control" placeholder="Point of Hire"/>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Remarks:</label><br />
                            <textarea id="remarks" class="form-control"></textarea>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="save-embark" class="btn btn-primary">Save Embarkation
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="edit-embark-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Modify Embarkation</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Code:</label><br />
                            <input type="text" id="code-edit" class="form-control" disabled />
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="text-primary">Principal:</label><br />
                            <select id="embark-principal-edit" class="form-control" data-name="Principal">
                                <option value="">--SELECT PRINCIPAL--</option>
                            </select>
                            <label id="error-principal-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Vessel:</label><br />
                            <select id="embark-vessel-edit" class="form-control" data-name="Vessel">

                            </select>
                            <label id="error-vessel-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Departure Date:</label><br />
                            <input type="date" id="departure-date-edit" class="form-control" data-name="Departure Date" />
                            <label id="error-departure-date-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Departure Airport:</label><br />
                            <input type="text" id="departure-airport-edit" placeholder="Departure Airport" class="form-control" data-name="Departure Airport" />
                            <label id="error-departure-airport-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Port of Embarkation:</label><br />
                            <select id="embarkation-port-edit" class="form-control" data-name="Embarkation Port">

                            </select>
                            <label id="error-embarkation-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Embarkation Date (Arrival in Vessel):</label><br />
                            <input type="date" id="embarkation-date-edit" class="form-control" data-name="Embarkation Date"/>
                            <label id="error-embarkation-date-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Tentative Arrival Date:</label><br />
                            <input type="date" id="arrival-date-edit" class="form-control"/>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Arrival Airport:</label><br />
                            <input type="text" id="arrival-airport-edit" placeholder="Departure Airport" class="form-control" />
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Port of Disembarkation:</label><br />
                            <select id="disembarkation-port-edit" class="form-control" data-name="Embarkation Port">

                            </select>
                            <label id="error-disembarkation-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Disembarkation Date:</label><br />
                            <input type="date" id="disembarkation-date-edit" class="form-control" data-name="Disembarkation"/>
                            <label id="error-disembark-date-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Contract Duration:</label><br />
                            <input type="number" id="duration-edit" class="form-control" data-name="Duration"/>
                            <label id="error-duration-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Point of Hire:</label><br />
                            <input type="text" id="point-edit" class="form-control" placeholder="Point of Hire"/>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Remarks:</label><br />
                            <textarea id="remarks-edit" class="form-control"></textarea>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="save-embark-changes" class="btn btn-primary">Save Changes
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="list-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    All Crew Embarkations</h4>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#add-crew-modal">Add New Crew</button>
                </div>
                <div class="col-md-12">
                    <table id="lineups-table">
                        <thead>
                           <tr>
                                <td>ID</td>
                                <td>Crew</td>
                                <td>Position</td>
                                <td>Remarks</td>
                                <td>Action</td>
                            </tr>
                        </thead>
                        <tbody id="lineups-tbody">

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-danger">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="add-crew-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Crew</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Status:</label><br />
                            <select id="crew-status" class="form-control" data-name="Status">
                                <option value="2">On Board</option>
                                <option value="3">On Vacation</option>
                                <option value="4">On Training</option>
                                <option value="5">Old Crew/Resigned</option>
                                <option value="7">Available</option>
                                <option value="8">Pool</option>
                                <option value="9">Operation</option>
                            </select>
                            <label id="error-status-crew" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Position:</label><br />
                            <select id="crew-rank" class="form-control" data-name="Rank">

                            </select>
                            <label id="error-rank-rank" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Crew:</label><br />
                            <select id="crew" class="form-control">
                            </select>
                        </div>
                    </div>

                    
                    <div class="col-md-6 hidden">
                        <div class="form-group">
                            <label class="text-primary">Arrival Vessel Date:</label><br />
                            <input type="date" id="crew-arrival-vessel" class="form-control" data-name="Arrival Vessel"/>
                            <label id="error-arrival-vessel-crew" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6 hidden">
                        <div class="form-group">
                            <label class="text-primary">Airport:</label><br />
                            <select id="crew-airport" class="form-control">
                                <option value="">--SELECT AIRPORT--</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6 hidden">
                        <div class="form-group">
                            <label class="text-primary">Engaged/Re-engaged:</label><br />
                            <select id="crew-engage" class="form-control">
                                <option value="1">Re-engaged</option>
                                <option value="2">Engaged</option>
                            </select>
                        </div>
                    </div>

                     <div class="col-md-6 hidden">
                        <div class="form-group">
                            <label class="text-primary">Promotion Date:</label><br />
                            <input type="date" id="crew-promotion" class="form-control"/>
                        </div>
                    </div>
                     
                    <div class="col-md-6 hidden">
                        <div class="form-group">
                            <label class="text-primary">Hire/Re-hire:</label><br />
                            <select id="crew-hire" class="form-control">
                                <option value="1">Rehire</option>
                                <option value="2">Newly Hire</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6 hidden">
                        <div class="form-group">
                            <label class="text-primary">Departure Date (Manila):</label><br />
                            <input type="date" id="crew-departure" class="form-control"/>
                        </div>
                    </div>

                    <div class="col-md-6 hidden">
                        <div class="form-group">
                            <label class="text-primary">POEA Contract Filed Date:</label><br />
                            <input type="date" id="crew-filed" class="form-control"/>
                        </div>
                    </div>

                    <div class="col-md-6 hidden">
                        <div class="form-group">
                            <label class="text-primary">POEA Contract Release:</label><br />
                            <input type="date" id="crew-released" class="form-control"/>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Primary Replacement:</label><br />
                            <select id="crew-primary" class="form-control">
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Secondary Replacement:</label><br />
                            <select id="crew-secondary" class="form-control">
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Remarks:</label><br />
                            <textarea id="crew-remarks" class="form-control"></textarea>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="save-crew" class="btn btn-primary">Save Crew
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
<script src="scripts/WebForms/maintenance.js"></script>
<script src="scripts/WebForms/embarkationlists.js"></script>
</asp:Content>
