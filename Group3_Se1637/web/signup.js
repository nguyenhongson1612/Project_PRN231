/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const form = document.getElementById("signup-form");
const list = '<%= request.getAttribute("list") %>';
const phoneGroup = document.getElementById("phone-group");
const pwdGroup = document.getElementById("password-group");
const cpwdGroup = document.getElementById("confirm-group");

form.addEventListener("submit", (e) => {
  e.preventDefault();

  const phone = phoneGroup.querySelector("input");
  const phoneError = phoneGroup.querySelector(".error");

  const pwd = pwdGroup.querySelector("input");
  const pwdError = pwdGroup.querySelector(".error");

  const cpwd = cpwdGroup.querySelector("input");
  const cpwdError = cpwdGroup.querySelector(".error");

  if (
    phone.value.length === 0 ||
    !phone.value.match(/(0[3|5|7|8|9])+([0-9]{8})\b/)
  ) {
    phoneError.innerHTML = "Vui lòng nhập đúng số điện thoại";
  } else {
    phoneError.innerHTML = "";
  }

  if (pwd.value.length < 8) {
    pwdError.innerHTML = "Mật khẩu phải chứa ít nhất 8 kất tự";
  } else {
    pwdError.innerHTML = "";
  }

  if (cpwd.value !== pwd.value) {
    cpwdError.innerHTML = "Mật khẩu nhập lại không khớp";
  } else {
    cpwdError.innerHTML = "";
  }

  if (
    phoneError.innerHTML === "" &&
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


