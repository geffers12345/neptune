<%@ Page Title="Embarkation Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="embark.aspx.cs" Inherits="Seabase.embark" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper">
<style>
    .applicant-actions .btn {
            margin: 5px 0px;
    }
</style>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title animated slideInRight">Crew Embarkation/Disembarkation Details</h3>
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

                    </div>
                    <div class="box-footer">
                        <div class="container emp-profile">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="profile-img">
                                        <img src="#" class="img-thumbnail animated bounceIn" id="imageHere" alt=""/>
                                        <br />
                                        <br />
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="profile-head">

                                        <h4 id="name" class="animated bounceIn" style="font-weight: bold"></h4>

                                        <table>
                                            <tr>
                                                <td>
                                                    <h5>Position</h5>
                                                </td>
                                                <td>
                                                    <h5 id="rank-view"></h5>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5>Email Address</h5>
                                                </td>
                                                <td>
                                                    <h5 id="email-view"></h5>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5>Contact Number</h5>
                                                </td>
                                                <td>
                                                    <h5 id="contact-view"></h5>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5>Language</h5>
                                                </td>
                                                <td>
                                                    <h5 id="language-view"></h5>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5>Status</h5>
                                                </td>
                                                <td>
                                                    <h5 id="status-view"></h5>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Status:</label><br />
                                            <select id="status-embark" class="form-control" data-name="Status">
                                                <option value="2">On Board</option>
                                                <option value="3">On Vacation</option>
                                                <option value="4">On Training</option>
                                                <option value="5">Old Crew/Resigned</option>
                                                <option value="7">Available</option>
                                                <option value="8">Pool</option>
                                                <option value="9">Operation</option>
                                            </select>
                                            <label id="error-status" style="display: none" class="text-danger"></label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Principal:</label><br />
                                            <select id="embark-principal" class="form-control" data-name="Principal">
                                                <option value="">--SELECT PRINCIPAL--</option>
                                            </select>
                                            <label id="error-principal" style="display: none" class="text-danger"></label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Vessel:</label><br />
                                            <select id="embark-vessel" class="form-control" data-name="Vessel">

                                            </select>
                                            <label id="error-vessel" style="display: none" class="text-danger"></label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Position:</label><br />
                                            <select id="embark-rank" class="form-control" data-name="Rank">

                                            </select>
                                            <label id="error-rank" style="display: none" class="text-danger"></label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Proposed Vessel:</label><br />
                                            <input type="text" id="proposed" placeholder="Proposed Vessel" class="form-control" />
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Contact Term (No. of Months):</label><br />
                                            <input type="number" id="term" class="form-control" data-name="Term"/>
                                            <label id="error-term" style="display: none" class="text-danger"></label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Embarkation Date:</label><br />
                                            <input type="date" id="embarkation" class="form-control" data-name="Embarkation"/>
                                            <label id="error-embark" style="display: none" class="text-danger"></label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Disembarkation Date:</label><br />
                                            <input type="date" id="disembarkation" class="form-control" data-name="Disembarkation"/>
                                            <label id="error-disembark" style="display: none" class="text-danger"></label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Arrival Vessel Date:</label><br />
                                            <input type="date" id="arrival-vessel" class="form-control" data-name="Arrival Vessel"/>
                                            <label id="error-arrival-vessel" style="display: none" class="text-danger"></label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Point of Origin:</label><br />
                                            <input type="text" id="origin" class="form-control" data-name="Point of Origin"/>
                                            <label id="error-origin" style="display: none" class="text-danger"></label>
                                        </div>
                                    </div>

                                        <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="text-primary">Point of Embarkation:</label><br />
                                            <input type="text" id="joining" class="form-control" data-name="Joining Port"/>
                                            <label id="error-joining" style="display: none" class="text-danger"></label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Airport:</label><br />
                                            <select id="airport" class="form-control">
                                                <option value="">--SELECT AIRPORT--</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Ticket/ETD:</label><br />
                                            <input type="date" id="etd" class="form-control" data-name="ETD"/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Engaged/Re-engaged:</label><br />
                                            <select id="engage" class="form-control">
                                                <option value="1">Re-engaged</option>
                                                <option value="2">Engaged</option>
                                            </select>
                                        </div>
                                    </div>

                                        <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Promotion Date:</label><br />
                                            <input type="date" id="promotion" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Hire/Re-hire:</label><br />
                                            <select id="hire" class="form-control">
                                                <option value="1">Rehire</option>
                                                <option value="2">Newly Hire</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Departure Date (Manila):</label><br />
                                            <input type="date" id="departure" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">NBO No.:</label><br />
                                            <input type="text" id="nbo" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">POEA Contract Filed Date:</label><br />
                                            <input type="date" id="filed" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="text-primary">POEA Contract Release:</label><br />
                                            <input type="date" id="released" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="text-primary">Availability Date From:</label><br />
                                            <input type="date" id="avail-from" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="text-primary">Availability Date To:</label><br />
                                            <input type="date" id="avail-to" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Primary Replacement:</label><br />
                                            <select id="primary" class="form-control">
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-primary">Secondary Replacement:</label><br />
                                            <select id="secondary" class="form-control">
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="text-primary">Remarks:</label><br />
                                            <textarea id="remarks" class="form-control">
                                            </textarea>
                                        </div>
                                    </div>
                                    <button id="save-embark-changes" class="btn btn-primary">Save Embarkation
                                        <i class="fa fa-spinner fa-spin hidden"></i>
                                    </button>
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
<script src="scripts/WebForms/maintenance.js"></script>
<script src="scripts/WebForms/applicant.js"></script>
<script src="scripts/WebForms/embarkation.js"></script>
<script>
    var applicantID = 0
    var embarkID = 0;

    $(document).ready(function () {
        var url = new URL(window.location.href);
        embarkID = url.searchParams.get("_xkwhd");

        embark_principals();

        setTimeout(function () {
            find(embarkID);
        }, 3000);
    });

</script>
</asp:Content>
