var id = 0;

$(document).ready(function () {
    get();
});

function get() {
    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"8\"><img src=\"content/img/overlay-loader.gif\" /></td></tr>");

    (new http).post("roles.aspx/get", {

    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {
                var isActive = item.DateDeleted == "" ? "Activated" : "Not Activated";

                var active = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Role + "\" class=\"fa fa-remove remove\">" +
                                   "<span class=\"tooltiptext\">Click to deactivate</span>" +
                               "</i>";
                var inactive = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.Role + "\" class=\"fa fa-check-circle activate\">" +
                                   "<span class=\"tooltiptext\">Click to activate</span>" +
                               "</i>";

                var statusAction = isActive == "Not Activated" ? inactive : active;

                var html = "<tr>" +
                           "<td>" + item.ID + "</td>" +
                           "<td>" + item.Role + "</td>" +
                           "<td>" + isActive + "</td>" +
                           "<td>" + item.DateCreated + "</td>" +
                           "<td>" + item.DateUpdated + "</td>" +
                           "<td>" +
                               "<i data-id=\"" + item.ID + "\" class=\"fa fa-search view\" data-toggle='modal' data-target='#viewModal'> " +
                                   "<span class=\"tooltiptext\">Click to view details</span>" +
                               "</i>";
                html += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\" data-toggle='modal' data-target='#editModal'>" +
                        "<span class=\"tooltiptext\">Click to modify details</span>" +
                    "</i>";

                html += statusAction;

                html += "</td>" +
               "</tr>";

                $('#tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#myTable').DataTable();
            //getActionPermissionsRole();
        });
    }).run();
}

$(document).on('click', '#save', function () {
    if (isInputValid()) {
        $(this).attr('disabled', true);
        $('.fa-spin').removeClass('hidden');

        (new http).post("roles.aspx/insert", {
            name: $('#name').val(),
            desc: $('#desc').val()
        }).then(function (response) {

            var roleID = response.d;

            var permissions = $('input.dashboard:checked').map(function () {
                return $(this).val();
            });

            $.each(permissions, function (key, id) {

                (new http).post("roles.aspx/insertPermissions", {
                    permit: id,
                    roleID: roleID
                }).then(function (response) {

                }).run();

                $('.fa-spin').addClass('hidden');

                setTimeout(function () {
                    swal('Successfully Added!', 'Role has been successfully added.', 'success');
                    $('.close').click();
                    window.location.reload();
                }, 10000);
            });

        }).run();
    }

});

