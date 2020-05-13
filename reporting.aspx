<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="reporting.aspx.cs" Inherits="Seabase.reporting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-maintenance">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12" id="print-control">
                                    <button class="btn btn-primary" id="print-docs">Print Preview</button>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-md-12" id="iframe">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</div>

<div class="modal fade" id="dutch-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Dutch Contract</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Scale Number:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="scale" type="text" class="form-control"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Date:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="date-dutch" type="date" class="form-control"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Principal:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="principal-dutch" class="form-control">
                                    <option value="marin">Marin</option>
                                    <option value="others">Others</option>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="view-dutch-contract" class="btn btn-primary">OK
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="guarantee-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Letter of Guarantee</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Kindly choose the signatory:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="guarantee-signatory" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Agent:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="guarantee-agent" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Date Generated:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="date-generated" type="date" class="form-control"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Date Travelling:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="date-travelling" type="date" class="form-control"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Date Actual Embarkation:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="date-embarkation" type="date" class="form-control"/>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="view-guarantee" class="btn btn-primary">OK
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="tanker-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Info to the Master - Tanker</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Allotee:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="tanker-allotee" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Beneficiary:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="tanker-beneficiary" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Visa:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="tanker-visa" class="form-control">
                                    <option value="Schengen Visa"> Schengen Visa</option>
                                    <option value="US Visa"> US Visa</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Medical:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="tanker-medical" class="form-control">
                                    <option value="Dutch Form">Dutch Form</option>
                                    <option value="Pre-Employment Medical Examination"> Pre-Employment Medical Examination</option>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="view-tanker" class="btn btn-primary">OK
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="offshore-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    [Info to the Master - Cargo/Offshore</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Allotee:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="offshore-allotee" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Beneficiary:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="offshore-beneficiary" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Visa:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="offshore-visa" class="form-control">
                                    <option value="Schengen Visa">Schengen Visa</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Medical:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="offshore-medical" class="form-control">
                                    <option value="Dutch Form">Dutch Form</option>
                                    <option value="Pre-Employment Medical Examination"> Pre-Employment Medical Examination</option>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="view-offshore" class="btn btn-primary">OK
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="jsu-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    JSU Contract</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Kindly choose the signatory:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="jsu-signatory" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Date Accomplished:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="date-accomplished" type="date" class="form-control"/>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="view-jsu" class="btn btn-primary">OK
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="coe-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Contract of Employment</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Kindly choose the signatory:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="coe-signatory" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Hours of Work:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="coe-hours" type="number" class="form-control"/>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="view-coe" class="btn btn-primary">OK
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="engine-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Certification(Engine)</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Kindly choose the signatory:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="engine-signatory" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Number of Work Experience:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="work-number" type="number" class="form-control"/>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="view-engine" class="btn btn-primary">OK
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="service-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Certification(Service)</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Kindly choose the signatory:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="service-signatory" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Number of Work Experience:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="service-number" type="number" class="form-control"/>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="view-service" class="btn btn-primary">OK
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="disembarkation-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Panama Consulate Disembarkation</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Kindly choose the signatory:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="disembarkation-signatory" class="form-control">
                                    <option value="Director"> Director &nbsp;  </option>
                                    <option value="VP-Operations"> VP-Operations &nbsp;  </option>
                                    <option value="Liaison Officer"> Liaison Officer &nbsp;  </option>
                                    <option value="Accountant"> Accountant &nbsp;  </option>
                                    <option value="Accounting Assistant"> Accounting Assistant &nbsp;  </option>
                                    <option value="Documentation Officer I"> Documentation Officer I &nbsp;  </option>
                                    <option value="President"> President &nbsp;  </option>
                                    <option value="Crewing Manager 2"> Crewing Manager 2 &nbsp;  </option>
                                    <option value="Crew Coordinator"> Crew Coordinator &nbsp;  </option>
                                    <option value="Secretary"> Secretary &nbsp;  </option>
                                    <option value="Assistant Operations Manager"> Assistant Operations Manager &nbsp;</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Requested docs:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="requested_docs" class="form-control">
                                    <option value="coc">Certificate of Competency</option>
                                    <option value="gmdss">GMDSS OPERATOR Certificate of Competency</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Travel Docs:</label><br />
                            <select id="travel-docx"  class="form-control"></select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Licenses:</label><br />
                            <select id="license" class="form-control">
				                    
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Trainings & Other Certificates:</label><br />
                            <select id="seminars" class="form-control">
				                    
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Medical:</label><br />
                            <select id="medical" class="form-control">
				                    
                            </select>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="view-disembarkation" class="btn btn-primary">OK
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="rps-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    RPS Report</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Principal:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="change-principal" class="form-control">
                                    <option value="">SELECT PRINCIPAL</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Vessel:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="change-vessel" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <td></td>
                                        <td>Name</td>
                                        <td>E-Reg #</td>
                                        <td>Seamans #</td>
                                        <td>SRC #</td>
                                        <td>Gender</td>
                                        <td>Position</td>
                                        <td>Salary</td>
                                        <td>Contract Duration</td>
                                    </tr>
                                </thead>
                                <tbody id="rps-tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button data-toggle="modal" data-target="#rps-asignatory-modal" class="btn btn-primary">Create
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="rps-asignatory-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Signatory</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Submitted By:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="rps-signatory" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Requesting Party:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="rps-request" class="form-control">
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="view-rps-printable" class="btn btn-primary">OK
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
<script src="scripts/WebForms/maintenance.js"></script>
<script>
    var applicantID = 0;

    $(document).ready(function () {
        var url = new URL(window.location.href);
        applicantID = url.searchParams.get("_hsdlwhx");

        signatories();

        applicant(applicantID);
    });

    function signatories() {
        $('#jsu-signatory, #coe-signatory #guarantee-signatory, #rps-signatory, #rps-request, #engine-signatory, #service-signatory').empty();

        (new http).post("accounts.aspx/get", {
        }).then(function (response) {
            var items = response.d.map(item => {
                $('#jsu-signatory, #coe-signatory, #guarantee-signatory, #rps-signatory, #rps-request, #engine-signatory, #service-signatory').append("<option value=\"" + item.ID + "\">" + item.Position + "</option>");
            });
        }).run();
    }

    $('#view-dutch-contract').click(function () {
        $('.close').click();

        var url = '/report-dutch-contract?_hsdlwhx=' + applicantID + '&scale=' + $('#scale').val();

        var iframe = '<iframe id="printf" name="printf" src="' + url + '" width="100%" height="800px" frameborder="0"></iframe>';

        $('#iframe').empty().html(iframe);
    });

    $('#view-guarantee').click(function () {
        $('.close').click();

        var url = '/report-guarantee?_hsdlwhx=' + applicantID + '&travel=' + $('#date-travelling').val() +
            '&generate=' + $('#date-generated').val() + '&signatory=' + $('#guarantee-signatory').val() + '&agent=' + $('#guarantee-agent').val();

        var iframe = '<iframe id="printf" name="printf" src="' + url + '" width="100%" height="800px" frameborder="0"></iframe>';

        $('#iframe').empty().html(iframe);
    });

    $('#view-tanker').click(function () {
        $('.close').click();

        var url = '/report-info-master?_hsdlwhx=' + applicantID + '&allotee=' + $('#tanker-allotee').val() +
            '&beneficiary=' + $('#tanker-beneficiary').val() + '&visa=' + $('#tanker-visa').val() + '&medical=' + $('#tanker-medical').val();

        var iframe = '<iframe id="printf" name="printf" src="' + url + '" width="100%" height="800px" frameborder="0"></iframe>';

        $('#iframe').empty().html(iframe);
    });

    $('#view-offshore').click(function () {
        $('.close').click();

        var url = '/report-info-master?_hsdlwhx=' + applicantID + '&allotee=' + $('#offshore-allotee').val() +
            '&beneficiary=' + $('#offshore-beneficiary').val() + '&visa=' + $('#offshore-visa').val() + '&medical=' + $('#offshore-medical').val();

        var iframe = '<iframe id="printf" name="printf" src="' + url + '" width="100%" height="800px" frameborder="0"></iframe>';

        $('#iframe').empty().html(iframe);
    });

    $('#view-jsu').click(function () {
        $('.close').click();

        var url = '/report-jsu-contract?_hsdlwhx=' + applicantID + '&asignatory=' + $('#jsu-signatory').val() +
            '&date=' + $('#date-accomplished').val();

        var iframe = '<iframe id="printf" name="printf" src="' + url + '" width="100%" height="800px" frameborder="0"></iframe>';

        $('#iframe').empty().html(iframe);
    });

    $('#view-coe').click(function () {
        $('.close').click();

        var url = '/reporting-coe?_hsdlwhx=' + applicantID + '&asignatory=' + $('#coe-signatory').val() +
            '&hours=' + $('#coe-hours').val();

        var iframe = '<iframe id="printf" name="printf" src="' + url + '" width="100%" height="800px" frameborder="0"></iframe>';

        $('#iframe').empty().html(iframe);
    });

    $('#view-engine').click(function () {
        $('.close').click();

        var url = '/report-engine?_hsdlwhx=' + applicantID + '&asignatory=' + $('#engine-signatory').val() +
            '&works=' + $('#work-number').val();

        var iframe = '<iframe id="printf" name="printf" src="' + url + '" width="100%" height="800px" frameborder="0"></iframe>';

        $('#iframe').empty().html(iframe);
    });

     $('#view-service').click(function () {
        $('.close').click();

        var url = '/report-service?_hsdlwhx=' + applicantID + '&asignatory=' + $('#service-signatory').val() +
            '&works=' + $('#service-number').val();

        var iframe = '<iframe id="printf" name="printf" src="' + url + '" width="100%" height="800px" frameborder="0"></iframe>';

        $('#iframe').empty().html(iframe);
    });

    $('#view-disembarkation').click(function () {
        $('.close').click();

        var url = '/report-disembarkation?_hsdlwhx=' + applicantID + '&asignatory=' + $('#disembarkation-signatory').val() +
            '&requested_docs=' + $('#requested_docs').val() + '&travel=' + $('#travel-docx option:selected').text() + '&license=' + $('#license option:selected').text()
            + '&seminars=' + $('#seminars option:selected').text() + '&medical=' + $('#medical option:selected').text();

        var iframe = '<iframe id="printf" name="printf" src="' + url + '" width="100%" height="800px" frameborder="0"></iframe>';

        $('#iframe').empty().html(iframe);
    });

    $('#change-vessel').click(function () {
        crewRps($(this).val());
    });

    function crewRps(vesselId) {
        $('#rps-tbody').empty().append("<tr class=\"loading\"><td colspan=\"20\">Please select a Vessel</td></tr>");
            
        (new http).post("crews.aspx/crewRps", {
            vesselID: vesselId
        }).then(function (response) {

            var distinct = [];

            response.d.map(item => {

                var html = "";
                //getting numbers
                

                var today = getManilaTime().split(',')[0];
                var d = today.split('/');

                var d0 = d[0].length > 1 ? d[0] : '0' + d[0];
                var d1 = d[1].length > 1 ? d[1] : '0' + d[1];

                var formattedDate = d[2] + '-' + d0 + '-' + d1;

                (new http).post("applicant.aspx/numbers", {
                    id: item.ID,
                    date: formattedDate
                }).then(function (response) {

                    var items = response.d.map(n => {

                        return new Promise(function (resolve, reject) {

                            if (!distinct.includes(item.ID)) {
                                distinct.push(item.ID);

                                console.log(distinct);

                                html += "<tr>" +
                                    "<td><input type='checkbox' value='" + item.ID + "'/></td>" +
                                    "<td>" + item.Lastname + ', ' + item.Firstname + "</td>";

                                html += "<td>" + n.Eregistration + "</td>" +
                                        "<td>" + n.Seaman + "</td>" +
                                        "<td>" + n.SRC + "</td>" +
                                        "<td>" + item.Sex + "</td>" +
                                        "<td>" + item.Rank + "</td>" +
                                        "<td>" + item.DateCreated + "</td><td>" + item.DateUpdated + "</td></tr > ";
                            }

                            resolve();
                        });
                    });

                    Promise.all(items).then(function () {
                        $('.loading').remove();
                        $('#rps-tbody').append(html);
                    });

                }).run();
            });
        }).run();
    }

    $('#view-rps-printable').click(function () {
        $('.close').click();

        var Ids = $("#rps-tbody input:checkbox:checked").map(function(){
          return parseInt($(this).val());
        }).get();

        var url = '/report-rps?ids=' + Ids + '&principalId=' + $('#change-principal').val() +
            '&vesselId=' + $('#change-vessel').val() + '&submitted=' + $('#rps-signatory').val() + '&request=' + $('#rps-request').val();

        var iframe = '<iframe id="printf" name="printf" src="' + url + '" width="100%" height="800px" frameborder="0"></iframe>';

        $('#iframe').empty().html(iframe);
    });
</script>
</asp:Content>
