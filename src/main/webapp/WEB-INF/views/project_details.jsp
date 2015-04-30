<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html ng-app="app">

<head>
  <title>Projects</title>
  
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script src="<c:url value="/resources/js/xeditable.js" />"></script>
  
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
  <link href="<c:url value="/resources/css/xeditable.css" />" rel="stylesheet">
  
</head>


<body>

<header style="margin-bottom: 20px;">
<div style="background-color:gray; height: 100px; ">
</div>
</header>

<div class="container">
<div class="row">
	<div style="color: darkgray; margin-bottom: 10px; " class="col-md-5">
	<strong>Project Name :</strong> ________________
	</div>
	<div style="color: darkgray; margin-bottom: 10px; " class="col-md-5">
	<strong>Status :</strong> ________________
	</div>
</div>

<div class="row">
	<div style="color: darkgray; margin-bottom: 10px; " class="col-md-10">
	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
	</div>
</div>

<div class="row">
<div class="col-md-10" ng-controller="ProjectDetailsController">
  <table class="table table-bordered table-hover table-condensed">
    <tr style="font-weight: bold">
      <td style="width:20%">Attrib 1</td>
      <td style="width:20%">Attrib 2</td>
      <td style="width:20%">Attrib 3</td>
      <td style="width:20%">Attrib 4</td>
      <td style="width:20%">Edit/Delete</td>
    </tr>
    <tr ng-repeat="record in records">
      <td>
        <span editable-text="record.id" e-name="id" e-form="rowform" e-required>
          {{ 'attrib 1 val' }}
        </span>
      </td>
      <td>
        <span editable-text="record.id" e-name="id" e-form="rowform" e-required>
          {{ 'attrib 2 val' }}
        </span>
      </td>
      <td>
        <span editable-text="record.id" e-name="id" e-form="rowform" e-required>
          {{ 'attrib 3 val' }}
        </span>
      </td>
      <td>
        <span editable-text="record.id" e-name="id" e-form="rowform" e-required>
          {{ 'attrib 4 val' }}
        </span>
      </td>
      <td>
        <form editable-form name="rowform" onbeforesave="saveRecord($data, record.id)" ng-show="rowform.$visible" class="form-buttons form-inline" shown="inserted == record">
          <button type="submit" ng-disabled="rowform.$waiting" class="btn btn-primary">
            Save
          </button>
          <button type="button" ng-disabled="rowform.$waiting" ng-click="rowform.$cancel()" class="btn btn-default">
            Cancel
          </button>
        </form>
        <div class="buttons" ng-show="!rowform.$visible">
          <button class="btn btn-primary" ng-click="rowform.$show()">Edit</button>
          <button class="btn btn-danger" ng-click="removeUser($index)">Delete</button>
        </div>
      </td>
    </tr>
  </table>

  <button class="btn btn-default" ng-click="addRecord()">Add</button>
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

app.controller('ProjectDetailsController', function($scope, $filter, $http) {
  $scope.records = [
    {id: 'ID_1'},
    {id: 'ID_2'},
    {id: 'ID_3'},
    {id: 'ID_4'},
    {id: 'ID_5'}
  ];

  $scope.saveRecord = function(data, id) {
    angular.extend(data, {id: id});
    return $http.post('/saveRecord', data);
  };

  // remove record
  $scope.removeRecord = function(index) {
    $scope.records.splice(index, 1);
  };

  // add record
  $scope.addRecord = function() {
    $scope.inserted = {
      id: 'ID_'+($scope.records.length+1)
    };
    $scope.records.push($scope.inserted);
  };
});
</script>


</html>