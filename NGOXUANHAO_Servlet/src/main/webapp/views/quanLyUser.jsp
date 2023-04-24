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
		<a href="quanLyUser" class="tablinks active mb-2">
			<i class="fas fa-user me-md-2"></i> User editions
			</a>
	
			<a href="quanLyVideo" class="tablinks mb-4">
			<i class="fas fa-video me-md-2"></i> Video editions
			</a>
			<strong>Report</strong>
			<a href="thongKeLuotThich" class="tablinks mb-2">
			<i class="fas fa-heartbeat me-md-2"></i> Favorites
			</a>
			<a href="thongKeNguoiThich" class="tablinks mb-2">
			<i class="fas fa-th-list me-md-2"></i> Favorite User
			</a>
			<a href="thongKeNguoiShare" class="tablinks mb-2">
			<i class="fas fa-share-square me-md-2"></i></i> Shared Friends
			</a>		

	</div>


	<div id="user" class="tabcontent">
		${danger } ${success}
		<p class="note note-success text-light"
			style="background-color: #1c1d1e; border-left: 3px solid #07bf67;">
			<strong>Account Information</strong><br>
			<x class="fw-normal">Change your information. </x>
		</p>
		<div class="container-fluid shadow-2 rounded"
			style="margin-top: 10px; margin-bottom: 40px; background-color: #1c1d1e">
			<form action="quanLy" method="post" style="padding: 10px;">
				<div class="row mb-3">
					<div class="col">
						<label class="form-label text-light">Username</label> <input
							type="text" name="id" value="${u.id}"
							class="form-control border border-0 text-light"
							placeholder="Username" ${an} style="background-color: #101112;" />

					</div>
					<div class="col">
						<label class="form-label text-light">Password</label> <input
							type="password" name="password" value="${u.password}"
							class="form-control border border-0 text-light"
							placeholder="Password" style="background-color: #101112;" />
					</div>
				</div>
				<div class="row mb-2">
					<div class="col">
						<label class="form-label text-light">Fullname</label> <input
							type="text" name="fullname" value="${u.fullname}"
							class="form-control border border-0 text-light"
							placeholder="Fullname"
							style="background-color: #101112; border-color: red;" />
					</div>
					<div class="col">
						<label class="form-label text-light">Email</label> <input
							type="email" name="email" value="${u.email}"
							class="form-control border border-0 text-light"
							placeholder="Username" style="background-color: #101112;" />
					</div>
				</div>
				<label class="form-label text-light">Admin</label> <br> <label
					class="switch mb-3"> <input type="checkbox" name="admin"
					value="true" ${u.admin?"checked":""}> <span
					class="slider round"></span>
				</label> <br>
				<button formaction="createUser"
					class="btn btn-sm text-capitalize me-md-2" ${disCreate }
					style="background-color: #07bf67; color: white">Create</button>
				<button formaction="updateUser"
					class="btn btn-sm text-capitalize me-md-2" ${disSave }
					style="background-color: #07bf67; color: white">Save</button>
				<a href="quanLyUser" class="btn btn-sm text-capitalize"
					style="background-color: #07bf67; color: white">Reset</a>

			</form>
		</div>
		<p class="note text-light"
			style="background-color: #1c1d1e; border-left: 3px solid #07bf67;">
			<strong>Account List</strong><br>
			<x class="fw-normal">Entire list of users</x>
		</p>
		<div class="container-fluid shadow-2 rounded"
			style="margin-top: 15px; margin-bottom: 15px; background-color: #1c1d1e; padding: 10px">
			<table class="table table-bordered text-light border-dark table-sm ">
				<thead>
					<tr>
						<th scope="col">User</th>
						<th scope="col">Fullname</th>
						<th scope="col">Email</th>
						<th scope="col">Admin</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<c:forEach var="user" items="${list}">
					<tbody>
						<tr>
							<td>${user.id }</td>
							<td>${user.fullname }</td>
							<td>${user.email }</td>
							<td>${user.admin ? "Admin":"User" }</td>
							<td class="text-center"><a href="editUser?v=${user.id}"><i
									class="fas fa-pencil-alt"></i></a></td>
							<td class="text-center"><a data-mdb-toggle="modal"
								data-mdb-target="#${user.id}"><i class="fas fa-trash-alt"></i></a></td>
						</tr>
					</tbody>

					<!-- Model -->
					<div class="modal fade" id="${user.id}" tabindex="-1"
						aria-labelledby="exampleModalLabel" data-mdb-backdrop="static"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content bg-dark text-light"
								style="padding: 10px;">
								<div class="row mb-2">
									<div class="col-6">
										<h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
									</div>
									<div class="col-6">
										<div class="d-flex justify-content-end">
											<button type="button" class="btn-close btn-close-white"
												data-mdb-dismiss="modal" aria-label="Close"></button>
										</div>
									</div>
								</div>
								<div class="row">
									<p>Are you sure you want to delete ${user.id}?</p>
								</div>

								<div class="row">
									<div class="d-flex justify-content-end">
										<button type="button" class="btn btn-secondary me-md-2"
											data-mdb-dismiss="modal" style="background-color: #303030">Close</button>

										<a href="deleteUser?id=${user.id}" class="btn btn-primary"
											style="background-color: #07bf67">OK</a>

									</div>

								</div>

							</div>
						</div>
					</div>
				</c:forEach>

				<caption>Captions of the table</caption>

			</table>
		</div>


		<!------------------------------------- Quan ly nguoi dung ------------------------------------->
	</div>

	<div id="reports" class="tabcontent">
		

	</div>






</body>
</html>