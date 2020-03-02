var date;
var month;
var d;
var day;
var time = "";
var currentDay = "";
var action = "";
var timein;
var currentMilitaryTime;
var shouldTimeIn;
var shouldTimeOut;
var holidayID = 0;
var today = "";
var timefornosched = "";

$(document).ready(function () {
    date_time($('#date_time'));
    getAnnouncementForToday();
    getAnnouncements();
});

function date_time(id) {
    date = new Date;

    year = date.getFullYear();
    month = date.getMonth();
    months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'Jully', 'August', 'September', 'October', 'November', 'December');

    d = date.getDate();
    day = date.getDay();

    days = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

    h = date.getHours();

    if (h < 10) {
        h = "0" + h;
    }

    m = date.getMinutes();

    if (m < 10) {
        m = "0" + m;
    }

    s = date.getSeconds();

    if (s < 10) {
        s = "0" + s;
    }

    result = '' + days[day] + ' ' + months[month] + ' ' + d + ' ' + year + ' ' + h + ':' + m + ':' + s;

    $('#date_time').text(result);

    setTimeout('date_time("' + id + '");', '1000');

    currentDay = days[day];

    time = h + ':' + m + ':' + s;

    currentMilitaryTime = time;

    var t = convertMilitary(time);

    time = t;

    timefornosched = t;

    return true;
}

function convertMilitary(military) {

    military = military.split(':'); // convert to array

    // fetch
    var hours = Number(military[0]);
    var minutes = Number(military[1]);
    var seconds = Number(military[2]);

    // calculate
    var timeValue;

    if (hours > 0 && hours <= 12) {
        timeValue = "" + hours;
    } else if (hours > 12) {
        timeValue = "" + (hours - 12);
    } else if (hours == 0) {
        timeValue = "12";
    }

    timeValue += (minutes < 10) ? ":0" + minutes : ":" + minutes;  // get minutes
    timeValue += (seconds < 10) ? ":0" + seconds : ":" + seconds;  // get seconds
    timeValue += (hours >= 12) ? " P.M." : " A.M.";  // get AM/PM

    return timeValue;
}

function checkTimeStatus() {
    (new http).post("dashboard.aspx/check", {
        year: year,
        month: month + 1,
        day: d
    }).then(function (response) {

        if (response.d.length != 0) {
            var item = response.d[0];

            if (item.Action == 'Time In') {
                $('#timeOut').show();
                $('#timeIn').hide();

                m = response.d[0].Time.split(' ')[1];

                if (m == "P.M.") {
                    h = parseInt(response.d[0].Time.split(' ')[0].split(':')[0]);

                    if (h != 12) {
                        h = h + 12;
                    }

                    time = h + ":" + response.d[0].Time.split(' ')[0].split(':')[1];

                } else if (m == "A.M.") {
                    h = parseInt(response.d[0].Time.split(' ')[0].split(':')[0]);
                    time = h + ":" + response.d[0].Time.split(' ')[0].split(':')[1];
                }

                timein = time + ':00';

                action = "Time Out";
            } else {
                $('#timeOut').hide();
                $('#timeIn').show();
                action = "Time In";
            }
        } else {
            $('#timeOut').hide();
            $('#timeIn').show();
            action = "Time In";
        }
    }).run();
}

function checkTimeIn() {
    (new http).post("dashboard.aspx/checkTimeIn", {
        dayID: day
    }).then(function (response) {

        if (response.d.length != 0) {
            time = response.d[0].Time.split(' ')[0];
            m = response.d[0].Time.split(' ')[3];

            if (m == "PM") {
                h = parseInt(response.d[0].Time.split(' ')[0].split(':')[0]) + 12;
                time = h + ":" + response.d[0].Time.split(' ')[2].split(':')[1];
            } else if (m == "AM") {
                h = parseInt(response.d[0].Time.split(' ')[0].split(':')[0]);
                time = h + ":" + response.d[0].Time.split(' ')[2].split(':')[1];
            }

            shouldTimeIn = time + ':00';

        } else {
            shouldTimeIn = timefornosched.split(' ')[0];
        }
    }).run();
}

