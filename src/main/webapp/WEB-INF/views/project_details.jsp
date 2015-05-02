<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page import="com.cmpe281.multitenant.Utility.*" %>

<html>

<head>
  <title>Projects</title>
  
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  
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
	<strong>Project Name : </strong> ${project.projectName} 
	</div>
	<div style="color: darkgray; margin-bottom: 10px; " class="col-md-5">
	<strong>Status :</strong>
	</div>
</div>

<div class="row">
	<div style="color: darkgray; margin-bottom: 10px; " class="col-md-10">
		View Your Project Details
	</div>
</div>

<div class="row">
	<div class="col-md-10">
		<table id="projectDetails" class="table table-striped table-bordered" cellspacing="0" width="100%">
	       <thead>
		         <tr style="font-weight: bold">
		         <c:forEach var="metadata" items="${project.metaDataList}">
			          <th> <c:out value="${metadata.name}"/></th>
		          </c:forEach>
		          <th style="width:20%">Edit/Delete</th>
		         </tr>
	        </thead>
	        <tbody>
	        	
		        <c:forEach var="dataRow" items="${project.data}">
		        	<tr id="${dataRow.dataId}">
		        	<c:forEach var="attribute" items="${dataRow.attributeValues}">
		        			<td id="${attribute.key}"> <c:out value="${attribute.value}"/> </td>
		        	</c:forEach>
		        	<td>
				        <div class="buttons">
				          <button class="btn btn-primary" onclick="editRecord('${dataRow.dataId}')" >Edit</button>
				          
				          	<a style="color:white;" href="deleteData?dataId=${dataRow.dataId}&projectId=${project.projectId}&tenantId=${project.tenantId}" >
				          		<button class="btn btn-danger">Delete </button>
				          	</a>
				         
				        </div>
				    </td>
		        	</tr>
		        </c:forEach>
	       </tbody>
	     </table>
	     <button id="addRecordBtn" class="btn btn-default">Add</button>
	</div>
</div>
  
</div>

<div id="addRecordContainer" class="container" style="display:none; margin-top:50px;">    
<div class="row">
	<div class="col-md-3">
	<form id="addEditForm" method="POST" action="saveData">
	<input type="hidden" id="tenantId" name="tenantId" value="${project.tenantId}"/>
	<input type="hidden" id="dataId" name="dataId" value=""/>
	<input type="hidden" id="projectId" name="projectId" value="${project.projectId}"/>
	
			<c:forEach var="metadata" items="${project.metaDataList}">
			 <div class="form-group">
			 	<label><c:out value="${metadata.name}"/> :</label>
			 	<c:if test="${metadata.type == ApplicationConstants.TEXT_AREA}">
			 		<textarea id="${metadata.name}" class="form-control" name="${metadata.name}" form="addEditForm" placeholder="${metadata.name}"></textarea>
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == ApplicationConstants.TEXT_BOX}">
			 		<input id="${metadata.name}" class="form-control" type="text" name="${metadata.name}" placeholder="${metadata.name}" />
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == ApplicationConstants.CHECK_BOX}">
			 		<input id="${metadata.name}" type="checkbox" name="${metadata.name}" placeholder="${metadata.name}" />
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == ApplicationConstants.DATA_FIELD}">
			 		<input id="${metadata.name}" class="form-control" type="date" name="${metadata.name}" />
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == ApplicationConstants.COMBO_USER}">
			 		 <input type="hidden" id="${metadata.name}" name="${metadata.name}" value=""/>
			 		 <select id="selectElement" data-val="${metadata.name}" class="form-control">
					  <c:forEach var="user" items="${metadata.comboMetadata}">
					  	<option value="${user}">${user}</option>
					  </c:forEach>
					</select> 
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == ApplicationConstants.COMBO_OTHER}">
			 		<input type="hidden" id="${metadata.name}" name="${metadata.name}" value=""/>
			 		<select id="selectElement" data-val="${metadata.name}" class="form-control">
					  <c:forEach var="item" items="${metadata.comboMetadata}">
					  	<option value="${item}">${item}</option>
					  </c:forEach>
					</select>
			 	</c:if>
			</div>
			</c:forEach>
			
			<div class="form-group">
				<button id="editBtn" type="button" class="btn btn-primary" style="display:none;" >Edit</button>
			   <button id="saveBtn" type="submit" class="btn btn-primary" >Save</button>
			   <button class="btn btn-danger" type="reset" >Cancel</button>
			</div>
			
		</form>
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
$(document).ready(function(){
		
	$("#editBtn").click(function() {
		$("#addEditForm").attr("action", "updateData");
		$("#addEditForm").submit();
	});
	
	$("#addRecordBtn").click(function() {
		$("#addRecordContainer").show();
	});
	
	$("#selectElement").each(function() {
		var valueT = $(this).val();
		var idT = $(this).attr("data-val");
		alert(valueT +" : "+ idT  );
		$("#addRecordContainer #"+idT).val(valueT);
	});
});

function editRecord(dataId) {
	$("#addRecordContainer").show();
	$("#addRecordContainer #dataId").val(dataId);
	
	$("#editBtn").show();
	$("#saveBtn").hide();
	
	var row = document.getElementById(dataId);
	var cells = row.getElementsByTagName('td');
	
    for (var i=0; i<cells.length-1; i++) {
        var attrId = cells[i].id;
        
        if($("#addRecordContainer #"+attrId).attr("type")=="date") {
        	alert("date");
        	$("#addRecordContainer #"+attrId).val(new Date(cells[i].textContent));
        } else if ($("#addRecordContainer #"+attrId).attr("type")=="checkbox") {
        	alert("checkbox" + attrId);
        	if(cells[i].textContent != null) {
        		$("#addRecordContainer #"+attrId).prop('checked', true);
        	} else {
        		$("#addRecordContainer #"+attrId).prop('checked', false);
        	}
        } else {
        	alert("others");
        	$("#addRecordContainer #"+attrId).val(cells[i].textContent);
        }
        
        
    }
	
}
</script>


</html>