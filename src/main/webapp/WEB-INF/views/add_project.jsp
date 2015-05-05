<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
	  <title>Create Project</title>
	  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
	  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
	  <link href="<c:url value="/resources/css/xeditable.css" />" rel="stylesheet">
	  <script src="<c:url value="/resources/js/xeditable.js" />"></script>
	</head>

	<body>
	
		<header style="margin-bottom: 20px;">
			<div style="background-color:gray; height: 100px; "></div>
		</header>
		
		<div class="container">
			
			<div class="row">
				<div style="color: darkgray; margin-bottom: 10px; " class="col-md-10">
					Create a new project with ease.
				</div>
			</div>
		
			<div class="row">
				<div class="col-md-10">
			  		 <form class="form-horizontal" action="saveProject" method="post">
			  		 		<hr>
			  		 	  	<input type="hidden" id="userId" name="userId" value="${user}">
			  		 		<input type="hidden" id="tenantId" name="tenantId" value="${tenantId}">
			  		 		
						  <div class="form-group">
						    <label class="col-sm-2 control-label">Project Name:</label>
						    <div class="col-sm-10">
						    	<input type="text" id= "projectName" name="projectName" placeholder="Project Name">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label class="col-sm-2 control-label">Description:</label>
						    <div class="col-sm-10">
						    <input type="text" id="description" name="description" placeholder="Project Description">
						    </div>
						  </div>
						  
						   <div class="form-group">
						    <label class="col-sm-2 control-label">Project Type:</label>
						    <div class="col-sm-10">
						    <input type="text" id="tenantType" value="${tenantType}" readonly="readonly" name="tenantType">
						    </div>
						  </div>  
						  
						  <!-- SCRUM Fields -->
						  <c:if test="${tenantId == 2}">
							  <hr>
							  <div class="form-group">
							    <label class="col-sm-2 control-label">Sprint Name:</label>
							    <div class="col-sm-10">
							    <input type="text" id="sprintName" name="sprintName" placeholder="Sprint Name">
							    </div>
							  </div>
							  <div class="form-group">
							    <label class="col-sm-2 control-label">Start Date:</label>
							    <div class="col-sm-10">
							    <input type="text" id="startDate" name="startDate" placeholder="Start Date in mm/dd/yyyy format">
							    </div>
							  </div>
							  <div class="form-group">
							    <label class="col-sm-2 control-label">Duration:</label>
							    <div class="col-sm-10">
							    <input type="text" id="duration" name="duration" placeholder="Number of days">
							    </div>
							  </div>	   
						  </c:if>

						<button type="submit" class="btn btn-success" >
							<span class="glyphicon glyphicon-save"> Create</span>
						</button>  
					</form>
					
				</div>
			</div>
		
		</div>
		
   
	</body>
	
	  
	<script>
	</script>

</html>