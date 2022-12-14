function abrirNavegador() {
    document.querySelector(".contenedor-modal").style.visibility = "visible";
    document.querySelector(".contenedor-modal").style.opacity = "1";
    document.querySelector(".modal-navegacontenedor").style.transform="translateX(200%)";

}

function cerrarVentana() {
    document.querySelector(".modal-navegacontenedor").style.transform="translateX(-150%)";
    document.querySelector(".contenedor-modal").style.opacity = "0";
    document.querySelector(".contenedor-modal").style.transition = "15s";
}
function producto(){
    window.location.href="Controller?accion=home";
}
function inicio(){
    window.location.href="../index.html";
}
function RegistrarseLogin(){
    window.location.assign("http://localhost:8080/PETSHOP/VISTAS/FormularioRegistrarse.jsp");
}

function abrirLogin(){
    window.location.assign("http://localhost:8080/PETSHOP/VISTAS/Login.jsp");
}