/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//const validImageTypes = ['image/gif', 'image/jpeg', 'image/png']

const avtContainer = document.getElementById("avt-container");
const error = document.getElementById("error");
const label = document.getElementById('avt-label');
const closeBtn = document.getElementById('avt-close-btn');

const htmlString = `<div id ="avt-upload" class = "d-flex align-items-center">
                                    <label  class ="p-2 mb-3 bg-blue text-white border rounded-2" for="upload-photo">Chon file</label>
                                    <input type="file" name="img" id="upload-photo" onchange = "onChange()"/>
                                </div>`
let filenameBase64;
function onChange() {
    console.log("change")
    const reader = new FileReader();
    reader.readAsDataURL(document.getElementById('upload-photo').files[0]);

    reader.onload = () => {
        filenameBase64 = reader.result;

    };

    let filename = URL.createObjectURL(document.getElementById('upload-photo').files[0]); //will store file name with src
    let newImage = document.createElement("img");
    newImage.setAttribute("src", filename); //setting attribute src of newly created "img" element to "filename"
    newImage.setAttribute("alt", filenameBase64)
    avtContainer.appendChild(newImage);
    closeBtn.classList.remove('d-none');
    document.getElementById('avt-upload').remove();
}
;

closeBtn.addEventListener("click", () => {
    avtContainer.querySelector('img').remove();
    avtContainer.insertAdjacentHTML('beforeend', htmlString);
    closeBtn.classList.add('d-none');
    input = document.getElementById("upload-photo");
})

const selectElement = document.getElementById('news-type');
const addButton = document.getElementById('add-btn');
const addTextElement = document.getElementById('add-text');

// Thêm sự kiện nhấp chuột vào nút add-btn
addButton.addEventListener('click', function () {
    // Hiển thị phần tử add-text
    addTextElement.classList.remove('d-none');

    // Vô hiệu hóa thẻ select
    selectElement.disabled = false;
    selectElement.selectedIndex = -1;
});

// Thêm sự kiện nhập vào add-text
addTextElement.addEventListener('input', function () {
    if (addTextElement.value === '') {
        // Kích hoạt lại thẻ select nếu add-text trống
        selectElement.disabled = false;
    }
});
addTextElement.addEventListener('input', () => {
    if (addTextElement.value.length > 0) {
        selectElement.disabled = true;
        selectElement.selectedIndex = -1;
    } else {
        selectElement.disabled = false;
    }
});

let types = [];


window.onload = () => {
    document.getElementById("news-type").querySelectorAll("option").forEach(type => types = [...types, type.innerText]);
    console.log(types);
};

const inputType = document.getElementById("add-text");
const handleInputType = (s) => {
    if(document.getElementById("news-type").value.length === 0 && s.length === 0) {
        document.getElementById("error-message").innerText = "Vui lòng chọn nhóm tin";
        return;
    }
    if(types.indexOf(s) !== -1) {
        document.getElementById("error-message").innerText = "Nhóm tin đã tồn tại";
    }
    else {
        document.getElementById("error-message").innerText = "";
    }
};
inputType.addEventListener("change", e => handleInputType(e.target.value));
inputType.addEventListener("keyup", e =>  handleInputType(e.target.value))



$("#submit-btn").click(function (event) {
    event.preventDefault();

    var title = $("input[name='title']").val();
    var desc = $("input[name='desc']").val();
    var addgroup = $("input[name='addgroup']").val();
    var content = $("textarea[name='content']").val();
    var groupnews = $("select[name='groupnews']").val();

    $.ajax({
        type: "POST",
        url: "createnews",
        data: {filenameBase64: filenameBase64, title: title, desc: desc, addgroup: addgroup, content: content, groupnews: groupnews},
        success: function () {
            window.location.replace("managenews");
        }
    });
});


//them nut X de xoa roi chon lai

