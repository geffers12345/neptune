$(document).ready(function () {
    licenses();
    principals();
    flags();
    documents();
    seminars();
    centers();
    medicals();
    clinics();
    vaccines();
    vessel_types();
    all_vessels();
    agents();
    travelDocx();
});

function licenses() {
    (new http).post("licenses.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#license').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#flag-license').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function principals() {
    (new http).post("principals.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#principal').append("<option value=\"" + item.ID + "\">" + item.Principal + "</option>");
        });
    }).run();
}

function flags() {
    (new http).post("flags.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#flag').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function documents() {
    (new http).post("documents.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#document').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
            $('#document-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function seminars() {
    (new http).post("seminars.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#training-course, #seminars, #training-course-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function centers() {
    (new http).post("centers.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#center, #centers, #center-edit').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function medicals() {
    (new http).post("medicals.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#medical').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function clinics() {
    (new http).post("clinics.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#clinic, #incident-clinic').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function vaccines() {
    (new http).post("vaccines.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#vaccine').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function vessel_types() {
    (new http).post("vessels.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#work-vessel-type').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function all_vessels() {
    (new http).post("_vessels.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#vessel').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function agents() {
    (new http).post("agents.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#guarantee-agent').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}

function travelDocx() {
    (new http).post("travels.aspx/get", {
    }).then(function (response) {
        var items = response.d.map(item => {
            $('#travel-docx').append("<option value=\"" + item.ID + "\">" + item.Name + "</option>");
        });
    }).run();
}