function checkTimeOut() {
    (new http).post("dashboard.aspx/checkTimeOut", {
        dayID: day
    }).then(function (response) {

        if (response.d.length != 0) {
            time = response.d[0].Time.split(' ')[2];

            m = response.d[0].Time.split(' ')[3];

            if (m == "PM") {
                h = parseInt(response.d[0].Time.split(' ')[2].split(':')[0]) + 12;
                time = h + ":" + response.d[0].Time.split(' ')[2].split(':')[1];
            } else if (m == "AM") {
                h = parseInt(response.d[0].Time.split(' ')[2].split(':')[0]);
                time = h + ":" + response.d[0].Time.split(' ')[2].split(':')[1];
            }

            shouldTimeOut = time + ':00';
        } else {
            //ask for overtime form
            shouldTimeOut = time.split(' ')[0].trim();
        }

    }).run();
}

function isHolidayToday() {

    today = year + '-' + parseInt(month + 1) + '-' + d;

    (new http).post("dashboard.aspx/checkHoliday", {
        date: today
    }).then(function (response) {

        if (response.d.length != 0) {
            holidayID = response.d[0].HolidayID;
        }

    }).run();
}

function getTotalHours(timein, timeout) {
    var start = timein;
    var end = timeout;

    s = start.split(':');
    e = end.split(':');

    min = e[1] - s[1];

    hour_carry = 0;

    if (min < 0) {
        min += 60;
        hour_carry += 1;
    }

    hour = e[0] - s[0] - hour_carry;

    min = ((min / 60) * 100).toString();

    diff = hour;

    val = [];

    return diff;
}

$(document).on('click', '#timeIn', function () {

    var totalHour = getTotalHours(currentMilitaryTime, shouldTimeIn);

    console.log(totalHour);

    var grace = 0;

    var nTime;

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (pos) {

            (new http).post("graceperiods.aspx/findLate", {
                hour: Math.round(Math.abs(totalHour))
            }).then(function (response) {
                var item = response.d[0];

                if (response.d.length != 0) {
                    grace = item.DeductedHours;

                    var taym = time.split(':');

                    var newTime = parseInt(taym[0]) + parseInt(grace);

                    nTime = newTime + ':' + taym[1] + ':' + taym[2]

                    if (newTime > 12) {
                        convertedTime = convertMilitary(nTime.split(' ')[0]);

                        nTime = convertedTime;
                    }

                    var status = "";

                    if (totalHour > 0 && totalHour < 2) {
                        status = "";
                    } else {
                        status = "Late";
                    }

                    (new http).post("dashboard.aspx/insert", {
                        time: nTime,
                        action: action,
                        image: '',
                        longitude: pos.coords.longitude,
                        latitude: pos.coords.latitude,
                        year: year,
                        month: month + 1,
                        day: d,
                        totalHour: 0,
                        status: status,
                        ot: 0
                    }).then(function (response) {
                        checkTimeStatus();
                    }).run();

                    if (holidayID != 0) {
                        insertHoliday(holidayID, today);
                    }

                } else {
                    grace = 0;

                    var taym = time.split(':');

                    var newTime = parseInt(taym[0]) + parseInt(grace);

                    nTime = newTime + ':' + taym[1] + ':' + taym[2];

                    var status = "";

                    if (totalHour > 0 && totalHour < 2) {
                        status = "";
                    } else {
                        status = "Late";
                    }

                    (new http).post("dashboard.aspx/insert", {
                        time: nTime,
                        action: action,
                        image: '',
                        longitude: pos.coords.longitude,
                        latitude: pos.coords.latitude,
                        year: year,
                        month: month + 1,
                        day: d,
                        totalHour: 0,
                        status: status,
                        ot: 0
                    }).then(function (response) {
                        checkTimeStatus();
                    }).run();

                    if (holidayID != 0) {
                        insertHoliday(holidayID, today);
                    }
                }
            }).run();

        });
    } else {
        alert('error');
    }
});

