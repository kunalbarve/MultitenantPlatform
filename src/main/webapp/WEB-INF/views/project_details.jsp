<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>

<head>
  <title>Projects</title>
  
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
  <link href="<c:url value="/resources/css/xeditable.css" />" rel="stylesheet">
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  
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
			 	<c:if test="${metadata.type == 'TA'}">
			 		<textarea id="${metadata.name}" class="form-control" name="${metadata.name}" form="addEditForm" placeholder="${metadata.name}"></textarea>
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == 'TB'}">
			 		<input id="${metadata.name}" class="form-control" type="text" name="${metadata.name}" placeholder="${metadata.name}" />
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == 'CB'}">
			 		<input id="${metadata.name}" type="checkbox" name="${metadata.name}" placeholder="${metadata.name}" />
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == 'DF'}">
			 		<input id="${metadata.name}" class="form-control" type="date" name="${metadata.name}" />
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == 'CR'}">
			 		 <input type="hidden" id="${metadata.name}" name="${metadata.name}" value=""/>
			 		 <select id="selectElement" data-val="${metadata.name}" class="form-control">
					  <c:forEach var="user" items="${metadata.comboMetadata}">
					  	<option value="${user}">${user}</option>
					  </c:forEach>
					</select> 
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == 'CO'}">
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
<div id="chart_div" style="margin-left :200px; width :600px">

</div>
<label hidden="true" id="graphData"> 
<c:out value="${graphData}"></c:out></label>
<label hidden="true" id="tenantdata"> 
<c:out value="${tenantId}"></c:out> 
</label>

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

<script type="text/javascript">
google.load('visualization', '1', {packages: ['corechart', 'line']});
/*  */
var dataArray;

var stringParser = function()
{
	var data = document.getElementById('graphData').innerHTML;
	
	dataArray = data.split(",");
	
	
	}

function drawLineChart() {
	stringParser();
    var data = new google.visualization.DataTable();
    data.addColumn('number', 'X');
    data.addColumn('number', 'Points');
    
    var a=parseInt(dataArray[0]);
    var b=parseInt(dataArray[1]);
    var c=parseInt(dataArray[2]);
    var d=parseInt(dataArray[3]);
    
	var dataString = "["+dataArray[0]+","+dataArray[1]+"],"+"["+dataArray[2]+","+dataArray[3]+"]";
	alert(dataString.trim());
    data.addRows([[a,b],[c,d]]);
     var options = {
      hAxis: {
        title: 'Days'
      },
      vAxis: {
        title: 'Points'
      },
      backgroundColor: '#f1f8e9'
    };

    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }

/*----------------------------------------------- BarChar -------------------------------*/
 
google.load('visualization', '1', {packages: ['corechart', 'bar']});
function drawStacked() {
	stringParser();
	var a=parseInt(dataArray[0]);
    var b=parseInt(dataArray[1]);
    var c=parseInt(dataArray[2]);
    alert(dataArray);
      var data = google.visualization.arrayToDataTable([
        ['Task Status', 'Number of Cards'],
        ['Not Started',a],
        ['In Progress', b],
        ['Complete', c]
         ]);

      var options = {
        title: 'No. of cards per status',
        chartArea: {width: '50%'},
        isStacked: true,
        hAxis: {
          title: 'Cards per status',
          minValue: 0,
        },
        vAxis: {
          title: 'Statuses'
        }
      };
      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }


/*----------------------------------------------- Time Line Chart -------------------------------*/


	google.load("visualization", "1", {packages:["timeline"]});
	 
	 function drawTimeLineChart() {
        var container = document.getElementById('chart_div');
        var chart = new google.visualization.Timeline(container);
        var dataTable = new google.visualization.DataTable();
		 dataTable.addColumn({ type: 'string', id: 'Task Names'});
        dataTable.addColumn({ type: 'date', id: 'Start' });
        dataTable.addColumn({ type: 'date', id: 'End' });
        var valuesObject = JSON.parse(document.getElementById('graphData').innerHTML);
        for (index = 0; index < valuesObject.graphDataList.length ; ++index) 
        {
        	dataTable.addRows([[valuesObject.graphDataList[index].task, new Date(valuesObject.graphDataList[index].startDate), new Date(valuesObject.graphDataList[index].endDate)]]);
        }
        	chart.draw(dataTable);
      }
  
	 
if(parseInt(document.getElementById('tenantdata').innerHTML) === 3)
{
	google.setOnLoadCallback(drawStacked);
}
else if(parseInt(document.getElementById('tenantdata').innerHTML) === 2)
{
	google.setOnLoadCallback(drawLineChart);
}
else
{
	google.setOnLoadCallback(drawTimeLineChart);
}
</script>


</html>