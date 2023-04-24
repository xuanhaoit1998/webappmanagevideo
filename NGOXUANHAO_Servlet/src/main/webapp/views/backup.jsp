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
<style type="text/css">

body {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
}

#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
}
</style>
<style type="text/css">
<jsp:include page="/views/css/toast.css"></jsp:include>
<jsp:include page="/views/css/sideCSS.css"></jsp:include>
<jsp:include page="/views/css/index.css"></jsp:include>
<jsp:include page="/views/css/loader.css"></jsp:include>
</style>

<script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>

<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min.css" rel="stylesheet" />
<!-- MDB -->
</head>
<body onload="myFunction2()" id="body">

	<header>

		<!-- Navbar-->
		<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-2 fixed-top" style="height: 55px">
			<div class="container-fluid justify-content-between"
				style="margin-left: 20px;">
				<!-- Left elements -->

				<div class="d-flex my-2 my-sm-0">
					<a class="navbar-brand me-5 mb-1 d-flex justify-content-center"
						href="#"> <i class="fas fa-bars" id="btn_open"></i>


					</a>

					<!-- Search form -->
					<a class="navbar-brand me-2 mb-1 d-flex justify-content-center"
						href="index.jsp"> <img src="views/images/logo.png" height="20"
						alt="MDB Logo" loading="lazy" style="margin-top: 3px;" />
					</a>
				</div>




				<!-- Left elements -->

				<!-- Center elements -->
				
				<div class="card shadow-0 border" style="width: 400px">
			    <div class="input-group">
             <input type="search" class="form-control border border-0 bg-light" placeholder="Search" />
             <button type="button" class="btn btn-light shadow-0 border border-0">
             <i class="fas fa-search"></i>
             </button>
             </div>
				</div>

				
				<!-- Center elements -->

				<!-- Right elements -->

				<ul class="navbar-nav flex-row">

					<div class="d-flex align-items-center">
						<li class="nav-item me-3 me-lg-3">
                               
                                <c:if test="${user.getAdmin()==true}">
	                                <li class="nav-item me-3 me-lg-3"><a href="quanLy.jsp"><button
									type="button" class="btn btn-dark btn-sm"
									style="background-color: #07bf67;">Admin management</button></a></li>
									</c:if>
								<c:if test="${user.getId()==null}">
								<li class="nav-item me-3 me-lg-3"><a href="login"><button
									type="button" class="btn btn-outline-success text-capitalize btn-sm border border-success"
									data-mdb-ripple-color="dark">Sign In</button></a></li>
								</c:if>
