<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
  <head>
    <title>Login</title>
 
    <link href="<c:url value="/resources/stylesheets/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/stylesheets/bootstrap.min.css" />" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  </head>
  <body>
    <div ng-app="" ng-controller="personController" class="panel panel-primary">
      <!-- Default panel contents -->
        <div class="panel-heading">Login</div>
        <div class="panel-body">
           <form class="form-horizontal" role="form">
		               <div class="form-group  usernameDiv">
		                  <label class="inputUsername" class="col-sm-2 control-label pull-left">Enter your Email id</label>
		                  <div class="col-sm-10">
		                      <input type="email" ng-model="inputUsername" class="form-control" name="inputUsername" id="inputUsername" placeholder="Email Id">
		                  </div>
		               </div>
	                  <div class="form-group  usernameDiv">
	                    <label for="inputPassword">Password</label>
	                    <div class="col-sm-10">
	                      <input type="password" ng-model="inputPassword" class="form-control" name="inputPassword" id="inputPassword" placeholder="Password">
	                    </div>
	                  </div>
	                  
	                  <div class="form-group ">
	                    <div class="pull-left signIn">
	                      <button ng-click="signIn()" class="btn btn-primary">Sign in</button>
	                    </div>
	                  </div>
              </form>
        </div>
	</div>


	<script>
	function personController($scope,$http,$location) {
	    
		$scope.signIn = function() {
	    	$http({
	            method: 'POST',
	            url: '/signin',
	            data: { "username": $scope.inputUsername, "password": $scope.inputPassword }
	            
	         }).success(function(response){
	           
	            alert(JSON.stringify(response));
	            
	            if(response.login == "Success")
	           		window.location = '/successLogin';
	            else
	            	window.location = '/failLogin';
	        }).error(function(error){
	            alert("error");
	        });
	    };
	}
	</script>
 </body>
</html>