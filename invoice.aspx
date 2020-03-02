<%@ Page Title="Invoice Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="Seabase.invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper div-vessel">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Invoice Details</h3>

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
                                        <button data-toggle="modal" data-target="#add-item-modal" class="btn btn-primary btn-add">
                                            Add New Item
                                            <span class="tooltiptext">Click to add new item</span>
                                        </button>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="table-responsive">
                                    <table id="table-items">
                                        <thead>
                                            <tr>
                                                <td>ID</td>
                                                <td>Invoice Number</td>
                                                <td>Principal</td>
                                                <td>Total</td>
                                                <td>Date Created</td>
                                                <%--<td>Action</td>--%>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody-items">

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

<div class="modal fade" id="add-item-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                   Add New Item</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="text-primary">Item Description:</label><br />
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="text" id="item" placeholder="Item Description" class="form-control" data-name="Item"/>
                        </div>
                        <label id="error-item" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-12">
                        <label class="text-primary">Quantity:</label><br />
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="quantity" min="0" class="form-control" data-name="Quantity"/>
                        </div>
                        <label id="error-quantity" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-12">
                        <label class="text-primary">Unit Price:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="price" min="0" class="form-control" data-name="Price"/>
                        </div>
                        <label id="error-price" style="display: none" class="text-danger"></label>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="save-new-item" class="btn btn-primary">Save Item
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
<script src="scripts/WebForms/invoice.js"></script>
<script>
    var pID = 0;
    var inv = 0;

    $(document).ready(function () {
        var url = new URL(window.location.href);

        pID = url.searchParams.get("_pgksjd");
        inv = url.searchParams.get("_xkwhd");

        invoiceID = pID;

        details(parseInt(pID), parseInt(inv));
    });

    $(document).on('click', '#save-new-item', function (e) {
        e.preventDefault();

        if (hasItemValues()) {
            (new http).post('invoices.aspx/insert', {
                principalID: pID,
                number: inv,
                item: $('#item').val(),
                quantity: parseFloat($('#quantity').val()),
                price: parseFloat($('#price').val()),
                total: parseFloat($('#quantity').val()) * parseFloat($('#price').val())
            }).then(function (data) {
                swal('Successfully Saved!', 'Item Has Been Saved!', 'success');
                $('.fa-spin').addClass('hidden');
                $('.close').click();

                details(parseInt(pID), parseInt(inv));
            }).run();
        }
    });

    function hasItemValues() {
        var c = $("#item").validate(['required']).displayErrorOn($("#error-item"));
        var d = $("#quantity").validate(['required']).displayErrorOn($("#error-quantity"));
        var e = $("#price").validate(['required']).displayErrorOn($("#error-price"));

        return c && d && e;
    }
</script>
</asp:Content>
