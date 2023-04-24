<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${watch.title}</title>

<style type="text/css">
.card-title {
	line-height: 1.5rem;
	-webkit-box-orient: vertical;
	display: block;
	display: -webkit-box;
	overflow: hidden !important;
	text-overflow: ellipsis;
	-webkit-line-clamp: 2;
}
.button {

  border: none;
  color: white;
  padding: 8px 12px;
  cursor: pointer;
  border-radius: 8px;
 
}
</style>


</head>
<body>

	<div class="row">
		<article class="col-sm-8">

			<div class="row ">

				<div class="col-12 mb-4">
					<div class="ratio ratio-16x9">
						<iframe
							src="https://www.youtube.com/embed/${watch.id}?autoplay=1&mute=1"
							title="YouTube video"></iframe>
					</div>
				</div>
				<!--  -->
				<div class="col-12">
					<h4 style="color: white">${watch.title}</h4>


					<div class="row ">

						<div class="col-md-6">
							<p>${watch.views } views</p>
						</div>

						<div class="col-md-6">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="button" data-mdb-toggle="modal" data-mdb-target="#xxx" style="background-color: green">Share</button>
							 <c:choose>
				 <c:when test="${likeid.contains(watch.id)}">
				  <a href="unlikeWatch?v=${watch.id}" class="button" style="background-color: #101112; color: #e85d74"><i class="fas fa-heart fa-lg"></i></a>
				 </c:when>
				 <c:otherwise>
				  <a href="likeWatch?v=${watch.id}" class="button" style="background-color: #e85d74;"><i class="fas fa-heart fa-lg"></i></a>
				 </c:otherwise>
			   </c:choose>
				
							</div>
						</div>

					</div>


					<hr>
				</div>

				<div class="col-12">

						<p style="color: white;">${watch.description}</p>


				</div>

			</div>

	<!-- Share model -->
<div class="modal fade" id="xxx" tabindex="-1"  data-mdb-backdrop="static" aria-hidden="true">
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
<input type="text" name="link" class="form-control border border-0" value="${link }${watch.id}" id="myInput" readonly style="background: #101112; color: white">
<a class="btn btn-primary" onclick="copyText()" style="background: #101112;">Copy</a>

</div>
    </div>
    <div class="col-12">
 <label for="exampleInputPassword1" class="form-label text-light">Share by email:</label>
    <div class="input-group mb-3">
    <span class="input-group-text border border-0" id="basic-addon1" style="background-color: #101112"><i class="far fa-envelope"></i></span>
  <input type="email" name="emailTo" class="form-control border border-0" placeholder="Enter email" style="background-color: #101112; color: white"/>
   <button formaction="shareWatch?v=${watch.id}" class="btn btn-success btn-sm" style="background-color: #07bf67;">Send</button>
</div>

    </div>
    </form>
    </div>


    </div>
  </div>
</div>
		</article>

		<!-- danh sach video---------------------------------------------------- -->
		<aside class="col-sm-4">

			<div class="row">
			<div class="col-12">
			<h5 style="color: white"><i class="fas fa-history g-5" style="margin-right: 10px; color: white"></i>Watch History</h5>
			</div>
				<c:forEach var="v" items="${lichsu}">
					<div class="col-12">
               
						<div class="card mb-3" style="background-color: #101112">
							<div class="row g-2">
								<div class="col-md-6">
								 <a href="watch?v=${v.id}">
									<img src="views/images/${v.poster}"
										alt="Trendy Pants and Shoes" class="img-fluid rounded-start" />
										    </a>
								</div>
								<div class="col-md-6">
									

										<div class="card-title text-light fw-bold">${v.title }</div>


										<p class="card-text">
											<small class="text-muted">Last updated 3 mins ago</small>
										</p>
									
								</div>
							</div>
						</div>
               
					</div>
				</c:forEach>
			</div>

		</aside>
	</div>

</body>
</html>