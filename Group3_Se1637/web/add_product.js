const avt = document.getElementById("avt-upload");
const sub = document.getElementById("sub-upload");
const previewAvt = document.getElementById("avt-img");
const avtBtn = document.getElementById("add-avt-container");
let deleteBtns = [];
let base64Avt;

const uploadAvt = (e) => {
    const readerAvt = new FileReader();
    var file = e.files[0];
    readerAvt.onloadend = () => {
        previewAvt.innerHTML = `
    <div class="preview">
    <img src="${readerAvt.result}" alt="">
    <button type= "button" class="btn btn-danger text-white delete-btn" onclick="deleteAvt(this)">x</button>
    </div>
    `;
        previewAvt.src = readerAvt.result;
        base64Avt = readerAvt.result;
    };
    if (file) {
        readerAvt.readAsDataURL(file);
    } else {
        previewAvt.src = "";
    }
    avtBtn.innerHTML = ``;
    deleteBtns = document.querySelectorAll(".delete-btn");
}

let subImgs = [];
let base64SubImgs = [];
sub.addEventListener("change", (e) => {
    subImgs = [];
    [...e.target.files].forEach((file) => {
        const fileReader = new FileReader();
        fileReader.onload = () => {
            subImgs = [...subImgs, file.name];
            base64SubImgs = [...base64SubImgs, fileReader.result];
            document.getElementById("sub-img").innerHTML += `
        <div class = "preview-container">
            <div class="preview">
                <button type = "button" class="btn btn-danger text-white delete-btn" onclick="deleteImg(this)">x</button>
                <img src="${fileReader.result}" alt="${file.name}">
            </div>
        </div>
            `;
        };
        fileReader.readAsDataURL(file);
    });
    deleteBtns = document.querySelectorAll(".delete-btn");
});

const deleteImg = (btn) => {
    const index = subImgs.indexOf(btn.nextElementSibling.alt);
    subImgs = subImgs.filter((img, i) => i !== index);
    base64SubImgs = base64SubImgs.filter((img, i) => i !== index);
    btn.parentNode.parentNode.remove();
};

const deleteAvt = (avt) => {
    previewAvt.querySelector(".preview").remove();
    avtBtn.innerHTML = `
    <div>
    <label class="label label-primary" for="avt-upload">Thêm avatar</label>
<input required type="file" name="avt" id ="avt-upload" class="upload-photo" onchange="uploadAvt(this)"/>
</div>
 
`;
    avt = document.getElementById("avt-upload");
}

$("#submit-btn").click(function (event) {
    event.preventDefault();

    var pid = $("input[name='pid']").val();
//    var name = $("input[name='name']").val();
    var price = $("input[name='price']").val();
    var quantity = $("input[name='quantity']").val();
    var cid = $("select[name='cid']").val();
    var unit = $("input[name='unit']").val();
    var describe = $("input[name='describe']").val();

    $.ajax({
        type: "POST",
        url: "addproduct",
        data: {base64Avt:base64Avt, base64SubImgs: JSON.stringify(base64SubImgs), pid: pid, price: price, quantity: quantity, cid: cid, unit: unit, describe: describe},
        success: function () {
//            window.location.replace("product");
        }
    });
});
