

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    @import url("https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@400;700&display=swap");
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    .container_general {
        display: flex;
        height: auto;
        
    }
    .container_general .container_lateral {
        height: 650px;
        width: 20%;
        box-shadow: 1px 1px 8px black;
    }
    .container_general .container_lateral .seccion_imagen {
        height: 250px;
        border: 1px solid black;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        font-family: 'Roboto Condensed', sans-serif;
    }
    .container_general .container_lateral .seccion_imagen .contenedor_imagen {
        border: 1px solid black;
        width: 200px;
        height: 200px;
        overflow: hidden;
        box-shadow: 1px 1px 10px black;
    }
    .container_general .container_lateral .seccion h2{
        height: 100px;
        border: 1px solid black;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: 'Roboto Condensed', sans-serif;
        transition: 0.5s;
        color: black;
    }

    .container_general .container_lateral .seccion a{
        text-decoration: none;
    }

    .container_general .container_lateral .seccion h2:hover{
        background-color: black;
        color: white;
        cursor: pointer;
    }
    .container_general .container_lateral .seccion_final {
        height: 250px;
        border: 1px solid black;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        font-family: 'Roboto Condensed', sans-serif;
    }
    .container_general .container_lateral .seccion_final .contenedor_imagen {
        border: 1px solid black;
        width: 200px;
        height: 200px;
        overflow: hidden;
        box-shadow: 1px 1px 10px black;
    }
    .container_general .barra_top {
        border: 1px solid black;
        width: 100%;
        display: flex;
        height: 80px;
    }
    .ventas{
        width: 100%
    }
    .container_general .barra_top .parte1 {
        width: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 1px solid white;
        font-family: 'Roboto Condensed', sans-serif;
        background-color: black;
        color: white;
    }
    .container_general .barra_top .parte2 {
        display: flex;
        width: 50%;
        align-items: center;
        justify-content: center;
        border: 1px solid white;
        font-family: 'Roboto Condensed', sans-serif;
        background-color: black;
        color: white;
    }

    .container_general .barra_top .parte3 {
        display: flex;
        width: 18%;
        align-items: center;
        justify-content: center;
        border: 1px solid white;
        font-family: 'Roboto Condensed', sans-serif;
        background-color: black;
        color: white;
    }


    .container_general .barra_top .parte3 a{
        text-decoration: none;
    }
    
     .container_general .barra_top .parte3 p{
        color: white;
    }
    
    footer {
        width: 100%;
        display: flex;
        color: white;
        background-color: black;
        justify-content: center;
        align-items: center;
        font-family: 'Roboto Condensed', sans-serif;
    }
    
 


</style>