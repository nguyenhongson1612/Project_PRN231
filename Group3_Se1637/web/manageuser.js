
let adminData = [];
const adminTable = document
        .querySelector("table")

window.onload = () => {
    const heads = adminTable.querySelector("thead").querySelectorAll("th");
    let key = [];
    heads.forEach((a) => {
        key = [...key, a.innerText];
    });
    adminTable
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
                    } else
                        obj[`${key[index]}`] = col.innerText;
                });
                adminData = [...adminData, obj];
            });
};

const search = document.getElementById("search-user");

const handleSearch = (value) => {
    let displayData = [];
    const tableBody = document
            .querySelector("tbody");
    displayData = adminData.filter(
            (data) =>
        data["Họ & Tên"]
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
                data["Tên đăng nhập"]
                .toLowerCase()
                .includes(
                        value
                        .toLowerCase()
                        )
                ||
                data["Địa chỉ"]
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
                data["Số điện thoại"].includes(value)


    );
    tableBody.innerHTML = "";
    console.log(displayData)
    displayData.forEach((data) => {
        tableBody.innerHTML += `<tr>
              <td style="">${data["ID"]}</td>
              <td style="">${data["Tên đăng nhập"]}</td>
              <td style="">${data["Họ & Tên"]}</td>
              <td style="">${data["Số điện thoại"]}</td>
              <td style="">${data["Email"]}</td>
                <td style="">${data["Địa chỉ"]}</td>   
              <td><span class="label label-danger">${data["Quyền"]}</span></td>
              <td><span class="label ${
                data["Trạng thái"] === "Hoạt động" ? "label-success" : `${
                data["Trạng thái"] === "Chưa kích hoạt" ? "label-warning" : "label-danger"
                }`}">${data["Trạng thái"]}</span></td>
                ${data["Hành động"] ? `<td class="form-group">
                <a
                  href="editinforuser?cid=${data["ID"]}"
                  class="btn btn-primary"
                  ><i class="glyphicon glyphicon-pencil"></i
                ></a>
                <a href="${data["Hành động"] === "open" ? `unbanuser?cid=${data["ID"]}` : `banuser?cid=${data["ID"]}` }" class="btn btn-danger"
                  >
            ${data["Hành động"] === "open" ? `<i class="glyphicon glyphicon-eye-open"></i>` : `<i class="glyphicon glyphicon-eye-close"></i>`}
</a>
              </td>` : ''}
              
            </tr>`;
    });
};

search.addEventListener("change", () => {
    handleSearch(search.value);
});

search.addEventListener("keyup", () => {
    handleSearch(search.value);
});