/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function senData() {
    // Lấy ra tất cả các checkbox được chọn
    var checkboxes = document.getElementsByName("selectedIds");

    var selectedIds = [];
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selectedIds.push(checkboxes[i].value);
        }
    }
    if (selectedIds.length === 0) {
        alert('Vui Lòng Chọn Bài Viết!');
        return;
    }
    // Gửi dữ liệu tới servlet bằng AJAX
    $.ajax({
        type: "POST",
        url: "hideselectnews",
        data: {selectedIds: JSON.stringify(selectedIds)},
        success: function () {
            // Xử lý dữ liệu trả về từ servlet (nếu có)
            window.location.replace("managenews");
        }
    });
}

function senDelete() {
    // Lấy ra tất cả các checkbox được chọn
    var checkboxes = document.getElementsByName("selectedIds");
    var selectedIds = [];
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selectedIds.push(checkboxes[i].value);
        }
    }
    if (selectedIds.length === 0) {
        alert('Vui Lòng Chọn Bài Viết!');
        return;
    }
    // Gửi dữ liệu tới servlet bằng AJAX
    $.ajax({
        type: "POST",
        url: "deleteselectnews",
        data: {selectedIds: JSON.stringify(selectedIds)},
        success: function () {
            // Xử lý dữ liệu trả về từ servlet (nếu có)
            window.location.replace("managenews");
        }
    });

}


var selectElement = document.getElementById('type');

selectElement.addEventListener('change', (event) => {
    var selectedValue = event.target.value;

    // Tạo một đối tượng XMLHttpRequest
    var xhr = new XMLHttpRequest();

    // Xác định phương thức POST hoặc GET
    var method = 'GET';

    // Xác định URL và tham số truy vấn
    if (selectedValue === '0') {
        var url = `managenews?gid=0`;
    } else {
        var url = `managenews?gid=${selectedValue}`;
    }




    // Mở kết nối
    xhr.open(method, url);

    // Gửi yêu cầu
    xhr.send();

    // Chuyển hướng đến URL tương ứng
    window.location.href = url;
    
    getData();
});


let data = [];
const dataTable = document
        .querySelector("table");
let key = [];

const getData = () => {
    dataTable
            .querySelector("tbody")
            .querySelectorAll("tr")
            .forEach((row) => {
                var obj = {};
                row.querySelectorAll("td").forEach((col, index) => {
                    if (key[index] === "Hành động") {
                        if (col.querySelector(".glyphicon-eye-open")) {
                            obj[`${key[index]}`] = "open";
                        } else {
                            obj[`${key[index]}`] = "close";
                        }
                    } else if (key[index] === "Ảnh đại diện") {
                        obj[`${key[index]}`] = col.querySelector("img").src;
                    } else
                        obj[`${key[index]}`] = col.innerText;
                });
                data = [...data, obj];
            });
}


window.onload = () => {
    const heads = dataTable.querySelector("thead").querySelectorAll("th");
    heads.forEach((a) => {
        key = [...key, a.innerText];
    });
    getData();
};

const handleSearch = (value) => {
    let displayData = [];
    const tableBody = document
            .querySelector("tbody");
    displayData = data.filter(
            (product) => {
        return product["Tiêu đề"].toLowerCase()
                .normalize("NFD")
                .replace(/[\u0300-\u036f]/g, "")
                .replace(/đ/g, "d")
                .replace(/Đ/g, "D")
                .includes(value.toLowerCase()
                        .normalize("NFD")
                        .replace(/[\u0300-\u036f]/g, "")
                        .replace(/đ/g, "d")
                        .replace(/Đ/g, "D")) || 
                product["ID"].toLowerCase()
                .includes(value.toLowerCase()
                        ) || 
                        product["Ngày tạo"].replaceAll('/', '').replaceAll('-', '')
                .includes(value.replaceAll('/', '').replaceAll('-', ''));
    }
    );
    tableBody.innerHTML = "";
    displayData.forEach((data) => {
        tableBody.innerHTML += `<tr>
              <td style="">${data["ID"]}</td>
              <td style="">${data["Tiêu đề"]}</td>
              <td style="text-align: center"><img width="130" height="130" src=${data["Ảnh đại diện"]} /></td>
              <td style="">${data["Danh mục"]}</td>  
              ${data["Trạng Thái"] === "Đã Đăng" ? `<td><span class="label label-success">${data["Trạng Thái"]}</span></td>` : `<td><span class="label label-danger">${data["Trạng Thái"]}</span></td>`}
      <td style="">${data["Người tạo"]}</td>  
              <td style="">${data["Ngày tạo"]}</td>         

      <td class="form-group">
                <a  
                  href="editinforcus?cid=${data["ID"]}"
                  class="btn btn-primary"
                  ><i class="glyphicon glyphicon-pencil"></i
                ></a>
        <a href="#" onclick="doDelete(${data["ID"]})" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
        ${data["Hành động"] === "open" ? `<a href="#" onclick="doHide2(${data["ID"]})" class="btn btn-danger"><i class="glyphicon glyphicon-eye-open"></i></a>` : `<a href="#" onclick="doHide2(${data["ID"]})" class="btn btn-danger"><i class="glyphicon glyphicon-eye-close"></i></a>`}
            
        </td>
        <td>
       
            </tr>`;

    });
};



const search = document.getElementById("search-product")
search.addEventListener("change", () => {
    handleSearch(search.value);
});

search.addEventListener("keyup", () => {
    handleSearch(search.value);
});
