<!doctype html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>Veterinaria KOKOVET</title>
    <link rel="stylesheet" href="Estilos/estilosIndex.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/product/">
    <script src="https://kit.fontawesome.com/12f3bc59b2.js" crossorigin="anonymous"></script>
    <!-- Bootstrap core CSS -->
    <link href="./Estilos/bootstrap.min.css" rel="stylesheet">
  </head>

  <body >
  <header class="site-header sticky-top py-1 bg-perzonalizado">
  <div class="px-3 py-2 text-white">
    <div class="container-fluid">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
          <img src="./IMG/logo.png" alt="">
        </a>
        <ul class="nav col-lg-auto my-2 justify-content-center my-md-0 text-small fs-2">
          <li>
            <a href="#" class="nav-link text-dark">
              <i class="fa-brands fa-square-facebook"></i>
              Facebook
            </a>
          </li>
          <li>
            <a href="#" class="nav-link text-dark">
              <i class="fa-brands fa-twitter"></i>
              Twitter
            </a>
          </li>
          <li>
            <a href="#" class="nav-link text-dark">
              <i class="fa-brands fa-whatsapp"></i>
              Whatsapp
            </a>
          </li>
          <li>
            <a href="#" class="nav-link text-dark">
              <i class="fa-brands fa-square-facebook"></i>
              Messenger
          </li>
        </ul>
        <div class="text-end">
          <button type="button" class="btn btn-primary" onclick="abrirLogin()">Login</button>
          <button type="button" class="redes btn btn-danger" onclick="abrirNavegador()"><i class="fa-solid fa-bars"></i></button>
        </div>
        <div class="flex-shrink-0 dropdown align-center">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="user" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="./IMG/MichaelMaster.jfif" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small shadow" aria-labelledby="user">
            <li><a class="dropdown-item" href="#">New project...</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Sign out</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</header>


<main>
<!--MENU DE NAVEGACION -->
<div id="nav" class="contenedor-modal">
  <div class="modal-navegacontenedor">
      <button class="close" onclick="cerrarVentana()"> X</button>
      <button type="button" class="boton menu">
          <span>INICIO</span>
          <div class="icono">
              <i class="fa-solid fa-marker"></i>
          </div>
      </button>
      <button type="button" onclick="mision()" class="boton menu">
          <span>NOSOTROS</span>
          <div class="icono">
              <i class="fa-solid fa-marker"></i>
          </div>
      </button>
      <button type="button" onclick="vision()" class="boton menu">
          <span>CONTACTENOS</span>
          <div class="icono">
              <i class="fa-solid fa-marker"></i>
          </div>
      </button>
      <button type="button" onclick="nosotros()" class="boton menu">
          <span>PET SHOP</span>
          <div class="icono">
              <i class="fa-solid fa-marker"></i>
          </div>
      </button>
      <button type="button" onclick="producto()" class="boton menu">
          <span>PRODUCTOS</span>
          <div class="icono">
              <i class="fa-solid fa-marker"></i>
          </div>
      </button>
  </div>
</div>


  <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-perzonalizado2 fw-bold">
    <div class="col-md-5 p-lg-5 mx-auto my-5">
      <h1 class="display-4 fw-normal fw-bold">Bienvenido a la Veterinaria KOKOVET</h1>
      <p class="lead fw-normal">Nuestros Servicios son los mejores en cuidado a su Mascota.</p>
      <a class="btn btn-outline-secondary" href="#">Galeria de imagenes</a>
    </div>
    <img class="product-device shadow-sm d-none d-md-block" src="./IMG/animado.jpg" alt=""></div>
    <img class="product-device product-device-2 shadow-sm d-none d-md-block" src="./IMG/animado3.jpg" alt="">
  </img>

  <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden bg-perzonalizado3">
      <div class="my-3 p-3">
        <h2 class="display-5 fw-bolder">Mascotas Felices</h2>
        <p class="lead">Cuidalos con Cariño y Amor.</p>
      </div>
      <img src="./IMG/animado.jpg" class="bg-body shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></img>
    </div>
    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden bg-perzonalizado3">
      <div class="my-3 py-3">
        <h2 class="display-5 fw-bolder">Engrielos con Todo tu Amor</h2>
        <p class="lead">Realizandoles sus preferidos Baños</p>
      </div>
      <img src="./IMG/animado1.jpg" class="bg-body shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></img>
    </div>
  </div>

  <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden bg-perzonalizado3">
      <div class="my-3 p-3">
        <h2 class="display-5 fw-bold">Cuidados Personales</h2>
        <p class="lead">Comprales los mejores juguetes a tu mascotas.</p>
      </div>
      <img src="./IMG/animado2.jpg" class="bg-body shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></img>
    </div>
    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden bg-perzonalizado3">
      <div class="my-3 py-3">
        <h2 class="display-5 fw-bolder">Difruta la vida</h2>
        <p class="lead">Diviertete con ellos</p>
      </div>
      <img src="./IMG/animado3.jpg" class="bg-body shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></img>
    </div>
  </div>
