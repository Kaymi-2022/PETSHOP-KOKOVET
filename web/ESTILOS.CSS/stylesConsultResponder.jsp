<%-- 
    Document   : stylesConsultResponder
    Created on : 2 dic. 2022, 00:42:50
    Author     : SEBAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    .contendoResponder{
        width: 100%;
        display: flex;
        flex-direction: column;
    }

    .parteSuperior{
        width: 100%;
        display: flex;
        gap: 20px;
        justify-content: space-around;
    }

    .parteInferior{
        height: 350px;
        width: 100%;
        margin-top: 20px;
        padding: 0 15px;
    }

    .Correos{
        width: 50%;
    }

    .scrolll{
        height: 300px;
        overflow: scroll;
    }

    .Correos table{
        border-collapse: collapse ;
        width: 100%;
    }
    .Correos table th, .Correos table tr{
        padding: 0px 10px;
        text-align: center;
        margin: 0;
    }
    .Correos table tbody tr td{
        height: 60px;
    }
    .Correos table tbody thead{
        border-bottom: 2px solid black ;
    }

    tbody tr td a{
        text-decoration: none;
        padding: 5px 10px;
        border-radius: 20px;
        color: black;
        border: 1px solid black;
    }

    tbody tr td a:hover{
        background: black;
        color: white;
    }

    .mensajesRecibidos textArea{
        resize: none;
    }

    .parteInferior textarea{
        resize: none;
        width: 100%;
        height: 250px;
        padding: 6px;
        margin-bottom: 25px;
    }

    .parteInferior div{
        width: 100%;
        display: flex;
        justify-content: center;
    }
    .parteInferior div a{
        border: 1px solid black;
        text-decoration: none;
        padding: 10px 15px;
        border-radius: 25px;
        color: black;
    }


    .parteInferior div a:hover{
        background: black;
        color: white;
    }
    
   
</style>