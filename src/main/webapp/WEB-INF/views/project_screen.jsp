<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	
	<head>
	  <title>Projects</title>
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
	  <script src="<c:url value="/resources/js/xeditable.js" />"> </script>
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
					Manage your projects in seconds!!
				</div>
			</div>
		
			<div class="row">
			<div class="box">
				<div class="col-md-12">
					<table class="table table-bordered table-hover table-condensed">
				       <thead>
				         <tr style="font-weight: bold">
				          <th style="width:30%"> Title </th>
				          <th style="width:40%"> Description </th>
				          <th style="width:15%"> Type</th>
				          <th style="width:15%"> Creation Date </th>
				         </tr>
				        </thead>
				        <tbody>
				        <c:forEach var="project" items="${projectDetails}">
				        <tr>
				          <td> <a href="viewProject?projectId=${project.projectId}&tenantId=${project.tenantId}"><c:out value="${project.projectName}"/> </a></td>
				          <td> <c:out value="${project.description}"/> </td>
				          <td> <c:out value="${project.tenantType}"/> </td>
				          <td> <c:out value="${project.creationDate}"/> </td>
				        </tr>
				        </c:forEach>
				       </tbody>
				     </table>
				</div>
				</div>
			</div>
			
			<form action="createProject" method="post">
				<div class="row">
				<div class="box">
					<div class="col-md-2" >
						<select id="projectType" name="projectType" class="form-control">
						    <c:forEach items="${tenantMap}" var="tenant">
						        <option value="${tenant.key}">${tenant.value}</option>
						    </c:forEach>
						</select>
					</div>
			
					<div class="col-md-5">
						<button type="submit" class="btn btn-default">Add New Project</button>
					</div>
				</div>
				</div>
			</form>
		</div>
		

	</body>
	
	  
	<script>
	</script>

</html>