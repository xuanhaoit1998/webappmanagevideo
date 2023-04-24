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
<title>Home</title>


</head>
<body>
	<div id="carouselExampleIndicators" class="carousel slide mb-4"
		data-mdb-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-mdb-target="#carouselExampleIndicators"
				data-mdb-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-mdb-target="#carouselExampleIndicators"
				data-mdb-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-mdb-target="#carouselExampleIndicators"
				data-mdb-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="card bg-dark text-white">
					<img src="views/images/ousama-ranking-header.jpg" class="card-img"
						alt="Stony Beach" style="height: 250px; object-fit: cover;"/>
					<div class="mask" style="background-color: rgba(0, 0, 0, 0.5)"></div>
					<div class="card-img-overlay">
						<h2 class="card-title">OUSAMA RANKING</h2>
						<p class="card-text" style="width: 500px;">
							<small>They call
								him "The Useless Prince" while jeering at his supposed
								foolishness. However, while Bojji may not be physically strong,
								he is certainly not weak of heart.
							</small><br>
						<div class="d-grid gap-2 d-md-flex justify-content-md-start">
							<button type="button" class="btn btn-success btn-rounded"
								data-mdb-ripple-color="#ffffff">
								<i class="fas fa-play me-md-2"></i>Watch Now
							</button>
						</div>
					
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="card bg-dark text-white">
					<img src="views/images/onepiece1.jpg" class="card-img"
						alt="onepiece" style="height: 250px; object-fit: cover;"/>
					<div class="mask" style="background-color: rgba(0, 0, 0, 0.6)"></div>
					<div class="card-img-overlay">
						<h2 class="card-title">ONE PIECE</h2>
						<p class="card-text" style="width: 500px;">
							<small>Gol D. Roger was known as the "Pirate King," the
								strongest and most infamous being<br> to have sailed the
								Grand Line. The capture and execution of Roger by the World
								Government brought a change throughout the world.
							</small> <br>
						<div class="d-grid gap-2 d-md-flex justify-content-md-start">
							<button type="button" class="btn btn-success btn-rounded"
								data-mdb-ripple-color="#ffffff">
								<i class="fas fa-play me-md-2"></i>Watch Now
							</button>
						</div>
					
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="card bg-dark text-white">
					<img src="views/images/conan-header.png" class="card-img"
						alt="onepiece" style="height: 250px; object-fit: cover;"/>
					<div class="mask" style="background-color: rgba(0, 0, 0, 0.6)"></div>
					<div class="card-img-overlay">
						<h2 class="card-title">DETECTIVE CONAN</h2>
						<p class="card-text" style="width: 500px;">
							Shinichi Kudo, a great mystery expert at only seventeen, is
							already well known for having solved several challenging cases. <br>One
							day, when Shinichi sees two suspicious men and decides to follow
							them.<br>
						<div class="d-grid gap-2 d-md-flex justify-content-md-start" style="padding-bottom: 20px">
							<button type="button" class="btn btn-success btn-rounded"
								data-mdb-ripple-color="#ffffff">
								<i class="fas fa-play me-md-2"></i>Watch Now
							</button>
						</div>
					
					</div>
				</div>
			</div>
		</div>

	</div>
	<!--Slide------------------------------------------------>



	<!-- Video ------------------------------------------------->

	<div class="d-grid gap-2 d-md-flex justify-content-center mb-4"
		style="margin-top: 50px">
		<i class="fas fa-newspaper fa-2x" style="color: #07bf67"></i> <span
			class="fs-5" style="color: white">Recently Released</span>
	</div>
	<div class="row gx-3">

		<c:forEach var="item" items="${listItem}">
			<div class="col-lg-3 col-md-6 mb-3">

				<div class="card border border-0 shadow-0 text-light" style="background: #101112">
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
						<span class="d-inline-block text-truncate fs-6 fw-bold"
							style="width: 100%"> ${item.title} </span>


					</div>

					<div class="d-flex justify-content-between">
						<small>${item.views} views</small>
						<div>
              <a data-mdb-toggle="modal" data-mdb-target="#x${item.id}"><i class="fas fa-share" ></i></a>
               <c:choose>
				 <c:when test="${likeid.contains(item.id)}">
				  <a href="unlikeIndex?v=${item.id }"><i class="fas fa-heart-broken fa-lg p-md-1 my-1 me-2" style="color: #e85d74"></i></a>
				 </c:when>
				 <c:otherwise>
				  <a href="likeIndex?v=${item.id}" data-mdb-toggle="modal" data-mdb-target="#${check }"><i class="fas fa-heart fa-lg p-md-1 my-1 me-0" style="color: white"></i></a>
				 </c:otherwise>
			   </c:choose>
			   

													
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
   <button formaction="shareIndex?v=${item.id}" class="btn btn-success btn-sm" style="background-color: #07bf67;">Send</button>
</div>

    </div>
    </form>
    </div>


    </div>
  </div>
</div>
</c:forEach>
	
	</div>
	<!-- Video ------------------------------------------------->


<div class="pagination">
  <a href="?page=1">&laquo;</a>
    <c:forEach var='p' begin="1" end="${totalPage}" step="1">
