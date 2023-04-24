<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Favourites List</title>
<style type="text/css">

<jsp:include page="css/trangYeuThich.css"></jsp:include>
</style>

</head>
<body>
	
    
    <div class="d-grid gap-2 d-md-flex" style="margin-bottom: 10px; margin-right: 10px;">
 
        <span class="fs-4">Favorites Lists</span>
    </div>
    
       	<div class="row gx-3">

		<c:forEach var="item" items="${listItem}">
			<div class="col-lg-3 col-md-6 mb-3">

				<div class="card" style="background-color: #101112">
					<div class="bg-image hover-overlay ripple"
						data-mdb-ripple-color="light">
						<img src="views/images/${item.poster}" class="img-fluid" style="height:200px; object-fit: cover;"/> 
						<a href="watch?v=${item.id}">
							<div class="hover-overlay">
								<div class="mask"
									style="background-color: rgba(255, 255, 255, 0.295)">

									<div
										class="d-flex justify-content-center align-items-center h-100">
										<i class="fas fa-play fa-6x" style="color: chartreuse"></i>
									</div>
								</div>

							</div>

						</a>
					</div>


					<div style="margin-top: 10px;">
						<span class="d-inline-block text-light text-truncate fs-6 fw-bold"
							style="width: 100%"> ${item.title} </span>


					</div>

					<div class="d-flex justify-content-between">
						<small>${item.views} views</small>
						<div>


<a href="unlike?v=${item.id}"><i class="fas fa-heart fa-lg text-muted p-md-1 my-1 me-0"></i></a>
							<i class="fas fa-share fa-lg text-muted p-md-1 my-1 me-2" data-mdb-toggle="modal" data-mdb-target="#x${item.id}"></i> 
							
						</div>
					</div>
				</div>

			</div>
	<!-- Share model -->
<div class="modal fade" id="x${item.id}" tabindex="-1"  data-mdb-backdrop="static" aria-hidden="true">
 <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content bg-dark text-light" style="padding: 10px;">
    <div class="row mb-2">
     <div class="col-6">
     <h5 class="modal-title" id="exampleModalLabel">Share video</h5>
     </div>
    <div class="col-6">
    <div class="d-flex justify-content-end"><button type="button" class="btn-close btn-close-white" data-mdb-dismiss="modal" aria-label="Close"></button></div>
    </div>
    </div>
    <div class="row" style="padding: 10px">
       <form action="shareIndex" method="post">
    <div class="col-12">
       <div class="input-group mb-3">
<input type="text" name="link" class="form-control border border-0" value="${link }${item.id}" id="myInput" readonly style="background: #101112; color: white">
<a class="btn btn-primary" onclick="copyText()" style="background: #101112;">Copy</a>

</div>
    </div>
    <div class="col-12">
 <label for="exampleInputPassword1" class="form-label text-light">Share by email:</label>
    <div class="input-group mb-3">
    <span class="input-group-text border border-0" id="basic-addon1" style="background-color: #101112"><i class="far fa-envelope"></i></span>
  <input type="email" name="emailTo" class="form-control border border-0" placeholder="Enter email" style="background-color: #101112; color: white"/>
   <button formaction="share?v=${item.id}" class="btn btn-success btn-sm" style="background-color: #07bf67;">Send</button>
</div>

    </div>
    </form>
    </div>


    </div>
  </div>
</div>
		</c:forEach>
	</div>



</body>
</html>