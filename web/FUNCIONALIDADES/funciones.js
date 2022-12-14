/* global swal */

$(document).ready(function () {
    $("tr #deleteItem").click(function (e) {
        e.preventDefault();
        var idp = $(this).parent().find('#idp').val();

        swal({
            title: "Esta Seguro de Eliminar?",
            text: "Una una Vez Eliminado, Debera Agregar de Nuevo!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                eliminar(idp);
                swal("¡Registro Borrado! ", {
                    icon: "success"
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "ControladorCarrito?accion=carrito";
                    }
                });
            }
        });
    });
    function eliminar(idp) {
        var url = "ControladorCarrito?accion=deleteProducto&id=" + idp;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            data: "idp=" + idp,
            success: function (data, textStatus, jqXHR) {
//                alert("Registro eliminado");
            }
        });
    }

    $("tr #deleteProducto").click(function (e) {
        e.preventDefault();
        var idproducto = $(this).parent().find('#idproducto').val();

        swal({
            title: "Esta Seguro de Eliminar?",
            text: "Una una Vez Eliminado, Debera Agregar de Nuevo!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                eliminar(idproducto);
                swal("¡Registro Borrado! ", {
                    icon: "success"
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "ControladorCarrito?accion=deleteProducto";
                    }
                });
            }
        });
    });

    $("tr #Cantidad").click(function (e) {
        e.preventDefault();
        var idp = $(this).parent().find('#idproducto').val();
        var cantidad = $(this).parent().find('#Cantidad').val();
        var url = "ControladorCarrito?accion=updateCantidad";
        console.log(idp, cantidad);
        $.ajax({
            type: 'POST',
            url: url,
            data: "id=" + idp + "&cantidad=" + cantidad,
            success: function (data, textStatus, jqXHR) {
                parent.location.href = "ControladorCarrito?accion=carrito";
            }
        });
    });
});



