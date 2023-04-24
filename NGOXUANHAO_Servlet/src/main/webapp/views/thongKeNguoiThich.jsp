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
			<a href="thongKeLuotThich" class="tablinks mb-2">
			<i class="fas fa-heartbeat me-md-2"></i> Favorites
			</a>
			<a href="thongKeNguoiThich" class="tablinks active mb-2">
			<i class="fas fa-th-list me-md-2"></i> Favorite User
			</a>
			<a href="thongKeNguoiShare" class="tablinks mb-2">
			<i class="fas fa-share-square me-md-2"></i></i> Shared Friends
			</a>		

	</div>


	<div class="tabcontent">
		  <div class="container-fluid shadow-2 rounded"
			style="margin-top: 10px; margin-bottom: 40px; background-color: #1c1d1e">
		<form action="thongKeNguoiThich" method="post" style="padding: 10px;">

			<div class="input-group mb-3" style="width: 1000px">
				<select class="select" name="video" data-mdb-filter="true">
					<c:forEach var="option" items="${videos}">

						<option value="${option.id}">${option.title}</option>
					</c:forEach>
				</select>
				<button class="btn btn-success">Search</button>
			</div>



		</form>
		<table class="table table-bordered table-dark table-sm ">
			<thead>

				<tr>
					<th><strong>Username</strong></th>
					<th><strong>Fullname</strong></th>
					<th><strong>Email</strong></th>
					<th><strong>Favorite Date</strong></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="v" items="${test}">
					<tr>
						<td>${v[0]}</td>
						<td>${v[1]}</td>
						<td>${v[2]}</td>
						<td>${v[3]}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>
	</div>


</body>
</html>