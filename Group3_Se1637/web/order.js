let popupTable = document.getElementById("popup-table");
let popupData = [];
window.onload = () => {
    const heads = popupTable.querySelector("thead").querySelectorAll("th");
    let key = [];
    heads.forEach((a) => {
        key = [...key, a.innerText];
    });
    popupTable
            .querySelector("tbody")
            .querySelectorAll("tr")
            .forEach((row) => {
                var obj = {};
                row.querySelectorAll("td").forEach((col, index) => {
                    if (key[index] === "Ảnh sản phẩm") {
                        obj[`${key[index]}`] = col.querySelector("img").src;
                    } else
                        obj[`${key[index]}`] = col.innerText;
                });
                popupData = [...popupData, obj];
            });
    detailTable = document.querySelector(".fixed-table-body");
    if (detailTable.offsetHeight >= 300) {
        detailTable.style.overflowY = "scroll";
    }
};

const handleSearch = (value) => {
    let displayData = [];
    const tableBody = popupTable
            .querySelector("tbody");
    displayData = popupData.filter(
            (data) =>
        data["Mã sản phẩm"]
                .toLowerCase()
                .includes(
                        value
                        .toLowerCase()
                        )
                ||
                data["Tên sản phẩm"]
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

                        ) ||
                data["Loại sản phẩm"]
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
             
              <td>${data["Mã sản phẩm"]}</td>
              <td>${data["Tên sản phẩm"]}</td>
              <td>
                <img src=${data["Ảnh sản phẩm"]} alt=""
                    style="max-width: 80px"/>
              </td>
              <td>${data["Loại sản phẩm"]}</td>
              <td>${data["Số lượng"]}</td> 
              <td>${data["Giá"]}</td>  
              <td>
                <label class="label label-success">Còn hàng</label>
              </td>
                <td>
                                            <input type="checkbox" />
                                        </td>
              
            </tr>`;
    });
};

const search = document.getElementById("search");

search.addEventListener("change", () => {
    handleSearch(search.value);
});

search.addEventListener("keyup", () => {


    handleSearch(search.value);
});

const tableBody = document.querySelector('#detail-table tbody');

// Lặp qua tất cả các hàng trong tbody và tính tổng giá trị của cột "Tổng cộng"
let total = 0;
let list = [];

function getMoneyEach(element) {
    const code = element.querySelector(".detail-code").innerText;
    const price = element.querySelector(".amount2").innerText.replaceAll(" ", "").replaceAll(",", "").replaceAll("đ", "") * 1;
    const quantity = element.querySelector(".quantity").querySelector("input").value * 1;
    const value = price * quantity;
    const string = code + "-" + quantity.toString();
    element.querySelector(".money-each").innerText = value.toLocaleString() + " đ";
    return {value, string};
}

function updateTotal(event) {
    total = 0;
    list = [];
    const row = event.target.parentNode.parentNode;
    const rows = tableBody.querySelectorAll("tr");
    rows.forEach(row => {
        total += getMoneyEach(row).value;
        list = [...list, getMoneyEach(row).string];
    });
    document.querySelector(".money").innerText = total.toLocaleString() + " đ";

    
}


const inputs = document.querySelectorAll('#detail-table tbody input[type="number"]');
inputs.forEach(input => {
    input.addEventListener('change', updateTotal);
    input.addEventListener('keyup', event => {
        if (event.keyCode === 13) {
            event.preventDefault();
            event.target.blur();
        }
    });
});
console.log(list);
function sendData() {
   
    const urlParams = new URLSearchParams(window.location.search);
    const oid = urlParams.get('oid');

   
    $.ajax({
        type: "POST",
        url: "sendorder",
        data: {oid: oid, total: total, list: list},
        success: function () {
            // Xử lý dữ liệu trả về từ servlet (nếu có)
            window.location.replace("manageorder");
        }
    });
}

function sendProduct() {
    // Lấy ra tất cả các checkbox được chọn
    var checkboxes = document.getElementsByName("selectedIds");
    const urlParams = new URLSearchParams(window.location.search);
    const oid = urlParams.get('oid');
    console.log(oid);
    var selectedIds = [];
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selectedIds.push(checkboxes[i].value);
        }
    }

    // Gửi dữ liệu tới servlet bằng AJAX
    $.ajax({
        type: "POST",
        url: "addproductorder",
        data: {selectedIds: JSON.stringify(selectedIds), oid: oid},
        success: function () {
            // Xử lý dữ liệu trả về từ servlet (nếu có)
            window.location.replace("orderdetails?oid=" + oid);
        }
    });
}
