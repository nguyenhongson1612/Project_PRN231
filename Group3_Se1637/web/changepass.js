
const form = document.getElementById("changepass-form");

const pwdGroup = document.getElementById("password-group");
const cpwdGroup = document.getElementById("confirm-group");
const oldGroup = document.getElementById("old-group");
form.addEventListener("submit", (e) => {
    e.preventDefault();


    const pwd = pwdGroup.querySelector("input");
    const pwdError = pwdGroup.querySelector(".error");

    const cpwd = cpwdGroup.querySelector("input");
    const cpwdError = cpwdGroup.querySelector(".error");
    const old = oldGroup.querySelector("input");
    const oldError = oldGroup.querySelector(".error");
if (old.value.length < 8) {
        oldError.innerHTML = "Mật khẩu phải chứa ít nhất 8 kất tự";
    } else {
        oldError.innerHTML = "";
    }
    if (pwd.value.length < 8) {
        pwdError.innerHTML = "Mật khẩu mới phải chứa ít nhất 8 kất tự";
    } else {
        pwdError.innerHTML = "";
    }

    if (cpwd.value !== pwd.value) {
        cpwdError.innerHTML = "Mật khẩu nhập lại không khớp";
    } else {
        cpwdError.innerHTML = "";
    }

    if (
            oldError.innerHTML === ""&&
            pwdError.innerHTML === "" &&
            cpwdError.innerHTML === ""
            ) {
        form.submit();
    }
});

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