function insertHoliday(hID, t) {
    (new http).post("dashboard.aspx/insertHoliday", {
        holidayID: hID,
        today: t
    }).then(function (response) {

    }).run();
}

$(document).on('click', '#timeOut', function () {

    var totalHour = getTotalHours(timein, currentMilitaryTime);

    var ot = getTotalHours(shouldTimeOut, currentMilitaryTime);

    var status = "";

    if (ot > 0) {
        status = "Overtime";
    } else {
        status = "";
    }

    if (navigator.geolocation)
        navigator.geolocation.getCurrentPosition(function (pos) {

            (new http).post("dashboard.aspx/insert", {
                time: time,
                action: action,
                image: '',
                longitude: pos.coords.longitude,
                latitude: pos.coords.latitude,
                year: year,
                month: month + 1,
                day: d,
                totalHour: totalHour,
                status: status,
                ot: ot
            }).then(function (response) {
                checkTimeStatus();
            }).run();

        });
});

function getAnnouncementForToday() {

    (new http).post("announcements.aspx/getAnnouncementForToday", {

    }).then(function (response) {

        var items = response.d.map(item => {
            $('#subject').text(item.Announcement);
            $('#created').text(item.Firstname + " " + item.Lastname + " on " + item.DateCreated);
            $('#content').html(item.Content);
            $('#attachView').attr('href', '/content/attachments/' + item.Attachment);

            if (item.Attachment != '') {
                $('#attachView').text(item.Attachment);
            } else {
                $('#attachView').text('No Attachment Found!');
            }
        });
    }).run();
}

$(document).on('click', '.select-memo', function () {
    var id = $(this).data('id');

    (new http).post("announcements.aspx/find", {
        id: id
    }).then(function (response) {

        var items = response.d.map(item => {
            $('#subject').text(item.Announcement);
            $('#created').text(item.Firstname + " " + item.Lastname + " on " + item.DateCreated);
            $('#content').html(item.Content);
            $('#attachView').attr('href', 'Content/attachments/' + item.Attachment);

            if (item.Attachment != '') {
                $('#attachView').text(item.Attachment);
            } else {
                $('#attachView').text('No Attachment Found!');
            }
        });
    }).run();
});

function getAnnouncements() {
    (new http).post("announcements.aspx/get", {

    }).then(function (response) {

        var items = response.d.map(item => {
            $('#announcements').append('<li>' +
                '<a role="button" class="select-memo" data-id="' + item.AnnouncementID + '">' + item.Announcement + '</a>' +
                '<br/>' +
                '<span class="text-muted">' + item.DateCreated + '</span>' +
                '</li>');
        });
    }).run();
}

function getBirthdays() {
    (new http).post("dashboard.aspx/getBirthdays", {
        date: "-" + (month + 1).toString() + '-'
    }).then(function (response) {

        if (response.d.length != 0) {
            var items = response.d.map(item => {
                $('#celebrations').append('<li class="col-md-12">' +
                    '<div class="col-md-2">' +
                    '<img class="img-responsive img-circle" src="Content/img/' + item.ImagePath + '" />' +
                    '</div>' +
                    '<div class="col-md-10">' +
                    '<p><b>' + item.Firstname + ' ' + item.Lastname + '</b>' +
                    ' will celebrate his/her birthday on the ' + item.Birthday.split('-')[2] + 'th day of this month. <i class="fa fa-birthday-cake text-danger"></i></p>' +
                    '</div>' +
                    '</li>');
            });
        } else {

        }
    }).run();
}

