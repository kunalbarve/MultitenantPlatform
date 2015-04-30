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
		<div class="col-md-10" ng-controller="AddProjectController">
	  		 <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Project Name:</label>
			    <div class="col-sm-10">
			    <input type="text" ng-model="ProjectName" ng-disabled="!edit" placeholder="Project Name">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Project Description:</label>
			    <div class="col-sm-10">
			    <input type="text" ng-model="ProjectDescription" ng-disabled="!edit" placeholder="Project Description">
			    </div>
			  </div> 
			  <!-- SCRUM Fields -->
			  <hr>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Story Description:</label>
			    <div class="col-sm-10">
			    <input type="text" ng-model="StoryDescription" ng-disabled="!edit" placeholder="Story Description">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Story Points:</label>
			    <div class="col-sm-10">
			    <input type="text" ng-model="StoryPoints" ng-disabled="!edit" placeholder="Story Points">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Status:</label>
			    <div class="col-sm-10">
			    <input type="text" ng-model="Status" ng-disabled="!edit" placeholder="Status">
			    </div>
			  </div>
			  <!-- WATERFALL Fields -->
			  <hr>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Start Date:</label>
			    <div class="col-sm-10">
			    <input type="date" ng-model="StartDate" ng-disabled="!edit" placeholder="Start Date">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">End Date:</label>
			    <div class="col-sm-10">
			    <input type="date" ng-model="EndDate" ng-disabled="!edit" placeholder="End Date">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Resources:</label>
			    <div class="col-md-2" >
					<select id="resources" class="form-control">
						<option value="1">Resource 1</option>
						<option value="2">Resource 2</option>
						<option value="3">Resource 3</option>
					</select>
				</div>
			  </div>
			  <!-- KANBANIZE Fields-->
			  <hr>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Assigned To:</label>
			    <div class="col-md-2" >
					<select id="assigned-to" class="form-control">
						<option value="1">Resource 1</option>
						<option value="2">Resource 2</option>
						<option value="3">Resource 3</option>
					</select>
				</div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Card Status:</label>
			    <div class="col-md-2" >
					<select id="card-status" class="form-control">
						<option value="1">Assigned</option>
						<option value="2">In Progress</option>
						<option value="3">Complete</option>
					</select>
				</div>
			  </div>
			</form>
			
			<hr>
			<button class="btn btn-success" ng-disabled="error || incomplete">
			<span class="glyphicon glyphicon-save"></span>  Save
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