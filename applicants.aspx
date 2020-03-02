<%@ Page Title="Applicants" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="applicants.aspx.cs" Inherits="Seabase.applicants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #applicants .card {
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
          max-width: 300px;
          margin: 5px;
          text-align: center;
          font-family: arial;
        }

        #applicants .title {
          color: grey;
          font-size: 18px;
        }

        #applicants .button {
          border: none;
          outline: 0;
          display: inline-block;
          padding: 8px;
          color: white;
          background-color: #0f6c82;
          text-align: center;
          cursor: pointer;
          width: 100%;
          font-size: 18px;
        }

        #applicants a {
          text-decoration: none;
          font-size: 22px;
          color: black;
        }

        #applicants .button:hover, a:hover {
          opacity: 0.7;
        }

        #applicants img {
            height: 100px;
            width: 100px;
        }
    </style>
    <div class="content-wrapper div-manning">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                      <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title animated slideInRight" id="box-title"></h3>

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
                                    <div class="pull-right" style="margin-right: 2% !important;">
                                        <label>Filter By:</label>
                                        <select id="filter-rank">
                                            <option value="">--ALL RANKS--</option>
	                                    </select>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <div class="table-responsive" id="applicants">
                                        
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
<script src="scripts/WebForms/applicant.js"></script>
<script>
    var url = new URL(window.location.href);
    var id = url.searchParams.get("_knmsdlpsjsw");

    get(id);
</script>
</asp:Content>
