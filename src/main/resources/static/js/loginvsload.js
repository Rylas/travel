document.body.addEventListener("click", function (e) {
    if (e.target.matches("#loginform")) {
        document.getElementById("loginform").style.visibility = "hidden";
        document.getElementById("signup").style.display = "none";
    }
});
document.getElementById("loginform").style.visibility = "hidden";
document.getElementById("signup").style.display = "none";
// document.getElementById("sear").onmouseover = function () { mouseover() };
// document.getElementById("search-id").onmouseout = function () { mouseout() };







function dungdeptrai() {
    let a = document.getElementById("signup").style.display;
    if (a == "none") {
        document.getElementById("signup").style.display = "";
        // location.reload();
    }
    else {
        document.getElementById("signup").style.display = "none";
        // location.reload();
    }
};

function myFunction() {
    var element = document.getElementById("nav-bar");
    element.classList.toggle("active");
    var element = document.getElementById("nav-icon");
    element.classList.toggle("transform_180");
 }

