<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="payroll.aspx.cs" Inherits="Seabase.payroll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-maintenance">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title animated slideInRight">Payroll</h3>

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
                                            <td>Date</td>
                                            <td>Crew</td>
                                            <td>Rank</td>
                                            <td>Principal</td>
                                            <td>Vessel</td>
                                            <td>SSS Employee</td>
                                            <td>Pagibig Employee</td>
                                            <td>Medicare Employee</td>
                                            <td>Action</td>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">

                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-12">
                                <button id="view" class="btn btn-primary" data-toggle='modal' data-target='#view-modal'>Preview All
                                    <i class="fa fa-spinner fa-spin hidden"></i>
                                </button>
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
                                <label class="text-primary">SSS Employee:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="sss" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Pag-ibig Employee:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="pagibig" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">Medicare Employee:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="medicare" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">MTHS O.B.:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="ob" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">POB:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="pob" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="save" class="btn btn-primary">Save Changes
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="view-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Preview</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="row">
                        <div class="col-md-4">
                            <label class="text-primary">Year</label>
                            <select id="view-year" class="form-control"></select>
                        </div>

                        <div class="col-md-8">
                            <label class="text-primary">Month:</label>
                            <select id="view-month" class="form-control">
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
                                <label class="text-primary">EXCHANGE USD-PESO:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="peso" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">EXCHANGE USD-S$:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="usd" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="text-primary">EXCHANGE S$-PESO:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="number" id="exchange" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="view-pdf" class="btn btn-primary">View
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
    var pid = 0;
    var vid = 0;
    var rid = 0;

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

            $('#year, #view-year').append('<option value="' + y + '">' + y + '</option>');
        }
    }

    $('#principal, #vessel').change(function () {
        get($('#principal').val(), $('#vessel').val());
    });

    function get(principalID, vesselID) {
        table.destroy();

        $('#tbody').empty();

        var html = "";

        (new http).post("payslips.aspx/get", {
            principalID: principalID,
            vesselID: vesselID
        }).then(function (response) {
            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    var daily = "";
                    var ot = "";
                    var sss = "";
                    var pagibig = "";
                    var medicare = "";
                    var date = "";

                    (new http).post("payroll.aspx/get", {
                        principalID: item.PrincipalID,
                        vesselID: item.VesselID,
                        rankID: item.RankID,
                        crewID: item.CrewID
                    }).then(function (response) {
                        var adds = response.d.map(add => {
                            return new Promise(function (resolve, reject) {

                                sss = add.SSS;
                                pagibig = add.Pagibig;
                                medicare = add.Medicare;
                                date = add.Date;

                                resolve();
                            });
                        });

                        Promise.all(items).then(function () {
                            if (item.Income.includes('Basic Pay') || item.Income.includes('Basic Salary')) {

                                daily = parseFloat(item.Daily);

                                html = "<tr>" +
                                            "<td>" + date + "</td>" +
                                            "<td>" + item.Crew + "</td>" +
                                            "<td>" + item.Rank + "</td>" +
                                            "<td>" + item.Principal + "</td>" +
                                            "<td>" + item.Vessel + "</td>" +
                                            "<td>" + sss + "</td>" +
                                            "<td>" + pagibig + "</td>" +
                                            "<td>" + medicare + "</td>" +
                                            "<td><a role='button' class='view-modal' data-id='" + item.CrewID + "'" + 
                                            "data-pid='" + item.PrincipalID + "' data-vid='" + item.VesselID + "'" + 
                                            "data-rid='" + item.RankID + "' data-toggle='modal' data-target='#preview-modal'>" +
                                                    "<span>Edit</span>" +
                                                "</a></td></tr>";

                                $('#tbody').append(html);
                            }
                        });
                    }).run();

                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('#principal, #vessel').prop('disabled', true);
                setTimeout(function () {

                    $('.view-modal').click(function () {
                        id = $(this).data('id');
                        pid = $(this).data('pid');
                        vid = $(this).data('vid');
                        rid = $(this).data('rid');

                        console.log(pid, rid);
                    });

                    $('.loading').remove();
                    table = $('#table').DataTable();

                    $('#principal, #vessel').prop('disabled', false);
                }, 5000);
            });
        }).run();
    }

    $('#view-pdf').click(function () {
        $(window.location).attr('href', 'pay?crewid=' + id +
            '&year=' + $('#view-year').val() + '&month=' + $('#view-month').val() +
            '&peso=' + $('#peso').val() + '&usd=' + $('#usd').val() +
            '&monthstr=' + $('#view-month option:selected').text() +
            '&exchange=' + $('#exchange').val() +
            '&principal=' + $('#principal').val() +
            '&vessel=' + $('#vessel').val() + '');
    });

    $('#save').click(function () {
        (new http).post("payroll.aspx/insert", {
            crewID: id,
            principalID: pid,
            vesselID: vid,
            rankID: rid,
            date: $('#year').val() + '-' + $('#month option:selected').text(),
            sss: $('#sss').val(),
            pagibig: $('#pagibig').val(),
            medicare: $('#medicare').val(),
            mthsob: $('#ob').val(),
            pob: $('#pob').val()
        }).then(function (response) {
            $('.modal input[type=number]').val('0');
            swal('Successfully Saved!', 'Additional Information Successfully Saved!', 'success');
            get($('#principal').val(), $('#vessel').val());
            $('.modal .close').click();
        }).run();
    });
</script>
</asp:Content>
