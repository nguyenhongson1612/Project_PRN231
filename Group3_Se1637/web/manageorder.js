/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

let orderTable = document.getElementById("order-table");
let orderData = [];
window.onload = () => {
    const heads = orderTable.querySelector("thead").querySelectorAll("th");
    let key = [];
    heads.forEach((a) => {
        key = [...key, a.innerText];
    });
    orderTable
            .querySelector("tbody")
            .querySelectorAll("tr")
            .forEach((row) => {
                var obj = {};
                row.querySelectorAll("td").forEach((col, index) => {
                    if (key[index] === "Ảnh sản phẩm") {
                        console.log(col.querySelector("img").src)
                        obj[`${key[index]}`] = col.querySelector("img").src;
                    } else
                        obj[`${key[index]}`] = col.innerText;
                });
                orderData = [...orderData, obj];
            });
};

const handleSearch = (value) => {
    let displayData = [];
    const tableBody = orderTable
            .querySelector("tbody");
    displayData = orderData.filter(
            (data) =>
        data["Mã đơn hàng"]
                .toLowerCase()
                .includes(
                        value
                        .toLowerCase()
                        )
                ||
                data["Người đặt cọc"]
                .toLowerCase()
                .normalize("NFD")
                .replace(/[\u0300-\u036f]/g, "")
                .replace(/đ/g, "d")
                .replace(/Đ/g, "D")

                .includes(
                        value
                        .toLowerCase()
                        .normalize("NFD")
                        .replace(/[\u0300-\u036f]/g, "")
                        .replace(/đ/g, "d")
                        .replace(/Đ/g, "D")

                        )
    );
    tableBody.innerHTML = "";
    displayData.forEach((data) => {

        tableBody.innerHTML += `<tr>
              <td>${data["ID"]}</td>
              <td>${data["Mã đơn hàng"]}</td>
              <td>${data["Người đặt cọc"]}</td>
              <td>${data["Địa chỉ"]}</td>
              <td>${data["Ngày đặt cọc"]}</td> 
              <td>${data["Số sản phẩm"]}</td>  
              <td>${data["Tổng tiền"]}</td>  
              <td>
              ${data["Trạng thái"] === "Chưa thanh toán" ? `<label class="label label-danger">Chưa thanh toán</label>` : `<label class="label label-success">Đã thanh toán</label>`}    
              </td>
              <td>
                                            <a class="btn btn-primary" href="orderdetails?oid=${data["ID"]}"><i class="glyphicon glyphicon-pencil"></i></a>
                                            <button class="btn btn-danger">
                                                <i class="glyphicon glyphicon-eye-open"></i>
                                            </button>
                                        </td>
            </tr>`;
    });
};

const search = document.getElementById("search");

search.addEventListener("change", () => {
    handleSearch(search.value);
});

search.addEventListener("keyup", () => {
    console.log("seach");

    handleSearch(search.value);
});

