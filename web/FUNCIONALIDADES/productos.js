/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function llenarFormulario(fila) {
    var codigo = $(fila).find(".Idp").text();
    var nombre = $(fila).find(".pnombre").text();
    var desc = $(fila).find(".pdescrpcion").text();
    var prec = $(fila).find(".preciop").text();
    var stoc = $(fila).find(".stockp").text();

    $("#txtId").val(codigo);
    $("#txtNombre").val(nombre);
    $("#txtPrecio").val(prec);
    $("#txtStock").val(stoc);
    $("#txtDescripcion").val(desc);

}
function llenarFormulario2(fila) {
    var id = $(fila).find(".id").text();
    var dni = $(fila).find(".dni").text();
    var nom = $(fila).find(".nom").text();
    var ap = $(fila).find(".ape").text();
    var direc = $(fila).find(".direc").text();
    var em = $(fila).find(".email").text();
    var pass = $(fila).find(".pass").text();
    var tel = $(fila).find(".tel").text();
    var dis = $(fila).find(".dis").text();
    var rol = $(fila).find(".rol").text();
    var es = $(fila).find(".es").text();

    $("#txtId").val(id);
    $("#txtdni").val(dni);
    $("#txtnom").val(nom);
    $("#txtap").val(ap);
    $("#txtdirec").val(direc);
    $("#txtem").val(em);
    $("#txtpass").val(pass);
    $("#txttel").val(tel);
    $("#txtdis").val(dis);
    $("#txtrol").val(rol);
    $("#txtes").val(es);

}
function llenarFormulario3(fila) {
    var idpedido = $(fila).find(".idpedido").text();
    var estado = $(fila).find(".estadop").text();

    $("#txtIDestado").val(idpedido);
    $("#estadopedido option[selected]").removeAttr('selected');
    $("#estadopedido option:contains(" + estado + ")").attr('selected', true);
}

$(document).ready(function () {
    $('#mydataTable').DataTable();


    $("#exampleModal").on("hidden.bs.modal", function () {
        $('form')[0].reset();
        $("#txtCategoria option[selected]").removeAttr('selected');
    });

    $(document).on('click', '.btnEditar', function () {
        llenarFormulario($(this).closest('tr'));
        $('.btnOcultar1').attr('disabled', 'disabled');
        $('.btnOcultar').removeAttr('disabled');
    });
    $(document).on('click', '.btnEliminar', function () {
        llenarFormulario($(this).closest('tr'));
        $('.btnOcultar1').attr('disabled', 'disabled');
        $('.btnOcultar').removeAttr('disabled');
    });
    $(document).on('click', '.btnAdd', function () {
        $('.btnOcultar').attr('disabled', 'disabled');
        $('.btnOcultar1').removeAttr('disabled');
    });
    $(document).on('click', '.btnEditar', function () {
        llenarFormulario3($(this).closest('tr'));
    });
    $(document).on('click', '.botonEditar', function () {
        llenarFormulario2($(this).closest('tr'));
    });
    $(document).on('click', '.botonEliminar', function () {
        llenarFormulario2($(this).closest('tr'));
    });

});
