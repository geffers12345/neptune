$(document).ready(function () {
    if (!permissionForUserDashboard.viewDashboard) {
        $('.sidebar-link-dashboard').remove();
        $('.div-dashboard .content').text('');
        $('.div-dashboard .content').append("<div class=\"error-page\"><h3>You do not have the permission to view this page!</h3></div>");
    }

    if (!permissionForUserManning.viewManning) {
        $('.sidebar-link-manning').remove();
        $('.div-manning .content').text('');
        $('.div-manning .content').append("<div class=\"error-page\"><h3>You do not have the permission to view this page!</h3></div>");
    }

    if (!permissionForCrew.viewCrew) {
        $('.sidebar-link-crew').remove();
        $('.div-crew .content').text('');
        $('.div-crew .content').append("<div class=\"error-page\"><h3>You do not have the permission to view this page!</h3></div>");
    }

    if (!permissionBoard.viewBoard) {
        $('.sidebar-link-board').remove();
        $('.div-board .content').text('');
        $('.div-board .content').append("<div class=\"error-page\"><h3>You do not have the permission to view this page!</h3></div>");
    }

    if (!permissionVessel.viewVessel) {
        $('.sidebar-link-vessel').remove();
        $('.div-vessel .content').text('');
        $('.div-vessel .content').append("<div class=\"error-page\"><h3>You do not have the permission to view this page!</h3></div>");
    }

    if (!permissionMaintenance.viewMaintenance) {
        $('.sidebar-link-maintenance').remove();
        $('.div-maintenance .content').text('');
        $('.div-maintenance .content').append("<div class=\"error-page\"><h3>You do not have the permission to view this page!</h3></div>");
    }

    if (!permissionDocument.viewDocument) {
        $('.sidebar-link-documents').remove();
        $('.div-documents .content').text('');
        $('.div-documents .content').append("<div class=\"error-page\"><h3>You do not have the permission to view this page!</h3></div>");
    }

    if (!permissionSecurity.viewSecurity) {
        $('.sidebar-link-security').remove();
        $('.div-security .content').text('');
        $('.div-security .content').append("<div class=\"error-page\"><h3>You do not have the permission to view this page!</h3></div>");
    }

    //if (!permissionLeave.viewLeave) {
    //    $('.li-leave').remove();
    //    $('.div-leave .content').text('');
    //    $('.div-leave .content').append("<div class=\"error-page\"><h3>You do not have the permission to view this page!</h3></div>");
    //}
});

function getActionPermissions() {
    if (!permissionForUserAdmin.editAdmin) {
        $('.div-admin #save').remove();
        $('.div-admin .fa-edit').remove();
    }

    if (!permissionForUserAdmin.createAdmin) {
        $('.div-admin #save').remove();
        $('.div-admin .btn-add').remove();
    }

    if (!permissionForUserAdmin.removeAdmin) {
        $('.div-admin #save').remove();
        $('.div-admin .activate').remove();
        $('.div-admin .remove').remove();
    }
}

function getActionPermissionsEmployees() {
    if (!permissionForUserEmployee.editEmployee) {
        $('.div-employee #save').remove();
        $('.div-employee .fa-edit').remove();
        $('#content3 #evaluate').remove();
    }

    if (!permissionForUserEmployee.createEmployee) {
        $('.div-employee #save').remove();
        $('.div-employee .btn-add').remove();
        $('#content3 #evaluate').remove();
    }

    if (!permissionForUserEmployee.removeEmployee) {
        $('.div-employee #save').remove();
        $('.div-employee .activate').remove();
        $('.div-employee .remove').remove();
    }
}

function getActionPermissionsRecruit() {
    if (!permissionRecruit.editRecruit) {
        $('.div-recruit #save').remove();
        $('.div-recruit .fa-edit').remove();
        $('.div-recruit .fa-handshake-o').remove();
    }

    if (!permissionRecruit.createRecruit) {
        $('.div-recruit #save').remove();
        $('.div-recruit .btn-add').remove();
    }

    if (!permissionRecruit.removeRecruit) {
        $('.div-recruit #save').remove();
        $('.div-recruit .activate').remove();
        $('.div-recruit .remove').remove();
    }
}

function getActionPermissionsFinance() {
    if (!permissionFinance.editFinance) {
        $('.div-finance #save').remove();
        $('.div-finance .fa-edit').remove();
        $('.div-finance .approve').remove();
        $('.div-finance .disapprove').remove();
        $('.div-finance .liquidate').remove();
        $('#content5 #addEarning').remove();
        $('#content5 #addDeduction').remove();
        $('#content5 #saveNetSalary').remove();
    }

    if (!permissionFinance.createFinance) {
        $('.div-finance #save').remove();
        $('.div-finance .btn-add').remove();
        $('.div-finance .approve').remove();
        $('.div-finance .disapprove').remove();
        $('.div-finance .liquidate').remove();
        $('#content5 #addEarning').remove();
        $('#content5 #addDeduction').remove();
        $('#content5 #saveNetSalary').remove();
    }

    if (!permissionFinance.removeFinance) {
        $('.div-finance #save').remove();
        $('.div-finance .activate').remove();
        $('.div-finance .remove').remove();
    }
}

