<%@ Page Title="Disembarktion - Administration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="disembarkation-admin.aspx.cs" Inherits="Seabase.disembarkation_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-crew">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight" id="box-title">Disembarkation - Administration</h3>

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
                                    <div class="col-md-6">
                                        <label><b>Disembarkation Date:</b></label>
                                        <select id="month" class="form-control">
                                            <option value="">MM</option><option value="01">Jan</option>
                                            <option value="02">Feb</option>
                                            <option value="03">Mar</option>
                                            <option value="04">April</option>
                                            <option value="05">May</option>
                                            <option value="06">June</option>
                                            <option value="07">July</option>
                                            <option value="08">Aug</option>
                                            <option value="09">Sept</option>
                                            <option value="10">Oct</option>
                                            <option value="11">Nov</option>
                                            <option value="12">Dec</option>
	                                    </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label><b>Year:</b></label>
                                        <select id="year" class="form-control">
                                            
	                                    </select>
                                    </div>
                                    <div class="col-md-12">
                                        <label><b>Signatory:</b></label>
                                        <select id="signatory" class="form-control">
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
                                   
                                    <div class="col-md-12">

                                        <br /><br />

                                        <a role="button" class="btn btn-primary btn-add" id="create-report">
                                            Create Report
                                        </a>
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
<script>
    $(document).ready(function () {
        principals();
        years();
    });

    function principals() {
        (new http).post("principals.aspx/get", {
        }).then(function (response) {
            var items = response.d.map(item => {
                $('#principal').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
            });
        }).run();
    }

    function years() {
        (new http).post("disembarkation-admin.aspx/years", {
        }).then(function (response) {
            var items = response.d;

            $.each(items, function (id, key) {
                $('#year').append("<option value=\"" + key + "\">" + key + "</option>");
            });

        }).run();
    }

    $('#create-report').click(function () {

        var url = '/report-disembarkation-admin?principal=' + $('#principal').val() + '&date=' + $('#year').val() + '-' + $('#month').val() + '%&yy=' + $('#year').val() + '&mm=' + $('#month option:selected').text() + '&signatory=' + $('#signatory').val();

        $(window.location).attr('href', url);
    });

</script>
</asp:Content>
