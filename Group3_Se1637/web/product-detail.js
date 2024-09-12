// Zoom in/out
const smallImages = document.querySelectorAll(".small-img");

let bigImage = document.querySelector(".big-img");

let imgs = []

smallImages.forEach(img => {
    imgs.push(img.querySelector("img").src);
});

smallImages.forEach((img) => {
  bigImage = document.querySelector(".big-img");
  img.addEventListener("click", () => {
    smallImages.forEach((img2) => {
      img2.classList.remove("zoom-img");
    });
    bigImage.querySelector("img").src = img.querySelector("img").src;
    img.classList.add("zoom-img");
  });
});

const zoomSection = document.getElementById("zoom-container");

bigImage.addEventListener("click", () => {
  zoomSection.classList.remove("d-none");
  zoomSection.querySelector("img").src = bigImage.querySelector("img").src;
  
});

const zoomCloseBtn = document.getElementById("close-btn");
zoomCloseBtn.addEventListener("click", () => {
  zoomSection.classList.add("d-none");
});

const nextBtn = document.getElementById("next-btn");
const prevBtn = document.getElementById("prev-btn");

nextBtn.addEventListener("click", () => {
    console.log(imgs)
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
    console.log(imgs)
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




