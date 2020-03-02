<%@ Page Title="Announcements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="announcements.aspx.cs" Inherits="Seabase.announcements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper div-admin">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title animated slideInRight">Announcements</h3>

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
                                        <div class="col-md-8">
                                            <button data-toggle="modal" data-target="#addModal" class="btn btn-primary btn-add">
                                                Add New Announcement 
                                                <span class="tooltiptext">Click to add new announcement</span>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <div class="table-responsive">
                                        <table id="myTable">
                                            <thead>
                                                <tr>
                                                    <td>Annoucement Name</td>
                                                    <td>Attachment</td>
                                                    <td>Created By</td>
                                                    <td>Status</td>
                                                    <td>Date Created</td>
                                                    <td>Date Modified</td>
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

    <form runat="server">
        <div class="modal fade" id="addModal" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title text-primary">
                            <span class="fa fa-plus-circle"></span> &nbsp;
                            Add New Announcement</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="text-primary">Announcement Name:</label><br />
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                        <input id="name" placeholder="Announcement Name" type="text" class="form-control" data-name="Name"/>
                                    </div>
                                    <label id="errorName" style="display: none" class="text-danger"></label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="text-primary">Content:</label><br />
                                    <textarea id="desc" placeholder="Content" class="form-control" data-name="Content"></textarea>
                                    <label id="errorContent" style="display: none" class="text-danger"></label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="text-primary">Attachment:</label><br />
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                        <asp:FileUpload runat="server" CssClass="form-control" id="attach"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" ID="saveAttach" CssClass="hidden" Text="Save" OnClick="saveAttach_Click" />
                        <button id="save" class="btn btn-primary">Save Announcement
                            <i class="fa fa-spinner fa-spin hidden"></i>
                        </button>
                        <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="viewModal" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title text-primary">
                            <span class="fa fa-plus-circle"></span> &nbsp;
                            Announcement Info</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="text-primary">Announcement Name:</label><br />
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                        <input id="nameView" placeholder="Memo Name" type="text" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <label class="text-primary">Memo:</label><br />
                                <div id="descView">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="text-primary">Attachment:</label><br />
                                    <a href="#" target="_blank" id="attachView"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-primary">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="editModal" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title text-primary">
                            <span class="fa fa-plus-circle"></span> &nbsp;
                            Modify Announcement</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="text-primary">Announcement Name:</label><br />
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                        <input id="nameEdit" placeholder="Announcement Name" type="text" class="form-control" data-name="Name"/>
                                    </div>
                                    <label id="errorNameEdit" style="display: none" class="text-danger"></label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="text-primary">Content:</label><br />
                                    <textarea id="descEdit" placeholder="Content" class="form-control" data-name="Content"></textarea>
                                    <label id="errorContentEdit" style="display: none" class="text-danger"></label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="text-primary">Attachment:</label><br />
                                    <div class="input-group">
                                        <label id="attachLabel" class="form-control"></label>
                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                        <asp:FileUpload runat="server" CssClass="form-control hidden" id="attachEdit"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" ID="saveAttachEdit" CssClass="hidden" Text="Save" OnClick="saveAttachEdit_Click" />
                        <button id="saveChanges" class="btn btn-primary">Save Changes
                            <i class="fa fa-spinner fa-spin hidden"></i>
                        </button>
                        <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
<script src="scripts/jquery-3.2.1.min.js"></script>
<script src="scripts/helpers.js"></script>
<script src="scripts/sweetalert2.min.js"></script>
<script src="scripts/validator.js"></script>
<script src="scripts/WebForms/announce.js"></script>
<script src="scripts/bootstrap-select.js"></script>
</asp:Content>
