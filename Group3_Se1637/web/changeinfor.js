/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const form = document.getElementById("signup-form");

const phoneGroup = document.getElementById("phone-group");


form.addEventListener("submit", (e) => {
  e.preventDefault();

  const phone = phoneGroup.querySelector("input");
  const phoneError = phoneGroup.querySelector(".error");



  if (
    phone.value.length === 0 ||
    !phone.value.match(/(0[3|5|7|8|9])+([0-9]{8})\b/)
  ) {
    phoneError.innerHTML = "Vui lòng nhập đúng số điện thoại";
  } else {
    phoneError.innerHTML = "";
  }

  

  if (
    phoneError.innerHTML === ""
  ) {
    form.submit();
  }
});
;