<%-- 						<li class="nav-item me-3 me-lg-3"><a href="login"><button
									type="button" class="btn btn-outline-success btn-sm"
									data-mdb-ripple-color="dark">${user.getId() }</button></a></li> --%>
					</div>
             <c:if test="${user.getId()!=null}">
					 <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle hidden-arrow"
                href="#"
                id="navbarDropdownMenuLink"
                role="button"
                data-mdb-toggle="dropdown"
                aria-expanded="false"
              >
              <img
              src="views/images/avt.jpg"
              class="rounded-circle"
              height="32"
              loading="lazy"
            />
              </a>
              <ul
                class="dropdown-menu dropdown-menu-end"
                aria-labelledby="navbarDropdownMenuLink"
              >
              <li>
                <a class="dropdown-item" href="thongTin.html">Thông tin</a>
              </li>
              <li>
                <a class="dropdown-item" href="thongTin.html">Đổi mật khẩu</a>
              </li>
              <li>
                <a class="dropdown-item" href="logout">Đăng xuất</a>
              </li>
              </ul>
            </li>
            </c:if>
				</ul>
				<!-- Right elements -->
			</div>
		</nav>
		<!-- Navbar -->
	</header>
	<!-- side-------------------------------------------------------------------------------------- -->
	<div class="menu__side" id="menu_side">


		<div class="options__menu">

			<a href="index.jsp" class="selected">
				<div class="option">
					<i class="fas fa-home" title="Inicio"></i>
					<h4>Home</h4>
				</div>
			</a> <a href="trangYeuThich.jsp">
				<div class="option">
					<i class="fas fa-heart" title="Portafolio"></i>
					<h4>Favourite</h4>
				</div>
			</a> <a href="doiThongTin.jsp">
				<div class="option">
					<i class="fas fa-user" title="Cursos"></i>
					<h4>Account</h4>
				</div>
			</a> <a href="#">
				<div class="option">
					<i class="fas fa-fire-alt" title="Blog"></i>
					<h4>Trending</h4>
				</div>
			</a> <a href="#">
				<div class="option">
					<i class="fas fa-newspaper" title="Contacto"></i>
					<h4>Recents</h4>
				</div>
			</a>

		</div>

	</div>
	<!-- side-------------------------------------------------------------------------------------- -->
	<main>
		<div id="loader"></div>
		<div style="display: none;" id="myDiv" class="animate-bottom">
		<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
			<!-- share------------------------------------------------------------------------------- -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Share video
								to:</h5>
							<button type="button" class="btn-close" data-mdb-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">Your
										friends email:</label> <input type="text" class="form-control"
										id="recipient-name" />
								</div>
							</form>
						</div>
						<div class="modal-footer">

							<button type="button" class="btn btn-success btn-rounded">Share</button>
						</div>
					</div>
				</div>
			</div>
			<!-- share------------------------------------------------------------------------------- -->

			<!-- thong bao----------------------------------------------------- -->
			<strong id="snackbar"><i class="fas fa-check-circle me-md-2"></i>The
				video has been added to the favorites list</strong>
			<!-- thong bao----------------------------------------------------- -->



				<!--Slide----------------------------------------->
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
									alt="Stony Beach" />
								<div class="mask" style="background-color: rgba(0, 0, 0, 0.6)"></div>
								<div class="card-img-overlay">
									<h2 class="card-title">OUSAMA RANKING</h2>
									<p class="card-text" style="width: 500px;">
										<small>The people of the kingdom look down on the
											young Prince Bojji, who can neither hear nor speak.<br>
											They call him "The Useless Prince" while jeering at his
											supposed foolishness. However, while Bojji may not be
											physically strong, he is certainly not weak of heart.
										</small><br>
									<div class="d-grid gap-2 d-md-flex justify-content-md-start">
										<button type="button" class="btn btn-success btn-rounded"
											data-mdb-ripple-color="#ffffff">
											<i class="fas fa-play me-md-2"></i>Watch Now
										</button>
									</div>
									</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="card bg-dark text-white">
								<img src="views/images/one-piece-header.jpg" class="card-img"
									alt="onepiece" />
								<div class="mask" style="background-color: rgba(0, 0, 0, 0.6)"></div>
								<div class="card-img-overlay">
									<h2 class="card-title">ONE PIECE</h2>
									<p class="card-text" style="width: 500px;">
										<small>Gol D. Roger was known as the "Pirate King,"
											the strongest and most infamous being<br> to have sailed
											the Grand Line. The capture and execution of Roger by the
											World Government brought a change throughout the world.
										</small> <br>
									<div class="d-grid gap-2 d-md-flex justify-content-md-start">
										<button type="button" class="btn btn-success btn-rounded"
											data-mdb-ripple-color="#ffffff">
											<i class="fas fa-play me-md-2"></i>Watch Now
										</button>
									</div>
									</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="card bg-dark text-white">
								<img src="views/images/conan-header.png" class="card-img"
									alt="onepiece" />
								<div class="mask" style="background-color: rgba(0, 0, 0, 0.6)"></div>
								<div class="card-img-overlay">
									<h2 class="card-title">DETECTIVE CONAN</h2>
									<p class="card-text" style="width: 500px;">
										Shinichi Kudo, a great mystery expert at only seventeen, is
										already well known for having solved several challenging
										cases. <br>One day, when Shinichi sees two suspicious men
										and decides to follow them, he inadvertently becomes witness
										to a disturbing illegal activity.<br>
									<div class="d-grid gap-2 d-md-flex justify-content-md-start">
										<button type="button" class="btn btn-success btn-rounded"
											data-mdb-ripple-color="#ffffff">
											<i class="fas fa-play me-md-2"></i>Watch Now
										</button>
									</div>
									</p>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!--Slide------------------------------------------------>



				<!-- Video ------------------------------------------------->
				
				<div class="d-grid gap-2 d-md-flex justify-content-center mb-4" style="margin-top: 50px">
					<i class="fas fa-newspaper fa-2x" style="color: #07bf67"></i> <span
						class="fs-5">Recently Released</span>
				</div>
             <div class="row gx-3">

			<c:forEach var="item" items="${listItem}">
				<div class="col-lg-3 col-md-6 mb-3">
				
					<div class="card border border-0 shadow-0">
                 <div class="bg-image hover-overlay ripple" data-mdb-ripple-color="light">
								<img src="views/images/${item.poster}" class="img-fluid"/>
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

				

									<i class="fas fa-share fa-lg text-muted p-md-1 my-1 me-2"
										data-mdb-toggle="modal" data-mdb-target="#exampleModal"
										data-mdb-toggle="tooltip" data-mdb-placement="top"
										title="Share this post"></i> 
							
									<i class="fas fa-heart fa-lg text-muted p-md-1 my-1 me-0"
										data-mdb-toggle="tooltip" data-mdb-placement="top"
										title="I like it" onclick="myFunction()"></i>
								</div>
							</div>
						</div>
			
				</div>
							
			</c:forEach>
		</div>
			<!-- Video ------------------------------------------------->	

				
				<br><hr>
				<!-- ------poster------------------ -->
				<div class="d-grid gap-2 d-md-flex justify-content-center mb-4"
					style="margin-top: 60px">
					<i class="fas fa-fire fa-2x" style="color: #07bf67"></i> <span
						class="fs-5">Trending Airing Series</span>
				</div>
	<div class="poster_hover">			
  <div class="row gx-3 ">

    <div class="col-lg-2 col-md-6">
		<div class="card border border-0 shadow-0" style="width: auto;">

							<div class="bg-image hover-shadow ripple">
								<img src="views/images/posteronepiece.jpg" class="w-100 rounded-2" /> 
								<a href="xemVideo.jsp">
							

								</a>
							</div>


							<div style="margin-top: 10px;">
								<span class="d-inline-block text-truncate fs-6 fw-bold"
									style="max-width: 300px">One Piece </span>


							</div>

							<div class="d-flex justify-content-between">
								<small>Fall 1999</small>
                                   
									<small><i class="fas fa-star text-muted p-md-1"> 8.8</i></small> 
			
							</div>
						</div>
    </div>

      <div class="col-lg-2 col-md-6">
		<div class="card border border-0 shadow-0" style="width: auto;">

							<div class="bg-image hover-shadow ripple">
								<img src="views/images/posterconan.jpg" class="w-100 rounded-2" style="height-min: 300px"/> 
								<a href="xemVideo.jsp">
		

								</a>
							</div>


							<div style="margin-top: 10px;">
								<span class="d-inline-block text-truncate fs-6 fw-bold"
									style="max-width: 300px">Conan Detective</span>


							</div>

							<div class="d-flex justify-content-between">
								<small>Fall 1999</small>
                                   
									<small><i class="fas fa-star text-muted p-md-1"> 8.6</i></small> 
			
							</div>
						</div>
    </div>

      <div class="col-lg-2 col-md-6">
		<div class="card border border-0 shadow-0" style="width: auto;">

							<div class="bg-image hover-shadow ripple">
								<img src="views/images/posternaruto.jpg" class="w-100 rounded-2" /> 
								<a href="xemVideo.jsp">


								</a>
							</div>


							<div style="margin-top: 10px;">
								<span class="d-inline-block text-truncate fs-6 fw-bold"
									style="max-width: 300px"> Naruto </span>


							</div>

						<div class="d-flex justify-content-between">
								<small>Fall 1999</small>
                                   
									<small><i class="fas fa-star text-muted p-md-1"> 8.4</i></small> 
			
							</div>
						</div>
    </div>

   <div class="col-lg-2 col-md-6">
		<div class="card border border-0 shadow-0" style="width: auto;">

							<div class="bg-image hover-shadow ripple">
								<img src="views/images/posterdoremon.jpg" class="w-100 rounded-2" /> 
								<a href="xemVideo.jsp">
		

								</a>
							</div>


							<div style="margin-top: 10px;">
								<span class="d-inline-block text-truncate fs-6 fw-bold"
									style="max-width: 300px"> Doraemon </span>


							</div>

							<div class="d-flex justify-content-between">
								<small>1979-2005</small>
                                   
									<small><i class="fas fa-star text-muted p-md-1"> 8.1</i></small> 
			
							</div>
						</div>
    </div>

      <div class="col-lg-2 col-md-6">
		<div class="card border border-0 shadow-0" style="width: auto;">

							<div class="bg-image hover-shadow ripple">
								<img src="views/images/posteroneman.jpg" class="w-100 rounded-2" /> 
								<a href="xemVideo.jsp">


								</a>
							</div>


							<div style="margin-top: 10px;">
								<span class="d-inline-block text-truncate fs-6 fw-bold"
									style="max-width: 300px"> One Punch Man </span>


							</div>

							<div class="d-flex justify-content-between">
								<small>2015-2019</small>
                                   
									<small><i class="fas fa-star text-muted p-md-1"> 8.8</i></small> 
			
							</div>
						</div>
    </div>

      <div class="col-lg-2 col-md-6">
		<div class="card border border-0 shadow-0" style="width: auto;">

							<div class="bg-image hover-shadow ripple">
								<img src="views/images/posterz.jpg" class="w-100 rounded-2" /> 
								<a href="xemVideo.jsp">
			

								</a>
							</div>


							<div style="margin-top: 10px;">
								<span class="d-inline-block text-truncate fs-6 fw-bold"
									style="max-width: 300px"> Dragon Ball Z </span>


							</div>
	<div class="d-flex justify-content-between">
								<small>1989-2003</small>
                                   
									<small><i class="fas fa-star text-muted p-md-1"> 8.8</i></small> 
			
							</div>
						</div>
    </div>

  </div>
  </div>
				<!-- ------pooter------------------------ -->
				
				<!-- dieu huong -------------------------------->
				<nav aria-label=".hover-shadow" style="margin-top: 40px;">
					<ul class="pagination align-items-center justify-content-center">
						<li class="page-item disabled"><a class="page-link">Previous</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item active" aria-current="page"><a
							class="page-link" href="#">2 <span class="visually-hidden">(current)</span></a>
						</li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</nav>
				<!-- dieu huong -->

				<!-- Navbar -->
		
		</div>
	</main>
	<script type="text/javascript">
	//Get the button
	var mybutton = document.getElementById("myBtn");

	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

	function scrollFunction() {
	  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	    mybutton.style.display = "block";
	  } else {
	    mybutton.style.display = "none";
	  }
	}

	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
	  document.body.scrollTop = 0;
	  document.documentElement.scrollTop = 0;
	}
	</script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min.js"></script>
	<script src="js/toast.js"></script>
	<script src="js/side.js"></script>
	<script src="js/loader.js"></script>

</body>
</html>