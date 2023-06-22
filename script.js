console.log("javascript connected");

// function openFirst() {
//     console.log("button is clicked")
//     var first = document.getElementById("first");
//     if (first.style.display === "none") {
//         first.style.display = "block";
//     } else {
//         first.style.display = "none";
//     }
// }

const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))