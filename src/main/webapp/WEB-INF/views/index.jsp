<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Multitenant Project Managment</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/css/business-casual.css"/>" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="brand">Multitenant Project Managment</div>
    <div class="address-bar">Makes Project Managment Easier</div>

    <div class="container">
		<div style="float:right">
		<form action="signIn" method="post">
		<legend style="color:white;">Sign In</legend>
		<input type="email" placeholder="email" ng-model="userName" value="" id="userName" name="userName" autofocus tabindex="1" size="20" data-ime-mode-disabled>
		<input type="password" placeholder="password" ng-model="password" value="" id="password" name="password" tabindex="2" size="20">
		<button type="submit" class="btn btn-primary navbar-btn" id="signIn" name="signIn">Sign in</button>
		<a href="signup">Sign up</a>
		</form>
		</div>
	</div>
<br>
    <div class="container">

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12 text-center">
                    <div id="carousel-example-generic" class="carousel slide">
                        <!-- Indicators -->
                        <ol class="carousel-indicators hidden-xs">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="img-responsive img-full" src="<c:url value="/resources/img/slide-1.jpg"/>" style="height:400px;width:55px;" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="<c:url value="/resources/img/slide-2.jpg"/>" style="height:400px;width:55px;" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="<c:url value="/resources/img/slide-3.jpg"/>" style="height:400px;width:55px;" alt="">
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>
                  </div>
            </div>
        </div>
</div>

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Multiple Project Managment models Under One Roof
                        <br><strong>worth trying</strong>
                    </h2>
                    <hr>
                   <div align="center">We provide our users the capability to manage their projects. The twist being that the projects of different methodologies 
                    can be managed under one roof. Currently we support Waterfall, Scrum and Kanban methodologies. Users can create projects, 
                    manage them and view their status too.</div>
                    <hr>
                    <h3 style="text-align: center;">Signup to learn more</h3>
                </div>
            </div>
        </div>

        

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">About Us</h2>
                    <hr>
                    <div class="row" align="center">
					  <div class="col-sm-4">
					  <figure>
						  <img style="height:200px;width:200px;border-radius: 25px; border: 2px solid black;" src="<c:url value="/resources/img/divya.jpg"/>"  alt="Divya" width="304" height="228">
						  <figcaption><strong>Divya</strong></figcaption>
					  </figure>
					</div>
					  <div class="col-sm-4">
					 	<figure>
						  <img style="height:200px;width:200px;border-radius: 25px; border: 2px solid black;" src="<c:url value="/resources/img/kunal.jpg"/>"  alt="Kunal" width="304" height="228">
						  <figcaption><strong>Kunal</strong></figcaption>
						</figure>
					  </div>
					  <div class="col-sm-4">
					  <figure>
					   <img style="height:200px;width:200px;border-radius: 25px; border: 2px solid black;" src="<c:url value="/resources/img/komal.jpg"/>"  alt="Komal" width="304" height="228">
					   <figcaption><strong>Komal</strong></figcaption>
					  </figure>
					  </div>
					</div>
					<br>
					<div class="row" align="center">
					  <div class="col-xs-6">
					  <figure>
					  <img style="height:200px;width:200px;border-radius: 25px; border: 2px solid black;" src="<c:url value="/resources/img/rutvik.jpg"/>"  alt="Rutvik" width="304" height="228">
					  <figcaption><strong>Rutvik</strong></figcaption>
					  </figure>
					  </div>
					  <div class="col-xs-6">
						<figure>
						  <img style="height:200px;width:200px;border-radius: 25px; border: 2px solid black;" src="<c:url value="/resources/img/vishwa.jpg"/>"  alt="Vishwa" width="304" height="228">
						  <figcaption><strong>Vishwa</strong></figcaption>
						</figure>
					  </div>
					  </div>
                   		<hr>
					  <div align=center><p>We started this project with an idea introduced to us by our Professor Ngyuen at SJSU. We would like to thank him for this 
					  opportunity which bought humongous benifits to each of us.</p></div>
                   </div>
            </div>
            </div>
        </div>
	    <!-- /.container -->

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>Copyright &copy;<br> multitenantapplication-projectmanagment.rhcloud.com</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="<c:url value="/resources/js/jquery.js" />"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>
<!--     
    <script type="text/javascript">
    $("#signIn").click( function()
    {
    		$.ajax({
    		url: "signIn",
    		type : "POST",
    		data: { userName: $("#inputUsername").val(), password: $("#inputPassword").val() },
    		success: function(data,textStatus,xhr){
    			
    				window.location= xhr.getResponseHeader("Location");
    			
    		}
    		
    	
    }); 
    	});
    
    </script> -->

</body>
</html>

