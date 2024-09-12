let avt = document.getElementById("avt-upload");
let sub = document.getElementById("sub-upload");
const previewAvt = document.getElementById("avt-img");
const avt_container = document.getElementById("add-avt-container");
let deleteBtns = [];


const uploadAvt = (e) => {
    const reader = new FileReader();
    reader.readAsDataURL(e.files[0]);

    let filename = URL.createObjectURL(e.files[0]); //will store file name with src
    let newImage = document.createElement("img");
    newImage.setAttribute("src", filename); //setting attribute src of newly created "img" element to "filename"
    previewAvt.innerHTML = `<div class = "preview"></div>`;
    previewAvt.querySelector(".preview").appendChild(newImage);
    previewAvt.querySelector(".preview").innerHTML += `<button type = "button" class="btn btn-danger text-white delete-btn" onclick="deleteAvt(this)">x</button>`

}

sub.addEventListener("change", (e) => {
    [...e.target.files].forEach((file) => {
        const fileReader = new FileReader();
        fileReader.onload = () => {
            document.getElementById("sub-img").innerHTML += `
        <div class = "preview-container">
            <div class="preview">
                <img src="${fileReader.result}" alt="">
                <button class="btn btn-danger text-white delete-btn" onclick="deleteImg(this)">x</button>
            </div>
        </div>
            `;
        };
        fileReader.readAsDataURL(file);
    });
    deleteBtns = document.getElementById("sub-img").querySelectorAll(".delete-btn");
});

const deleteImg = (btn) => {
    btn.parentNode.parentNode.remove();
};
const deleteAvt = (avt) => {
    console.log(previewAvt)
    previewAvt.querySelector(".preview").remove();
    avt_container.innerHTML = `
 <label class="label label-primary" for="avt-upload">Thêm avatar</label>
<input required type="file" name="avt" id ="avt-upload" class="upload-photo" onchange="uploadAvt(this)"/>
`;
    avt = document.getElementById("avt-upload");
}



