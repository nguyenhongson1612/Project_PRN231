/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const adminTable = document.getElementById("admin");
const customerTable = document.getElementById("customer");

const adminBtn = document.getElementById("admin-btn");
const customerBtn = document.getElementById("customer-btn");

adminBtn.addEventListener("click", (e) => {
  adminTable.classList.remove("d-none");
  customerTable.classList.add("d-none");
});

customerBtn.addEventListener("click", (e) => {
  customerTable.classList.remove("d-none");
  adminTable.classList.add("d-none");
});


