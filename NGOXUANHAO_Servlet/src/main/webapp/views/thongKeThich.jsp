<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manager</title>

</head>
<body>

	<div class="tab">

		<strong>Editions</strong>
		<a href="quanLyUser" class="tablinks mb-2">
			<i class="fas fa-user me-md-2"></i> User editions
			</a>
	
			<a href="quanLyVideo" class="tablinks mb-4">
			<i class="fas fa-video me-md-2"></i> Video editions
			</a>
			<strong>Report</strong>
			<a href="thongKeLuotThich" class="tablinks active mb-2">
			<i class="fas fa-heartbeat me-md-2"></i> Favorites
			</a>
			<a href="thongKeNguoiThich" class="tablinks mb-2">
			<i class="fas fa-th-list me-md-2"></i> Favorite User
			</a>
			<a href="thongKeNguoiShare" class="tablinks mb-2">
			<i class="fas fa-share-square me-md-2"></i></i> Shared Friends
			</a>		

	</div>


	<div class="tabcontent">
		 	<div class="container-fluid shadow-2 rounded"
			style="margin-top: 10px; margin-bottom: 40px; background-color: #1c1d1e">
		<form action="thongKeLuotThich" method="post" style="padding: 10px;">

			<div class="input-group mb-3" style="width: 500px">
				<select class="select" name="year" data-mdb-filter="true">
					<c:forEach var="option" items="${years}">

						<option value="${option}">${option}</option>
					</c:forEach>
				</select>
				<button class="btn btn-success">Search</button>
			</div>



		</form>
		<table class="table table-bordered table-dark table-sm ">
			<thead>

				<tr>
					<th><strong>Title</strong></th>
					<th><strong>Favorite count</strong></th>
					<th><strong>Newest date</strong></th>
					<th><strong>Onlest date</strong></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${items}">
					<tr>
						<td>${item.group}</td>
						<td>${item.likes}</td>
						<td>${item.toStringNew()}</td>
						<td>${item.toStringOld()}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>
	</div>


</body>
</html>