function getWorkAnnivs() {
    (new http).post("dashboard.aspx/getWorkAnniv", {
        date: (month + 1).toString() + '-'
    }).then(function (response) {

        if (response.d.length != 0) {
            var items = response.d.map(item => {
                $('#celebrations').append('<li class="col-md-12">' +
                    '<div class="col-md-2">' +
                    '<img class="img-responsive img-circle" src="Content/img/' + item.ImagePath + '" />' +
                    '</div>' +
                    '<div class="col-md-10">' +
                    '<p><b>' + item.Firstname + ' ' + item.Lastname + '</b>\'s ' +
                    'work anniversary on the ' + item.Birthday.split('-')[2] + 'th day of this month. <i class="fa fa-cutlery text-danger"></i></p>' +
                    '</div>' +
                    '</li>');
            });
        } else {

        }

        if ($('#celebrations').text().trim() == '') {
            $('#celebrations').append('<h3 class="text-danger">No Celebrants Today</h3>');
        }
    }).run();
}

function analytics() {
    (new http).post("dashboard.aspx/countEmployees", {
    }).then(function (response) {

        if (response.d.length != 0) {
            $('#totalEmployees').text(response.d);
        } else {

        }
    }).run();

    (new http).post("dashboard.aspx/countApplicants", {
    }).then(function (response) {

        if (response.d.length != 0) {
            $('#totalApplicants').text(response.d);
        } else {

        }
    }).run();

    (new http).post("dashboard.aspx/countDepartments", {
    }).then(function (response) {

        if (response.d.length != 0) {
            $('#totalDepts').text(response.d);
        } else {

        }
    }).run();

    (new http).post("dashboard.aspx/countBranches", {
    }).then(function (response) {

        if (response.d.length != 0) {
            $('#totalBranches').text(response.d);
        } else {

        }
    }).run();
}

function getEvents() {
    var calendar = $("#calendar").fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay,listWeek'
        },
        navLinks: true,
        editable: true,
        eventLimit: true,
        events: function (start, end, timezone, callback) {
            var events = [];

            $.ajax({
                type: "POST",
                url: "announcements.aspx/get",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: {}, success: function (response) {
                    if (response != null) {
                        var items = response.d.map(i => {
                            events.push({
                                title: i.Announcement,
                                start: i.Date.split(' ')[0].split('/').reverse().join('-'),
                                end: i.Date.split(' ')[0].split('/').reverse().join('-')
                            });
                        });
                    }

                    callback(events);
                }
            });
        },  // request to load current events
        eventRender: function (event, eventElement) {
            if (event.Announcement != "") {
                eventElement.css('background-color', 'green');
                eventElement.find("a.fc-content").css('background-color', 'green');
            }
        },
    });
}

function getPresent() {

    (new http).post("dashboard.aspx/getPresent", {
        date: today
    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {
                var isActive = item.Date == "" ? "Absent" : "Present";

                var html = "<tr>" +
                    "<td>" + item.UserID + "</td>" +
                    "<td>" + item.Lastname + ', ' + item.Firstname + "</td>" +
                    "<td>" + isActive + "</td>";

                $('#tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            $('.loading').remove();
            $('#myTable').DataTable();
        });
    }).run();
}

function getAbsent() {

    $('#tbody').text('');

    $('#tbody').append("<tr class=\"loading\"><td colspan=\"4\"><img src=\"content/img/load1.gif\" /></td></tr>");

    (new http).post("dashboard.aspx/getAbsent", {}).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {
                var isActive = item.Date == "" ? "Absent" : "Present";

                var html = "<tr>" +
                    "<td>" + item.EmployeeID + "</td>" +
                    "<td>" + item.Lastname + ', ' + item.Firstname + "</td>" +
                    "<td>" + isActive + "</td>";

                $('#tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            getPresent();
        });
    }).run();
}

function checkDuration() {
    (new http).post("dashboard.aspx/getDuration", {}).then(function (response) {
        var item = response.d[0];

        var duration = parseInt(item.Age);

        (new http).post("dashboard.aspx/leaveStatuses", {
            duration: duration
        }).then(function (response) {
            var items = response.d.map(item => {
                return new Promise(function (resolve, reject) {
                    var html = "<tr>" +
                        "<td>" + item.Leave + "</td>" +
                        "<td>" + item.Type + "</td>" +
                        "<td>" + item.Days + "</td>";

                    $('#tbodyLeave').append(html);
                    resolve();
                });
            });
        }).run();
    }).run();
}