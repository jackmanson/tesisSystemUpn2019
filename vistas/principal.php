<!DOCTYPE html>
<html lang="es">
<head>
	<title>myproduccion &reg;</title>
	<meta charset="utf-8"/>
        <meta name="keyswords" description="textil,polos,ropa,algodon,produccion textil,prendas,jersy,pyma,melange"/>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <link rel="shortcut icon" type="image/png" href="vistas/img/logo_iso_icon.png"/>
        
	<script type="text/javascript" src="vistas/js/principal.js"></script>
	<link rel="stylesheet" type="text/css" href="vistas/css/principal.css"/>
        <style>
            .margenCaja{
                margin: 10px 0px;
            }
            
             @media (max-width:1199px) and (min-width:992px){
                .nav li{
                  font-size: 11px !important;
                  line-height: 1.4 !important;
                  letter-spacing: 1px;
                }

              }

              @media (max-width:991px) and (min-width:568px){
                .nav li{
                  font-size: 11px !important;
                  line-height: 1.4 !important;
                  letter-spacing: 1px;
                }

              }
        </style>	
		

</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

		
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>                        
				</button>
				<a class="navbar-brand" href="#myPage">CM</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
                                    
                                    <?php
                                        
                                        $pagePrincipal = ControladorPrincipal::ctrEstiloPrincipal();
                                        
                                        $jsonPagePrincipal = json_decode($pagePrincipal["navegador_menu"],true);

                                        //var_dump($jsonPagePrincipal);
                                        
                                        foreach ($jsonPagePrincipal as $key => $value) {
                                            echo '<li><a href="'.$value["url"].'">'.$value["item"].'</a></li>';
                                        }
                                                
                                    ?>

                                    <li class="classLogin"><a href="acceso.php"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				
                                </ul>
			</div>
		</div>
	</nav>

	<div class="jumbotron text-center">
		<dir class="container">
                        <?php
                            $jsonPagePrincipal = json_decode($pagePrincipal["buscador"],true);
                        ?>
			<h1><?= []?>COMERCIAL MONELY</h1> 
			<p>Especialistas en procesos textiles</p> 
			<form>
				<div class="input-group">
				<input type="email" class="form-control" size="50" placeholder="Deje su email y le enviaremos novedades." required>
				<div class="input-group-btn">
					<button type="button" class="btn btn-danger">Subscribe</button>
				</div>
				</div>
			</form>
				
		</dir>

	</div>

	<!-- Container (About Section) -->
	<div id="about" class="container">
		<div class="row">
			<div class="col-sm-8">
			<h2>Acerca de la compañia</h2><br>
			<h4>El Perú tuvo la fortuna de gozar una gran variedad de materiales para la creación sin límites de telares hechos por los mismos peruanos en aquellos tiempos que solo podía ser utilizada por los más altos niveles jerárquicos de cada grupo social de ese tiempo.</h4><br>
			<p>La empresa fue fundada el 21 de octubre del 2011, registrada dentro de las sociedades mercantiles y comerciales como una empresa individual de responsabilidad limitada, se encuentra dentro del sector venta al por mayor y realiza actividades de comercio exterior como importaciones y exportaciones. La empresa actualmente produce prendas de vestir como leggings, ajuares, kimonos y principalmente polos hechos con algodón y poliéster en su mayoría; pero, también trabajan con telas sintéticas según demanda; por el contrario, son pocas las veces que se produce con telas pesadas como franela o telas donde se aprovecha menos prendas por kilogramo. La esencia de esta empresa es que vende en su mayoría polos, ya sea para bebes, niños o jóvenes; no obstante, evita producir prendas donde el costo sea elevado en su producción como: dibujos bordados de gran tamaño, prendas con lavado y acabados muy especializados, estampados con pinturas de muy altísimo costo, entre otros más; por consecuencia, que muchos de los clientes no quieren afrontar precios elevados y en tiempos prolongados. Su mercado principal es el ámbito nacional donde distribuye toda su producción ya sea en provincia o en la capital; sin embargo, se exporta ocasionalmente a chile. Las estaciones donde hay más órdenes de compra se presenta en casi comienzos de otoño y finales de invierno; sin embargo, el mes más bajo del año es en enero. Actualmente cuenta con una cartera de clientes como Tottus, Saga Falabella, Ripley, Ripley chile, Oechsle, Maratton, Federación Peruana de Futbol, Paris, Umbro, Plaza Vea, entre otros que han generado importantes relaciones en el país.</p>
			<br><!--<button class="btn btn-default btn-lg">Get in Touch</button>-->
			</div>
			<div class="col-sm-4">
			<span class="glyphicon glyphicon-signal logo"></span>
			</div>

		</div>
	</div>

	<br/>

	<div class="container-fluid bg-grey">
		<div class="container">
			<div class="row">
			<div class="col-sm-4">
			<span class="glyphicon glyphicon-globe logo slideanim"></span>
			</div>
			<div class="col-sm-8">
			<h2>Nuestros Valores</h2><br>
			<h4>
				<strong>MISIÓN:</strong> Nuestra misión es la satisfacción del cliente final mejorando constantemente la calidad y dandole lo que necesita.
			</h4><br>
			<h4>
				<strong>VISIÓN:</strong> Nuestra visión es producir textiles que den satisfacción a nuevos clientes que reconoscan el producto y quieran comprar.
			</h4>
			</div>
		</div>
		</div>

	</div>

	<!-- Container (Services Section) -->
	<div id="services" class="container-fluid text-center">
		<div class="container">
			<h2>PROCESOS DE PRODUCCIÓN</h2>
			<h4>Etapas relevantes en nuestra cadena productiva.</h4>
			<br>
			<div class="row slideanim">
				<div class="col-sm-4 margenCaja">
					<span class="glyphicon glyphicon-off logo-small"></span>
					<h4>DISEÑO</h4>
					<p>Preparamos los artes y fichas.</p>
				</div>
				<div class="col-sm-4 margenCaja"> 
					<span class="glyphicon glyphicon-heart logo-small"></span>
					<h4>CORTE</h4>
					<p>Preparan las capas y el corte.</p>
				</div>
				<div class="col-sm-4 margenCaja">
					<span class="glyphicon glyphicon-lock logo-small"></span>
					<h4>ESTAMPADO</h4>
					<p>Nuestras máquinas estampan 15000 predas por día.</p>
				</div>

				<div class="col-sm-4 margenCaja">
					<span class="glyphicon glyphicon-leaf logo-small"></span>
					<h4>CONFECCIÓN</h4>
					<p>Se confeccionan las prendas.</p>
				</div>
				<div class="col-sm-4 margenCaja">
					<span class="glyphicon glyphicon-certificate logo-small"></span>
					<h4>ACABADO</h4>
					<p>Empaque de avios y accesorios.</p>
				</div>
				<div class="col-sm-4 margenCaja">
					<span class="glyphicon glyphicon-wrench logo-small"></span>
					<h4 style="color:#303030;">CALIDAD</h4>
					<p>Revisan texturas, colores y detalles de las prendas.</p>
				</div>
			</div>
		</div>
		
	</div>

	<!-- Container (Portfolio Section) -->
	<div id="portfolio" class="container-fluid text-center bg-grey">
            <div class="container">
                    <h2>Áreas de Producción</h2><br>
                    <h4>Desarrollo de producto.</h4>
                    <div class="row text-center slideanim">
                            <div class="col-sm-4">
                                    <div class="thumbnail">
                                            <img src="vistas/img/02_diseñoarea.jpeg" alt="New York" width="400" height="300">
                                            <p><strong>Diseño</strong></p>
                                            <p>Equipo de Diseño.</p>
                                    </div>
                            </div>
                            <div class="col-sm-4">
                                    <div class="thumbnail">
                                            <img src="vistas/img/03_corte.jpeg" alt="San Francisco" width="400" height="300">
                                            <p><strong>Corte</strong></p>
                                            <p>Preparado de telas.</p>
                                    </div>
                            </div>
                            <div class="col-sm-4">
                                    <div class="thumbnail">
                                            <img src="vistas/img/01_estampado.jpeg" alt="Paris" width="400" height="300">
                                            <p><strong>Estampado</strong></p>
                                            <p>Pulpo de 18 brazos.</p>
                                    </div>
                            </div>
                    </div>
            </div>
            <br>

            <h2>Nuestros clientes comentan.</h2>
            <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                            <h4>"This company is the best. I am so happy with the result!"<br><span>Michael Roe, Vice President, Comment Box</span></h4>
                    </div>
                    <div class="item">
                            <h4>"One word... WOW!!"<br><span>John Doe, Salesman, Rep Inc</span></h4>
                    </div>
                    <div class="item">
                            <h4>"Could I... BE any more happy with this company?"<br><span>Chandler Bing, Actor, FriendsAlot</span></h4>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
	</div>

	<!-- Container (Pricing Section) -->
	<div id="pricing" class="container-fluid">
		<div class="container">
			<div class="text-center">
				<h2>Oferta en Nuestra Tienda</h2>
				<h4>Buenos precios en polos y prendas de algodón.</h4>
			</div>
			<div class="row slideanim">
				<div class="col-sm-4 col-xs-12">
                                    <div class="panel panel-default text-center">
                                            <div class="panel-heading">
                                                    <h1>Polos</h1>
                                            </div>
                                            <div class="panel-body">
                                                    <p><strong>Jersey</strong> </p>
                                                    <p><strong>Coverturas</strong> </p>
                                                    <p><strong>Colores naturales</strong> </p>
                                                    <p><strong>Pasteles</strong> </p>
                                                    <p><strong>Todas las tallas</strong></p>
                                                    </div>
                                                    <div class="panel-footer">
                                                    <h4>Desde</h4>
                                                    <h3>S/. 4.00</h3>
                                                    <!-- <button class="btn btn-lg">Sign Up</button> -->
                                            </div>
                                    </div>      
				</div>     
				<div class="col-sm-4 col-xs-12">
                                    <div class="panel panel-default text-center">
                                            <div class="panel-heading">
                                                    <h1>Leggings</h1>
                                            </div>
                                            <div class="panel-body">
                                                    <p><strong>Jersey</strong> </p>
                                                    <p><strong>Coverturas</strong> </p>
                                                    <p><strong>Colores naturales</strong> </p>
                                                    <p><strong>Pasteles</strong> </p>
                                                    <p><strong>Todas las tallas</strong></p>
                                                    </div>
                                                    <div class="panel-footer">
                                                    <h4>Desde</h4>
                                                    <h3>S/. 12.00</h3>
                                                    <!-- <button class="btn btn-lg">Sign Up</button> -->
                                            </div>
                                    </div>      
				</div>       
				<div class="col-sm-4 col-xs-12">
                                    <div class="panel panel-default text-center">
                                            <div class="panel-heading">
                                                    <h1>Conjuntos</h1>
                                            </div>
                                            <div class="panel-body">
                                                    <p><strong>Jersey</strong> </p>
                                                    <p><strong>Coverturas</strong> </p>
                                                    <p><strong>Colores naturales</strong> </p>
                                                    <p><strong>Pasteles</strong> </p>
                                                    <p><strong>Todas las tallas</strong></p>
                                                    </div>
                                                    <div class="panel-footer">
                                                    <h4>Desde</h4>
                                                    <h3>S/. 20.00</h3>
                                                    <!-- <button class="btn btn-lg">Sign Up</button> -->
                                            </div>
                                    </div>      
				</div>    
			</div>
		</div>
		
	</div>

	<!-- Container (Contact Section) -->
	<div id="contact" class="container-fluid bg-grey">
		<div class="container">
			<h2 class="text-center">CONTACT</h2>
			<div class="row">
				<div class="col-sm-5">
				<p>Contactenos y le responderemos lo más pronto posible, gracias.</p>
				<p><span class="glyphicon glyphicon-map-marker"></span> Lima, Perú</p>
				<p><span class="glyphicon glyphicon-phone"></span> +51 947 274 472</p>
				<p><span class="glyphicon glyphicon-envelope"></span> ventas@comercialmonely.com</p>
				</div>
				<div class="col-sm-7 slideanim">
				<div class="row">
					<div class="col-sm-6 form-group">
					<input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
					</div>
					<div class="col-sm-6 form-group">
					<input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
					</div>
				</div>
				<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
				<div class="row">
					<div class="col-sm-12 form-group">
					<button class="btn btn-default pull-right" type="submit">Enviar</button>
					</div>
				</div>
				</div>
			</div>
			
		</div>
	</div>

	<!-- Image of location/map -->
	<!-- <img src="/w3images/map.jpg" class="w3-image w3-greyscale-min" style="width:100%"> -->
	<iframe style="width:100%" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3901.5831325821027!2d-76.99265604904467!3d-12.072177545620042!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c639d444fdbf%3A0xea7c400e09e67f8!2sCalle%20Mariscal%20Andres%20de%20Sta.%20Cruz%20268%2C%20San%20Luis%2015022!5e0!3m2!1ses-419!2spe!4v1583972884525!5m2!1ses-419!2spe" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>

	<footer class="container-fluid text-center">
		<a href="#myPage" title="To Top">
			<span class="glyphicon glyphicon-chevron-up"></span>
		</a>
		<p>Derechos reservados por Jasson Polo  <a href="https://www.w3schools.com" title="Visit w3schools">www.myproduccion.com</a></p>
	</footer>


	
</body>
</html>