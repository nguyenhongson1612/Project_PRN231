/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function senData2() {
    // Lấy ra tất cả các checkbox được chọn
    var checkboxes = document.getElementsByName("selectedIds");

    var selectedIds = [];
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selectedIds.push(checkboxes[i].value);
        }
    }
    if (selectedIds.length === 0) {
        alert('Vui Lòng Chọn Nhóm Tin!');
        return;
    }
    // Gửi dữ liệu tới servlet bằng AJAX
    $.ajax({
        type: "POST",
        url: "hideselectgroupnews",
        data: {selectedIds: JSON.stringify(selectedIds)},
        success: function () {
            // Xử lý dữ liệu trả về từ servlet (nếu có)
            window.location.replace("managegroupnews");
        }
    });
}
function senSpecials() {
    // Lấy ra tất cả các checkbox được chọn
    var checkboxes = document.getElementsByName("selectedIds");

    var selectedIds = [];
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selectedIds.push(checkboxes[i].value);
        }
    }
    if (selectedIds.length === 0) {
        alert('Vui Lòng Chọn Nhóm Tin!');
        return;
    }
    // Gửi dữ liệu tới servlet bằng AJAX
    $.ajax({
        type: "POST",
        url: "specialselectgroupnews",
        data: {selectedIds: JSON.stringify(selectedIds)},
        success: function () {
            // Xử lý dữ liệu trả về từ servlet (nếu có)
            window.location.replace("managegroupnews");
        }
    });
}
function senDelete2() {
    // Lấy ra tất cả các checkbox được chọn
    var checkboxes = document.getElementsByName("selectedIds");
    var selectedIds = [];
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selectedIds.push(checkboxes[i].value);
        }
    }
    if (selectedIds.length === 0) {
        alert('Vui Lòng Chọn Nhóm Tin!');
        return;
    }
    // Gửi dữ liệu tới servlet bằng AJAX
    $.ajax({
        type: "POST",
        url: "deleteselectgroupnews",
        data: {selectedIds: JSON.stringify(selectedIds)},
        success: function () {
            // Xử lý dữ liệu trả về từ servlet (nếu có)
            window.location.replace("managegroupnews");
        }
    });

}
function selectgnews() {
    var select = document.getElementById("type");
    var option = select.options[select.selectedIndex];
    $.ajax({
        type: "POST",
        url: "selectgnews",
        data: {option: option},
        success: function () {
            // Xử lý dữ liệu trả về từ servlet (nếu có)
            window.location.replace("managegroupnews");
        }
    });

}

