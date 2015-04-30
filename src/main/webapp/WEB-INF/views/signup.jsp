<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html ng-app="app">

<head>
  <title>Add Project</title>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
  <link href="<c:url value="/resources/css/xeditable.css" />" rel="stylesheet">
  <script src="<c:url value="/resources/js/xeditable.js" />"></script>

</head>

<body>

<header style="margin-bottom: 20px;">
<div style="background-color:gray; height: 100px; ">
</div>
</header>

<div class="container">
	<div class="row">
		<div style="color: darkgray; margin-bottom: 10px; " class="col-md-10">
		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
		</div>
	</div>

	<div class="row">
		<div class="col-md-10" ng-controller="SignUpController">
	  		<h3 ng-show="edit">Create New User:</h3>
			
			<form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">E-Mail:</label>
			    <div class="col-sm-10">
			    <input class="form-control" type="email" ng-model="EMail" ng-disabled="!edit" placeholder="E-Mail Id">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">First Name:</label>
			    <div class="col-sm-10">
			    <input class="form-control" type="text" ng-model="fName" ng-disabled="!edit" placeholder="First Name">
			    </div>
			  </div> 
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Last Name:</label>
			    <div class="col-sm-10">
			    <input class="form-control" type="text" ng-model="lName" ng-disabled="!edit" placeholder="Last Name">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Password:</label>
			    <div class="col-sm-10">
			    <input class="form-control" type="password" ng-model="passw1" placeholder="Password">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Repeat:</label>
			    <div class="col-sm-10">
			    <input class="form-control" type="password" ng-model="passw2" placeholder="Repeat Password">
			    </div>
			  </div>
			</form>
			
			<hr>
			<button class="btn btn-success" ng-disabled="error || incomplete">
			<span class="glyphicon glyphicon-save"></span>  Save Changes
			</button>

		</div>
	</div>

</div>

<footer style="margin-top: 50px;">
<div style="background-color:gray; height: 50px;">
<p style="text-align: center; padding: 15px;">© Copyright</p>
</div>
</footer>
    
    
   
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