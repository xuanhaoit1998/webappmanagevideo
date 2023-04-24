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
<style type="text/css">
tr:hover{
background-color: #101112;
}

</style>
</head>
<body>

	<div class="tab">

		<strong>Editions</strong>
		<a href="quanLyUser" class="tablinks mb-2">
			<i class="fas fa-user me-md-2"></i> User editions
			</a>
	
			<a href="quanLyVideo" class="tablinks active mb-4">
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

	<div class="tabcontent">

		${danger } ${success}
		<p class="note note-success text-light"
			style="background-color: #1c1d1e; border-left: 3px solid #07bf67;">
			<strong>Video Information</strong><br>
			<x class="fw-normal">Change your information. </x>
		</p>
		<div class="container-fluid shadow-2 rounded"
			style="margin-top: 10px; margin-bottom: 40px; background-color: #1c1d1e">
			<form action="quanLyVideo"  method="post" enctype="multipart/form-data" style="padding: 10px;">
				<div class="row mb-3">
					<div class="col-4">
					<input class="custom-file-input" type="file" name="poster" accept="image/*" onchange="loadFile(event)" style="width:130px; background-color: #101112; color:white ">
						<div class="test">
						
                         <img class="file-image" id="output" src="views/images/${u.poster }"/>

						</div>

					</div>
					<div class="col-8">
						<label class="form-label text-light">Id video</label> 
						<input type="text" name="id" value="${u.id}" class="form-control border border-0 text-light mb-2" placeholder="Id video" ${readonly } required="required" style="background-color: #101112;" />
					    <label class="form-label text-light">Title</label> 
						<input type="text" name="title" value="${u.title}" class="form-control border border-0 text-light mb-2" placeholder="Title" required="required" style="background-color: #101112;" />
						<label class="form-label text-light">Active</label> <br> 
				        <label class="switch mb-3"> 
				        <input type="checkbox" name="active" value="true" ${u.active?"checked":""}> 
				        <span class="slider round"></span>
				        </label> <br>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col">
						<label class="form-label text-light">Description</label> 
						
						<textarea class="form-control border border-0 text-light" name="description" rows="3" placeholder="Fullname" style="background-color: #101112;">${u.description}</textarea>
					
					</div>
				
				</div>
				
				<button formaction="createVideo"
					class="btn btn-sm text-capitalize me-md-2" ${disCreate }
					style="background-color: #07bf67; color: white">Create</button>
				<button formaction="updateVideo"
					class="btn btn-sm text-capitalize me-md-2" ${disSave }
					style="background-color: #07bf67; color: white">Save</button>
				<a href="quanLyVideo" class="btn btn-sm text-capitalize"
					style="background-color: #07bf67; color: white">Reset</a>

			</form>
		</div>
		<p class="note text-light"
			style="background-color: #1c1d1e; border-left: 3px solid #07bf67;">
			<strong>Video List</strong><br>
			<x class="fw-normal">Entire list of videos</x>
		</p>
		<div class="container-fluid shadow-2 rounded"
			style="margin-top: 15px; margin-bottom: 15px; background-color: #1c1d1e; padding: 10px">
			<table class="table table-bordered text-light border-dark table-sm ">
				<thead>
					<tr>
					    <th scope="col">Poster</th>
						<th scope="col">Id Video</th>
						<th scope="col">Title</th>
						<th scope="col">Views</th>
						<th scope="col">Active</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<c:forEach var="video" items="${listVideo}">
					<tbody>
						<tr>
						<td> <img src="views/images/${video.poster }"/ style="height: 50px"></td>
							<td>${video.id }</td>
							<td>${video.title }</td>
							<td>${video.views }</td>
							<td>${video.active ? "True":"False" }</td>
							<td class="text-center"><a href="editVideo?v=${video.id}" ><i
									class="fas fa-pencil-alt"></i></a></td>
							<td class="text-center"><a data-mdb-toggle="modal"
								data-mdb-target="#${video.id}"><i class="fas fa-trash-alt"></i></a></td>
						</tr>
					</tbody>

					<!-- Model -->
					<div class="modal fade" id="${video.id}" tabindex="-1"
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
									<p>Are you sure you want to delete?</p>
								</div>

								<div class="row">
									<div class="d-flex justify-content-end">
										<button type="button" class="btn btn-secondary me-md-2"
											data-mdb-dismiss="modal" style="background-color: #303030">Close</button>

										<a href="deleteVideo?id=${video.id}" class="btn btn-primary"
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

	</div>

<script type="text/javascript">
var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
      URL.revokeObjectURL(output.src) // free memory
    }
  };
</script>
</body>
</html>