function getActionPermissionsBenefit() {
    if (!permissionBenefit.editBenefit) {
        $('.div-benefit #save').remove();
        $('.div-benefit .fa-edit').remove();
        $('.div-benefit .approve').remove();
        $('.div-benefit .disapprove').remove();
        $('.div-benefit .liquidate').remove();
    }

    if (!permissionBenefit.createBenefit) {
        $('.div-benefit #save').remove();
        $('.div-benefit .btn-add').remove();
        $('.div-benefit .approve').remove();
        $('.div-benefit .disapprove').remove();
        $('.div-benefit .liquidate').remove();
    }

    if (!permissionBenefit.removeBenefit) {
        $('.div-benefit #save').remove();
        $('.div-benefit .activate').remove();
        $('.div-benefit .remove').remove();
    }
}

function getActionPermissionsQualify() {
    if (!permissionQualify.editQualify) {
        $('.div-qualify #save').remove();
        $('.div-qualify .fa-edit').remove();
    }

    if (!permissionQualify.createQualify) {
        $('.div-qualify #save').remove();
        $('.div-qualify .btn-add').remove();
    }

    if (!permissionQualify.removeQualify) {
        $('.div-qualify #save').remove();
        $('.div-qualify .activate').remove();
        $('.div-qualify .remove').remove();
    }
}

function getActionPermissionsReport() {
    if (!permissionReport.editReport) {
        $('.div-report #save').remove();
        $('.div-report .fa-edit').remove();
    }

    if (!permissionReport.createReport) {
        $('.div-report #save').remove();
        $('.div-report .btn-add').remove();
    }

    if (!permissionReport.removeReport) {
        $('.div-report #save').remove();
        $('.div-report .activate').remove();
        $('.div-report .remove').remove();
    }
}


function getActionPermissionsLeave() {
    if (!permissionLeave.editLeave) {
        $('.div-leave #save').remove();
        $('.div-leave .approve').remove();
        $('.div-leave .disapprove').remove();
    }

    if (!permissionLeave.createLeave) {
        $('.div-leave #save').remove();
        $('.div-leave .btn-add').remove();
    }

    if (!permissionLeave.removeLeave) {
        $('.div-leave #save').remove();
        $('.div-leave .activate').remove();
        $('.div-leave .remove').remove();
    }
}

function getActionPermissionsAsk() {
    if (!permissionAsk.editAsk) {
        $('.div-ask #save').remove();
        $('.div-ask .fa-edit').remove();
    }

    if (!permissionAsk.createAsk) {
        $('.div-ask #save').remove();
        $('.div-ask .btn-add').remove();
    }

    if (!permissionAsk.removeAsk) {
        $('.div-ask #save').remove();
        $('.div-ask .activate').remove();
        $('.div-ask .remove').remove();
    }
}

function getActionPermissionsTask() {
    if (!permissionTask.editTask) {
        $('.div-task #save').remove();
        $('.div-task .fa-edit').remove();
        $('.div-task .threads').remove();
    }

    if (!permissionTask.createTask) {
        $('.div-task #save').remove();
        $('.div-task .btn-add').remove();
    }

    if (!permissionTask.removeTask) {
        $('.div-task #save').remove();
        $('.div-task .activate').remove();
        $('.div-task .remove').remove();
    }
}

function getActionPermissionsLog() {
    if (!permissionLog.editLog) {
        $('.div-log #generateExcel').remove();
    }
}

function getActionPermissionsRole() {
    if (!permissionRole.editRole) {
        $('.div-role #save').remove();
        $('.div-role .fa-edit').remove();
    }

    if (!permissionRole.createRole) {
        $('.div-role #save').remove();
        $('.div-role .btn-add').remove();
    }

    if (!permissionRole.removeRole) {
        $('.div-role #save').remove();
        $('.div-role .activate').remove();
        $('.div-role .remove').remove();
    }
}

function getActionPermissionsFile() {
    if (!permissionFile.createFile) {
        $('.div-file #saveFolder').remove();
        $('.div-file #saveFile').remove();
        $('.div-file .btn-add').remove();
    }

    if (!permissionFile.removeFile) {
        $('.div-file .remove').remove();
    }

    if (!permissionFile.editFile) {
        $('.div-file .edit').remove();
    }
}