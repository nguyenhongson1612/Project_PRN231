const mobileBar = document.getElementById("mobile-bar");
const mobileNav = document.getElementById("mobile-nav");
const mobieNavContainer = document.querySelector(".mobile-nav-container");

const mobileNavClose = document
  .querySelector(".mobile-nav--header")
  .querySelectorAll("i");

mobileBar.addEventListener("click", () => {
  mobileNav.classList.remove("d-none");

  mobieNavContainer.style.left = "0";
});

mobileNavClose.forEach((btn) => {
  btn.addEventListener("click", () => {
    mobileNav.classList.add("d-none");
    mobieNavContainer.style.left = "-320px";
  });
});
