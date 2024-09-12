const form = document.getElementById("deposit");

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
