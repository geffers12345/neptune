<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="signatories.aspx.cs" Inherits="Seabase.signatories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper div-maintenance">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                      <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title animated slideInRight">Signatories</h3>

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
                                              Add New Signatory
                                                <span class="tooltiptext">Click to add new item</span>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <div class="table-responsive">
                                        <table id="table">
                                            <thead>
                                                <tr>
                                                    <td>ID</td>
                                                    <td>Title</td>
                                                    <td>Name</td>
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

    <div class="modal fade" id="addModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New Signatory</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Title:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="title" placeholder="Title" type="text" class="form-control" data-name="Title"/>
                                </div>
                                <label id="error-title" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Signatory Name:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="name" placeholder="Name" type="text" class="form-control" data-name="Name"/>
                                </div>
                                <label id="error-name" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button id="save" class="btn btn-primary">Save Signatory
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
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
                        Modify Signatory</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Title:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="title-edit" placeholder="Title" type="text" class="form-control" data-name="Title"/>
                                </div>
                                <label id="error-title-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Signatory Name:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input id="name-edit" placeholder="Name" type="text" class="form-control" data-name="Name"/>
                                </div>
                                <label id="error-name-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button id="saveChanges" class="btn btn-primary">Save Changes
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
<script>
    var id = 0;

    $(document).ready(function () {
        get();
    });

    function get() {
        $('#tbody').text('');

        $('#tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

        (new http).post("signatories.aspx/get", {

        }).then(function (response) {

            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {

                    var html = "<tr>" +
                               "<td>" + item.ID + "</td>" +
                               "<td>" + item.Title + "</td>" +
                               "<td>" + item.Signatory + "</td>" +
                               "<td>";
                    html += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\" data-toggle='modal' data-target='#editModal'>" +
                            "<span class=\"tooltiptext\">Click to modify details</span>" +
                        "</i><i data-id=\"" + item.ID + "\" data-name=\"" + item.Signatory + "\" class=\"fa fa-remove remove\">" +
                                       "<span class=\"tooltiptext\">Click to delete</span>" +
                                   "</i>";

                    html += "</td>" +
                   "</tr>";

                    $('#tbody').append(html);
                    resolve();
                });
            });

            Promise.all(items).then(function () {
                $('.loading').remove();
                $('#table').DataTable();
            });
        }).run();
    }

    $(document).on('click', '#save', function () {
        if (isInputValid()) {
            $('.fa-spin').removeClass('hidden');

            (new http).post("signatories.aspx/insert", {
                name: $('#name').val(),
                title: $('#title').val()
            }).then(function (response) {

                swal('Successfully Added!', 'Item has been successfully added.', 'success');
                get();
                $('.fa-spin').addClass('hidden');
                $('.close').click();

            }).run();
        }

    });

    $(document).on('click', '.edit', function () {
        id = $(this).data('id');

        (new http).post("signatories.aspx/find", {
            id: id
        }).then(function (response) {
            var item = response.d[0];

            $('#name-edit').val(item.Signatory);
            $('#title-edit').val(item.Title);

        }).run();
    });

    $(document).on('click', '#saveChanges', function () {
        if (isInputEditValid()) {
            $('.fa-spin').removeClass('hidden');

            (new http).post("signatories.aspx/update", {
                id: id,
                name: $('#name-edit').val(),
                title: $('#title-edit').val()
            }).then(function (response) {

                swal('Successfully Updated!', 'Item has been successfully updated.', 'success');
                get();
                $('.fa-spin').addClass('hidden');
                $('.close').click();

            }).run();
        }

    });

    $(document).on('click', '.remove', function () {
        id = $(this).data('id');
        var name = $(this).data('name');

        swal({
            title: 'Are you sure you want to delete ' + $(this).data('name') + '?',
            text: "You won't be able to revert this action!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: 'green',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Delete!'
        }).then(function (isConfirm) {
            if (isConfirm.value == true) {
                (new http).post("signatories.aspx/delete", {
                    id: id
                }).then(function (response) {
                    swal('Successfully Deleted', 'Item Has Been Deleted!', 'success');
                    get();
                }).run();
            }
        })
    });

    function isInputValid() {
        var a = $("#name").validate(['required']).displayErrorOn($("#error-name"));
        var b = $("#title").validate(['required']).displayErrorOn($("#error-title"));

        return a && b;
    }

    function isInputEditValid() {
         var a = $("#name-edit").validate(['required']).displayErrorOn($("#error-name-edit"));
        var b = $("#title-edit").validate(['required']).displayErrorOn($("#error-title-edit"));

        return a && b;
    }
</script>
</asp:Content>
