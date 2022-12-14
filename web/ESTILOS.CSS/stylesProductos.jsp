<%-- 
    Document   : stylesProductos
    Created on : 27 nov. 2022, 23:30:22
    Author     : SEBAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .products{
        height: auto;
    }

    .products .insertar{
        display: flex;
        margin-top: 30px;
    }

    .products .insertar form{
        display: flex;
        justify-content: left;
        height: auto;
        width: 100%;
        gap: 80px;
        margin-left: 20px;
    }

    .products .insertar form .inputs1 input {
        width: 350px;
        height: 34px;
        border-radius: 5px;
        padding-left: 6px;
    }

    .products .insertar form .inputs1 label {
        font-size: 19px;
    }




    .products .insertar form .inputs1{
        display: flex;
        flex-direction: column;
        gap: 10px;
        justify-content: center;
    }

    .vista{
        margin-top: 50px;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-left: 15px;
        margin-right: 15px;
    }
    .infoContent{
        width: 100%;
    }

    .vista .descargar{
        margin-bottom: 10px;
    }

    .vista .descargar a{
        text-decoration: none;
        color: black;
        font-size: 18px;
        font-weight: bold;
    }

    table{
        border-collapse: collapse ;
        width: 100%;
    }

    th,tr{
        padding: 0px 28px;
        text-align: center;
        margin: 0;
    }
    tbody tr td{
        height: 100px;
    }
    thead{
        border-bottom: 2px solid black ;
    }

    .actualizar{
        text-decoration: none;
        background-color: blue;

        padding: 5px 30px;
        border-radius: 5px;
        color: white;
        font-weight: bold;
    }
    .elminar{
        text-decoration: none;
        background-color: red;

        padding: 5px 30px;
        border-radius: 5px;
        color: white;
        font-weight: bold;
    }

    tbody tr .descripcion{
        word-wrap: break-word;
    }

    tr{
        border-bottom: 1px solid black;
    }


    .span{
        color: black;
        font-weight: bold;
        padding: 10px;
        border-radius: 25px;
        font-size: 20px;
    }

    .amarillo{
        background-color: #F8DB73;
    }
    .rojo{
        background-color: #EE534F;
    }

    .verde{
        font-weight: bold;
        background-color: #AADEBD;
    }
    .gris{
        font-weight: bold;
        background-color: #CECECE;
        color: white;
    }

    .estado{
        padding: 10px;
        border-radius: 20px;
    }

    .contenedor_imagen img{
       width:  100%; 
       height: 100%;
    }
    
    .contenedor_imagen{
        border-radius: 50%;
    }
    
  

</style>
