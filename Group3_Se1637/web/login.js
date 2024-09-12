const btns = document.querySelectorAll('.show-btn');

btns.forEach(btn => {
    btn.addEventListener("click", () => {
        if(btn.nextElementSibling.type === "password") {
            btn.nextElementSibling.type = "text";
            btn.innerHTML = `<i class="bi bi-eye-fill"></i>`
        }
        else {
            btn.nextElementSibling.type = "password";
            btn.innerHTML = `<i class="bi bi-eye-slash-fill"></i>`

        }
    });
})
;