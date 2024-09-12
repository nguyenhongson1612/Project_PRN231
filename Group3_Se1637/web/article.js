/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const articleContent = document.querySelector(".article-content");
console.log(articleContent)
const articleImg = articleContent.querySelectorAll("img");
const imgs = [];
articleImg.forEach(img => {
    imgs.push(img.src);
});

console.log(imgs)
const zoomSection = document.getElementById("zoom-container");


articleImg.forEach(img => {
    img.addEventListener("click", () =>{
        console.log(img)
        zoomSection.classList.remove("d-none");
        let zoomimg = document.getElementById("zoom-img");
        zoomimg.src = img.src;
    });
});

const zoomCloseBtn = document.getElementById("close-btn");
zoomCloseBtn.addEventListener("click", () => {
  zoomSection.classList.add("d-none");
});

const nextBtn = document.getElementById("next-btn");
const prevBtn = document.getElementById("prev-btn");

nextBtn.addEventListener("click", () => {
    let img = document.getElementById("zoom-img");

    let index = imgs.indexOf(img.src);
    if(index === imgs.length - 1) {
        img.src = imgs[0];
    }
    else {
        img.src = imgs[index + 1];
        console.log(img);
    }
});

prevBtn.addEventListener("click", () => {
    let img = document.getElementById("zoom-img");

    let index = imgs.indexOf(img.src);
    if(index === 0) {
        img.src = imgs[imgs.length - 1];
    }
    else {
        img.src = imgs[index - 1];
        console.log(img);
    }
});

