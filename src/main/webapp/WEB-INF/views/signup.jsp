<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html ng-app="app">

<head>
  <title>Register</title>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
   <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/css/business-casual.css"/>" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
  
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
  <link href="<c:url value="/resources/css/xeditable.css" />" rel="stylesheet">
  <script src="<c:url value="/resources/js/xeditable.js" />"></script>

</head>

<body>

<header style="margin-bottom: 20px;">
<div style="height: 100px; ">
<div class="brand">Multitenant Project Managment</div>
<div class="address-bar">Makes Project Managment Easier</div>
</div>
</header>


<div class="container">
	<div class="row">
		<hr>
		<div style="color: white; margin-bottom: 10px; " class="col-md-10">
		Enter Your details!!
		</div>
	</div>

	<div class="row">
	<div class="box">
		<div class="col-md-12" ng-controller="SignUpController">
	  		<div align="center"><h3 ng-show="edit">Register</h3></div>
			
			<form class="form-horizontal" action="createUser" method="post">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">E-Mail:</label>
			    <div class="col-sm-10">
			    <input class="form-control" type="email" ng-model="email" id = "email" name = "email" placeholder="E-Mail Id">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">First Name:</label>
			    <div class="col-sm-10">
			    <input class="form-control" type="text" ng-model="firstName" name ="firstName" id= "firstName" placeholder="First Name">
			    </div>
			  </div> 
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Last Name:</label>
			    <div class="col-sm-10">
			    <input class="form-control" type="text" ng-model="lastName" name="lastName" id = "lastName" placeholder="Last Name">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Password:</label>
			    <div class="col-sm-10">
			    <input class="form-control" type="password" ng-model="password" id = "password" name = "password" placeholder="Password">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Confirm Password:</label>
			    <div class="col-sm-10">
			    <input class="form-control" type="password" ng-model="password2" id="password2" name="password2" placeholder="Repeat Password">
			    </div>
			  </div>
			
			
				<hr>
				<div align="center">
				<button class="btn btn-success" type="submit">
				<span class="glyphicon glyphicon-save"></span>  Sign Up
				</button>
			</div>
			</form>

		</div>
	</div>
	</div>

</div>


    
   
</body>

  
<script>
var app = angular.module("app", ["xeditable"]);

app.controller('SignUpController', function($scope, $filter, $http) {
	$scope.signin = function() {
		   
		   alert('-->> selected project type'+$scope.project_type);
	  }
});
</script>

</html>