$(document).on('click', '.view', function () {
    id = $(this).data('id');
    clearFileds();

    (new http).post("roles.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#nameView').val(item.Role);
        $('#descView').val(item.Description);

        (new http).post("roles.aspx/findPermissionRole", {
            id: id
        }).then(function (response) {
            var permissions = response.d.map(permission => {
                if (permission.PermissionID == 1) {
                    $('#canViewDashboardView').prop('checked', true);
                    $('#canViewDashboardView').prop('disabled', 'disabled');
                } else if (permission.PermissionID == 2) {
                    $('#canCreateDashboardView').prop('checked', true);
                    $('#canCreateDashboardView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 3) {
                    $('#canModifyDashboardView').prop('checked', true);
                    $('#canModifyDashboardView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 4) {
                    $('#canDeleteDashboardView').prop('checked', true);
                    $('#canDeleteDashboardView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 5) {
                    $('#canViewManningView').prop('checked', true);
                    $('#canViewManningView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 6) {
                    $('#canCreateManningView').prop('checked', true);
                    $('#canCreateManningView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 7) {
                    $('#canModifyManningView').prop('checked', true);
                    $('#canModifyManningView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 8) {
                    $('#canDeleteManningView').prop('checked', true);
                    $('#canDeleteManningView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 9) {
                    $('#canViewCrewView').prop('checked', true);
                    $('#canViewCrewView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 10) {
                    $('#canCreateCrewView').prop('checked', true);
                    $('#canCreateCrewView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 11) {
                    $('#canModifyCrewView').prop('checked', true);
                    $('#canModifyCrewView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 12) {
                    $('#canDeleteCrewView').prop('checked', true);
                    $('#canDeleteCrewView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 13) {
                    $('#canViewBoardView').prop('checked', true);
                    $('#canViewBoardView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 14) {
                    $('#canCreateBoardView').prop('checked', true);
                    $('#canCreateBoardView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 15) {
                    $('#canModifyBoardView').prop('checked', true);
                    $('#canModifyBoardView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 16) {
                    $('#canDeleteBoardView').prop('checked', true);
                    $('#canDeleteBoardView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 17) {
                    $('#canViewHumanView').prop('checked', true);
                    $('#canViewHumanView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 18) {
                    $('#canCreateHumanView').prop('checked', true);
                    $('#canCreateHumanView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 19) {
                    $('#canModifyHumanView').prop('checked', true);
                    $('#canModifyHumanView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 20) {
                    $('#canDeleteHumanView').prop('checked', true);
                    $('#canDeleteHumanView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 21) {
                    $('#canViewVesselView').prop('checked', true);
                    $('#canViewVesselView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 22) {
                    $('#canCreateVesselView').prop('checked', true);
                    $('#canCreateVesselView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 23) {
                    $('#canModifyVesselView').prop('checked', true);
                    $('#canModifyVesselView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 24) {
                    $('#canDeleteVesselView').prop('checked', true);
                    $('#canDeleteVesselView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 25) {
                    $('#canViewMaintenanceView').prop('checked', true);
                    $('#canViewMaintenanceView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 26) {
                    $('#canCreateMaintenanceView').prop('checked', true);
                    $('#canCreateMaintenanceView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 27) {
                    $('#canModifyMaintenanceView').prop('checked', true);
                    $('#canModifyMaintenanceView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 28) {
                    $('#canDeleteMaintenanceView').prop('checked', true);
                    $('#canDeleteMaintenanceView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 29) {
                    $('#canViewDocumentView').prop('checked', true);
                    $('#canViewDocumentView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 30) {
                    $('#canCreateDocumentView').prop('checked', true);
                    $('#canCreateDocumentView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 31) {
                    $('#canModifyDocumentView').prop('checked', true);
                    $('#canModifyDocumentView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 32) {
                    $('#canDeleteDocumentView').prop('checked', true);
                    $('#canDeleteDocumentView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 33) {
                    $('#canViewSecurityView').prop('checked', true);
                    $('#canViewSecurityView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 34) {
                    $('#canCreateSecurityView').prop('checked', true);
                    $('#canCreateSecurityView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 35) {
                    $('#canModifySecurityView').prop('checked', true);
                    $('#canModifySecurityView').prop('disabled', 'disabled');
                }
                else if (permission.PermissionID == 36) {
                    $('#canDeleteSecurityView').prop('checked', true);
                    $('#canDeleteSecurityView').prop('disabled', 'disabled');
                }

            });
        }).run();

        $('#viewModal .form-control').prop('disabled', true);
    }).run();
});

$(document).on('click', '.edit', function () {
    id = $(this).data('id');
    clearFileds();

    (new http).post("roles.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#nameEdit').val(item.Role);
        $('#descEdit').val(item.Description);

        (new http).post("roles.aspx/findPermissionRole", {
            id: id
        }).then(function (response) {
            var permissions = response.d.map(permission => {
                if (permission.PermissionID == 1) {
                    $('#canViewDashboardEdit').prop('checked', true);
                } else if (permission.PermissionID == 2) {
                    $('#canCreateDashboardEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 3) {
                    $('#canModifyDashboardEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 4) {
                    $('#canDeleteDashboardEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 5) {
                    $('#canViewManningEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 6) {
                    $('#canCreateManningEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 7) {
                    $('#canModifyManningEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 8) {
                    $('#canDeleteManningEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 9) {
                    $('#canViewCrewEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 10) {
                    $('#canCreateCrewEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 11) {
                    $('#canModifyCrewEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 12) {
                    $('#canDeleteCrewEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 13) {
                    $('#canViewBoardEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 14) {
                    $('#canCreateBoardEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 15) {
                    $('#canModifyBoardEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 16) {
                    $('#canDeleteBoardEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 17) {
                    $('#canViewHumanEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 18) {
                    $('#canCreateHumanEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 19) {
                    $('#canModifyHumanEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 20) {
                    $('#canDeleteHumanEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 21) {
                    $('#canViewVesselEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 22) {
                    $('#canCreateVesselEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 23) {
                    $('#canModifyVesselEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 24) {
                    $('#canDeleteVesselEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 25) {
                    $('#canViewMaintenanceEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 26) {
                    $('#canCreateMaintenanceEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 27) {
                    $('#canModifyMaintenanceEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 28) {
                    $('#canDeleteMaintenanceEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 29) {
                    $('#canViewDocumentEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 30) {
                    $('#canCreateDocumentEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 31) {
                    $('#canModifyDocumentEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 32) {
                    $('#canDeleteDocumentEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 33) {
                    $('#canViewSecurityEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 34) {
                    $('#canCreateSecurityEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 35) {
                    $('#canModifySecurityEdit').prop('checked', true);
                }
                else if (permission.PermissionID == 36) {
                    $('#canDeleteSecurityEdit').prop('checked', true);
                }
            });
        }).run();

    }).run();
});

function clearFileds() {
    $('.dashboardEdit').prop('checked', false);
    $('.dashboardEdit').prop('disabled', false);

    $('#viewModal .dashboard').prop('checked', false);
    $('#viewModal .dashboard').prop('disabled', false);
}

$(document).on('click', '#saveChanges', function () {
    if (isInputEditValid()) {
        $(this).attr('disabled', true);

        $('.fa-spin').removeClass('hidden');

        (new http).post("roles.aspx/update", {
            id: id,
            name: $('#nameEdit').val(),
            desc: $('#descEdit').val()
        }).then(function (response) {

            var roleID = id;

            var permissions = $('input.dashboardEdit:checked').map(function () {
                return $(this).val();
            });

            $.each(permissions, function (key, i) {

                (new http).post("roles.aspx/insertPermissions", {
                    permit: i,
                    roleID: roleID
                }).then(function (response) {

                }).run();

                setTimeout(function () {
                    swal('Successfully Updated!', 'Role has been successfully updated.', 'success');
                    $('.close').click();
                    $('.fa-spin').addClass('hidden');
                    window.location.reload();
                }, 10000);
            });

        }).run();
    }

});

$(document).on('click', '.remove', function () {
    id = $(this).data('id');
    var name = $(this).data('name');

    swal({
        title: 'Are you sure you want to deactivate ' + $(this).data('name') + '?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Deactivate!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("userroles.aspx/deactivate", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Deactivated', 'Level Has Been Deactivated!', 'success');
                setTimeout(function () { window.location.reload(); }, 3000);
            }).run();
        }
    })
});

$(document).on('click', '.activate', function () {
    id = $(this).data('id');
    var name = $(this).data('name');

    swal({
        title: 'Are you sure you want to activate ' + name + '?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Activate!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("userroles.aspx/activate", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Activated', 'Level Has Been Activated!', 'success');
                setTimeout(function () { window.location.reload(); }, 3000);
            }).run();
        }
    })
});

function isInputValid() {
    var isNameValid = $("#name").validate(['required']).displayErrorOn($("#errorName"));
    var isDescValid = $("#desc").validate(['required']).displayErrorOn($("#errorDesc"));

    return isNameValid && isDescValid;
}

function isInputEditValid() {
    var isNameValid = $("#nameEdit").validate(['required']).displayErrorOn($("#errorNameEdit"));
    var isDescValid = $("#descEdit").validate(['required']).displayErrorOn($("#errorDescEdit"));

    return isNameValid && isDescValid;
}