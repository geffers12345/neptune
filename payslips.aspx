<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="payslips.aspx.cs" Inherits="Seabase.payslips" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-maintenance">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title animated slideInRight">Crew Payslip</h3>

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
                        <select class="form-control" id="scales" style="display: none; opacity: 0;" disabled></select>
                        <div class="box-footer">
                            <div class="table-responsive">
                                <div class="col-md-12">
                                    <label>Filters <i class="fa fa-filter"></i> </label>
                                </div>
                                <div class="col-md-4">
                                    <label><b>Principal:</b></label>
                                    <select id="principal">
	                                </select>
                                </div>
                                <div class="col-md-4">
                                    <label><b>Vessel:</b></label>
                                    <select id="vessel">
	                                </select>
                                </div>
                                <table id="table">
                                    <thead>
                                        <tr>
                                            <td>Crew</td>
                                            <td>Rank</td>
                                            <td>Principal</td>
                                            <td>Vessel</td>
                                            <td>Daily Wage</td>
                                            <td>Days Onboard</td>
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

<div class="modal fade" id="preview-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add Additional Information</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="row">
                        <div class="col-md-4">
                            <label class="text-primary">Year</label>
                            <select id="year" class="form-control"></select>
                        </div>

                        <div class="col-md-8">
                            <label class="text-primary">Month:</label>
                            <select id="month" class="form-control">
                                <option value="1">January</option>
                                <option value="2">February</option>
                                <option value="3">March</option>
                                <option value="4">April</option>
                                <option value="5">May</option>
                                <option value="6">June</option>
                                <option value="7">July</option>
                                <option value="8">August</option>
                                <option value="9">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
	                        </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Sick Days this Month:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="sick-days" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Balance Last Wage Account:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="balance" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">SSS/PHIC:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="sss" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">PAG-IBIG FUND:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="pag-ibig" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">OWWA/SWF:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="owwa" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">CASH ADVANCE MANILA:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="ca-manila" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">CASH ADVANCE EUR/FE:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="ca-eur" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">REMITTANCE MANILA:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="remit" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">PERSONAL LOAN:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="loan" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Amount in Phil Peso/Other Curr:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="amount" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="view" class="btn btn-primary">View Payslip
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
    var table;
    var id = 0;

    $(document).ready(function () {
        table = $('#table').DataTable();

        years();

        setTimeout(function () {
            get($('#principal').val(), $('#vessel').val());
        }, 3000);
    });

    function years() {
        var d = new Date();

        for (var y = d.getFullYear(); y >= d.getFullYear() - 20; y--) {

            $('#year').append('<option value="' + y + '">' + y + '</option>');
        }
    }

    $('#principal, #vessel').change(function () {
        get($('#principal').val(), $('#vessel').val());
    });

    function get(principalID, vesselID) {

        table.destroy();

        $('#tbody').empty();

        (new http).post("payslips.aspx/get", {
            principalID: principalID,
            vesselID: vesselID
        }).then(function (response) {
            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    var daily = "";
                    var ot = "";

                    if (item.Income.includes('Basic Pay') || item.Income.includes('Basic Salary')) {

                        daily = parseFloat(item.Daily);

                        var html = "<tr>" +
                                    "<td>" + item.Crew + "</td>" +
                                    "<td>" + item.Rank + "</td>" +
                                    "<td>" + item.Principal + "</td>" +
                                    "<td>" + item.Vessel + "</td>" +
                                    "<td>" + daily + "</td>" +
                                    "<td>" + item.DepartureDate + "</td>" +
                                    "<td><a role='button' class='view-modal' data-id='" + item.CrewID + "' data-toggle='modal' data-target='#preview-modal'>" +
                                            "<span>Preview</span>" +
                                        "</a></td></tr>";

                        $('#tbody').append(html);
                    }

                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
                table = $('#table').DataTable();

                $('.view-modal').click(function () {
                    id = $(this).data('id');

                    console.log(id);
                });
            });
        }).run();
    }

    $('#view').click(function () {
        $(window.location).attr('href', 'payslip?crewid=' + id +
            '&year=' + $('#year').val() + '&month=' + $('#month').val() +
            '&sick=' + $('#sick-days').val() + '&balance=' + $('#balance').val() +
            '&monthstr=' + $('#month option:selected').text() +
            '&sss=' + $('#sss').val() +
            '&pagibig=' + $('#pag-ibig').val() +
            '&owwa=' + $('#owwa').val() +
            '&manila=' + $('#ca-manila').val() +
            '&eur=' + $('#ca-eur').val() +
            '&remit=' + $('#remit').val() +
            '&loan=' + $('#loan').val() +
            '&amount=' + $('#amount').val() + '');
    });
</script>
</asp:Content>