<c:choose>
		<c:when test="${p == page}">
			<li class="page-item" >
			<a class="active" href="?page=${p}">${p}</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item" >
			<a href="?page=${p}">${p}</a>
			</li>
		 </c:otherwise>
</c:choose>

   </c:forEach>
  <a href="?page=${totalPage}">&raquo;</a>
</div>
	<br>
	<hr>
	<!-- ------poster------------------ -->
	<div class="d-grid gap-2 d-md-flex justify-content-center mb-4"
		style="margin-top: 60px">
		<i class="fas fa-fire fa-2x" style="color: #07bf67"></i> <span
			class="fs-5" style="color: white">Trending Airing Series</span>
	</div>
	<div class="poster_hover" style="margin-bottom: 30px">
		<div class="row gx-3 ">

			<div class="col-lg-2 col-md-6">
				<div class="card border border-0 shadow-0" style="width: auto; background-color: #101112;">

					<div class="bg-image hover-shadow ripple">
						<img src="views/images/onepieceRed.webp" class="w-100 rounded-2" />
						<a href="xemVideo.jsp"> </a>
					</div>


					<div style="margin-top: 10px;">
						<span class="d-inline-block text-truncate fs-6 fw-bold"
							style="max-width: 300px; color: white">One Piece </span>


					</div>

					<div class="d-flex justify-content-between">
						<small>Fall 1999</small> <small><i
							class="fas fa-star text-muted p-md-1"> 8.8</i></small>

					</div>
				</div>
			</div>

			<div class="col-lg-2 col-md-6">
				<div class="card border border-0 shadow-0" style="width: auto; background-color: #101112;">

					<div class="bg-image hover-shadow ripple">
						<img src="views/images/conan25.webp" class="w-100 rounded-2"
							style="height-min: 300px" /> <a href="xemVideo.jsp"> </a>
					</div>


					<div style="margin-top: 10px;">
						<span class="d-inline-block text-truncate fs-6 fw-bold"
							style="max-width: 300px; color: white">Conan Detective</span>


					</div>

					<div class="d-flex justify-content-between">
						<small>Fall 1999</small> <small><i
							class="fas fa-star text-muted p-md-1"> 8.6</i></small>

					</div>
				</div>
			</div>

			<div class="col-lg-2 col-md-6">
				<div class="card border border-0 shadow-0" style="width: auto; background-color: #101112;">

					<div class="bg-image hover-shadow ripple">
						<img src="views/images/posternaruto.jpg" class="w-100 rounded-2" />
						<a href="xemVideo.jsp"> </a>
					</div>


					<div style="margin-top: 10px;">
						<span class="d-inline-block text-truncate fs-6 fw-bold"
							style="max-width: 300px; color: white"> Naruto </span>


					</div>

					<div class="d-flex justify-content-between">
						<small>Fall 1999</small> <small><i
							class="fas fa-star text-muted p-md-1"> 8.4</i></small>

					</div>
				</div>
			</div>

			<div class="col-lg-2 col-md-6">
				<div class="card border border-0 shadow-0" style="width: auto; background-color: #101112;">

					<div class="bg-image hover-shadow ripple">
						<img src="views/images/posterdoremon.jpg" class="w-100 rounded-2" />
						<a href="xemVideo.jsp"> </a>
					</div>


					<div style="margin-top: 10px;">
						<span class="d-inline-block text-truncate fs-6 fw-bold"
							style="max-width: 300px; color: white"> Doraemon </span>


					</div>

					<div class="d-flex justify-content-between">
						<small>1979-2005</small> <small><i
							class="fas fa-star text-muted p-md-1"> 8.1</i></small>

					</div>
				</div>
			</div>

			<div class="col-lg-2 col-md-6">
				<div class="card border border-0 shadow-0" style="width: auto; background-color: #101112;">

					<div class="bg-image hover-shadow ripple">
						<img src="views/images/posteroneman.jpg" class="w-100 rounded-2" />
						<a href="xemVideo.jsp"> </a>
					</div>


					<div style="margin-top: 10px;">
						<span class="d-inline-block text-truncate fs-6 fw-bold"
							style="max-width: 300px; color: white"> One Punch Man </span>


					</div>

					<div class="d-flex justify-content-between">
						<small>2015-2019</small> <small><i
							class="fas fa-star text-muted p-md-1"> 8.8</i></small>

					</div>
				</div>
			</div>

			<div class="col-lg-2 col-md-6">
				<div class="card border border-0 shadow-0" style="width: auto; background-color: #101112;">

					<div class="bg-image hover-shadow ripple">
						<img src="views/images/posterz.jpg" class="w-100 rounded-2" /> <a
							href="xemVideo.jsp"> </a>
					</div>


					<div style="margin-top: 10px;">
						<span class="d-inline-block text-truncate fs-6 fw-bold"
							style="max-width: 300px; color: white"> Dragon Ball Z </span>


					</div>
					<div class="d-flex justify-content-between">
						<small>1989-2003</small> <small><i
							class="fas fa-star text-muted p-md-1"> 8.8</i></small>

					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- ------pooter------------------------ -->



</body>
</html>