<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html ng-app="app">

<head>
  <title>Projects</title>
  
  
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
  <link href="<c:url value="/resources/css/xeditable.css" />" rel="stylesheet">
  <script src="<c:url value="/resources/js/xeditable.js" />"> </script>
  
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
	<div class="col-md-10" ng-controller="ProjectScreenController">
	  <table class="table table-bordered table-hover table-condensed">
	    <tr style="font-weight: bold">
	      <td style="width:15%">ID</td>
	      <td style="width:40%">Name</td>
	      <td style="width:20%">Group</td>
	    </tr>
	    <tr ng-repeat="project in projects">
	      <td>
	        
	        <span editable-text="project.id" e-name="id" e-form="rowform" e-required>
	          {{ project.id || 'empty' }}
	        </span>
	      </td>
	      <td>
	        
	        <span editable-text="project.name" e-name="name" e-form="rowform" e-required>
	          {{ project.name || 'empty' }}
	        </span>
	      </td>
	      <td>
	        
	        <span editable-text="project.group" e-name="group" e-form="rowform" e-required>
	          {{ project.groupName || 'empty' }}
	        </span>
	      </td>
	    </tr>
	  </table>
	</div>
	</div>
	
	<div class="row" ng-controller="AddProjectController">
		<div class="col-md-2" >
			<select id="project-type" class="form-control" ng-change="update()">
				<option value="scrum">Scrum</option>
				<option value="waterfall">Waterfall</option>
				<option value="kanbanize">Kanbanize</option>
			</select>
		</div>
		<div class="col-md-5">
			<button class="btn btn-default" ng-click="addProject()">Add Project</button>
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

app.controller('ProjectScreenController', function($scope, $filter, $http) {
  $scope.projects = [
    {id: 'ID_1', name: 'Project 1', groupName: 'Scrum'},
    {id: 'ID_2', name: 'Project 2', groupName: 'Waterfall'},
    {id: 'ID_3', name: 'Project 3', groupName: 'Kanbanize'}
  ]; 
});

app.controller('AddProjectController', function($scope, $filter, $http) {
  $scope.project_type = "";
  
  $scope.update = function() {
	   $scope.project_type = $scope.selectedItem.code
	   alert('-->> selected project type'+$scope.project_type);
  }

  $scope.addProject = function() {
    $location.path('/add_project.ejs').search('type='+$scope.project_type);
  };
});

</script>

</html>