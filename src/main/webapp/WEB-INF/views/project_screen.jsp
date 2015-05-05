<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	
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
					Manage your projects in seconds!!
				</div>
			</div>
		
			<div class="row">
				<div class="col-md-10">
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
			
			<form action="createProject" method="post">
				<div class="row">
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
			</form>
		</div>
		

	</body>
	
	  
	<script>
	</script>

</html>