<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>

<head>
  <title>Project Details</title>
  
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  
  <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/css/business-casual.css"/>" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	  
	  
  
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
  <link href="<c:url value="/resources/css/xeditable.css" />" rel="stylesheet">
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  
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
<hr/>
	<div style="color: white; margin-bottom: 10px; " class="col-md-5">
	<strong>Project Name : </strong> ${project.projectName} 
	</div>
	<div style="color: white; margin-bottom: 10px; " class="col-md-5">
	<strong>Status :</strong> <c:out value="${ProjectStatus}"></c:out>
	</div>
</div>

<div class="row">
	<div style="color: white; margin-bottom: 10px; " class="col-md-10">
		View Your Project Details
	</div>
</div>

<div class="row">
	<div class="box">
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
		        			<td id="${attribute.key}"> <c:out value="${empty attribute.value ? 'No Value' : attribute.value}"/> </td>
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
  
</div>

<div id="addRecordContainer" class="container" style="display:none; margin-top:50px;">    
<div class="row">
<div class="box">
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
			 		<input id="${metadata.name}" type="checkbox" name="${metadata.name}" placeholder="${metadata.name}" checked/>
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == 'DF'}">
			 		<input id="${metadata.name}" class="form-control" type="text" name="${metadata.name}" placeholder="mm/dd/yyyy"/>
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == 'CR'}">
			 		 <input type="hidden" id="${metadata.name}" name="${metadata.name}" class="form-control" value=""/>
			 		 <select id="selectElement1" data-val="${metadata.name}" class="form-control">
					  <c:forEach var="user" items="${metadata.comboMetadata}">
					  	<option value="${user}">${user}</option>
					  </c:forEach>
					</select> 
			 	</c:if>
			 	
			 	<c:if test="${metadata.type == 'CO'}">
			 		<input type="hidden" id="${metadata.name}" name="${metadata.name}" class="form-control" value=""/>
			 		<select id="selectElement2" data-val="${metadata.name}" class="form-control">
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
			   <button id="cancelBtn" class="btn btn-danger" type="button" >Cancel</button>
			</div>
			
		</form>
	</div> 
</div>
</div>
</div>

<div class="row">
<div class="box">    
<div id="chart_div" style="margin-left :200px; width :600px">
</div>
</div>

</div>
<label hidden="true" id="graphData"> 
<c:out value="${graphData}"></c:out></label>
<label hidden="true" id="tenantdata"> 
<c:out value="${tenantId}"></c:out> 
</label>

</body>


<script>

	$(document).ready(function() {

		$("#editBtn").click(function() {
			$("#addEditForm").attr("action", "updateData");
			$("#addEditForm").submit();
		});

		$("#addRecordBtn").click(function() {
			$('#addEditForm')[0].reset();
			$("#editBtn").hide();
			$("#saveBtn").show();
			$("#addRecordContainer").show();
		});

		$("#cancelBtn").click(function() {
			$("#addRecordContainer").hide();
		});


		$('#addEditForm input[type="checkbox"]').each(function(){
		     if($(this).attr('checked')){
		          $(this).val('Complete');
		          //alert("in checked");
		     }else{
		    	 //alert("in unchecked");
		          $(this).val('Not Complete');
		     }
		});
		
		$('#addEditForm input[type="checkbox"]').change(function(){
		     if($(this).attr('checked')){
		    	 //alert("in checked");
		    	  $(this).prop('checked', false);
		          $(this).val('Not Complete');
		     }else{
		    	 //alert("in unchecked");
		    	 $(this).prop('checked', true);
		          $(this).val('Complete');
		     }
		});
		
		$("#addRecordContainer").find("#selectElement2").each(function() {
			var valueT = $(this).val();
			var idT = $(this).attr("data-val");
			//$("#addRecordContainer #"+idT).val(valueT);
			$("[id='" + idT + "']").val(valueT);
			//alert($("[id='" + idT + "']").val());
		});

		$("#addRecordContainer").find("#selectElement2").change(function() {
			var valueT = $(this).val();
			var idT = $(this).attr("data-val");
			//alert("in change funcrtion");
			//$("#addRecordContainer #"+idT).val(valueT);
			$("[id='" + idT + "']").val(valueT);
			//alert($("[id='" + idT + "']").val());
		});

		$("#addRecordContainer").find("#selectElement1").each(function() {
			var valueT = $(this).val();
			var idT = $(this).attr("data-val");
			//$("#addRecordContainer #"+idT).val(valueT);
			$("[id='" + idT + "']").val(valueT);
			//alert($("[id='" + idT + "']").val());
		});

		$("#addRecordContainer").find("#selectElement1").change(function() {
			var valueT = $(this).val();
			var idT = $(this).attr("data-val");
			//alert("in change funcrtion");
			//$("#addRecordContainer #"+idT).val(valueT);
			$("[id='" + idT + "']").val(valueT);
			//alert($("[id='" + idT + "']").val());
		});
	});

	function editRecord(dataId) {
		$("#addRecordContainer").show();
		$("#addRecordContainer #dataId").val(dataId);

		$("#editBtn").show();
		$("#saveBtn").hide();

		var row = document.getElementById(dataId);
		var cells = row.getElementsByTagName('td');

		for (var i = 0; i < cells.length - 1; i++) {
			var attrId = cells[i].id;
			//alert("attrId : "+attrId);
			if ($("#addRecordContainer #" + attrId).attr("type") == "checkbox") {
				//alert("checkbox" + attrId);
				if ($.trim(cells[i].textContent) == "Complete") {
					$("#addRecordContainer #" + attrId).prop('checked', true);
					$("#addRecordContainer #" + attrId).val($.trim(cells[i].textContent));
				} else if ($.trim(cells[i].textContent) == "Not Complete") {
					$("#addRecordContainer #" + attrId).prop('checked', false);
					$("#addRecordContainer #" + attrId).val($.trim(cells[i].textContent));
				}
			} else {
				//alert(cells[i].id + " : others : " + cells[i].textContent);
				$("#addEditForm").find(".form-control").each(function() {
					var temp = $(this).attr("id");
					if (temp == cells[i].id) {
						$(this).val($.trim(cells[i].textContent));
					}
				});

				$("#selectElement1 option[value='"
								+ $.trim(cells[i].textContent) + "']").prop('selected', true);
				$("#selectElement2 option[value='"
								+ $.trim(cells[i].textContent) + "']").prop('selected', true);
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
	//alert(dataString.trim());
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
    //alert(dataArray);
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
        //alert(valuesObject.graphDataList[1].task);
        for( var index = 0; index < valuesObject.graphDataList.length; index++) {
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