</main>


<div>
        <!-- LOGIN -->
        <!-- <section class="contenedor-login"> -->
           <!--  <form> -->
    <!--           <button class="close" onclick="cerrarLogin()"> X</button>-->
    <!--           <img src="../IMG/avatar.png" class="avatar" alt="Avatar Image">-->
    <!--           <h1>Ingrese Sesión</h1>-->
    <!--           <!--username-->-->
    <!--           <label for="username">Username</label>-->
    <!--           <input type="text">-->
    <!--           <!-- PASSWORD INPUT -->-->
    <!--           <label for="password">Password</label>-->
    <!--           <input type="password">-->
    <!--           <input type="submit" value="Ingresar">-->
    <!--           <a href="#">Recuperar su clave?</a><br>-->
    <!--           <a href="#">No tiene cuenta? Registrese</a>-->
    <!--       </form>-->
    <!--   </section>-->
</div>

<!--FOOTERN -->
<footer class="container-fluid py-5 bg-perzonalizado text-dark d-flex justify-content-around">
  <div class="row">
    <div class="col-12 col-md text-center align-center">
      <img src="./IMG/logo.png" alt="">
      <p class="mb-3 p-3">&copy; 2022</p>
    </div>
    <div class="col-4 col-md">
      <h4>CLINICA VETERINARIA KOKOVET</h4>
      <ul class="list-unstyled text-small fs-5">
        <li><p>Sede Surquillo</p></li>
        <li><p>Telefono 964 979 979</p></li>
        <li><p>Dirección</p></li>
        <li><p>Av. Manuel Villaran 1016 Surquillo 15038</p></li>
      </ul>
    </div>
    <div class="col-4 col-md">
      <h4>SERVICIOS</h4>
          <ul class="list-unstyled fs-5 text-muted ">
            <li><a class="link-secondary text-secondary" href="#">Consultas</a></li>
            <li><a class="link-secondary text-secondary" href="#">Vacunas</a></li>
            <li><a class="link-secondary text-secondary" href="#">Madicina interna</a></li>
            <li><a class="link-secondary text-secondary" href="#">Hospitalizacion</a></li>
            <li><a class="link-secondary text-secondary" href="#">Grooming</a></li>
          </ul>
    </div>
    <div class="col-4 col-md">
      <h4>Te Ofrecemos las mejores marcas para tu Mascota</h4>
        <div class="container p-3">
          <div class="container">
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="./IMG/marcas/producto_canbo.jpg" class="d-block w-80" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="./IMG/marcas/producto_catshow.png" class="d-block w-80" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="./IMG/marcas/producto_friskies.png" class="d-block w-80" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="/IMG/marcas/producto_mimaskot.png" class="d-block w-80" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="./IMG/marcas/producto_proplan.png" class="d-block w-80" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="./IMG/marcas/producto_ricocan.jpg" class="d-block w-80" alt="...">
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          </div>
        </div>
      <p>Escribenos a: sedessurquillo@kokovet.pe</p>
    </div>
  </div>
</footer>

    <script src="./js/FuncionNavegcion.js"></script>
    <script src="./js/FuncionLogin.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

      
  </body>
</html>
