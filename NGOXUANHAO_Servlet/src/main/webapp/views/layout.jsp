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
<link rel="icon" href='views/images/logo1.png'>

<style type="text/css">
<jsp:include page="/views/css/imageSelect.css"></jsp:include>
<jsp:include page="/views/css/sideCSS.css"></jsp:include>
<jsp:include page="/views/css/index.css"></jsp:include>
<jsp:include page="/views/css/loader.css"></jsp:include>
<jsp:include page="/views/css/quanLy.css"></jsp:include>
<jsp:include page="/views/css/mdb.min.css"></jsp:include>
</style>

<script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>

</head>
<body onload="myFunction2()" id="body" style="background-color: #101112">

	<header>
		<nav
			class="navbar navbar-expand-lg navbar-light bg-dark shadow-2 fixed-top"
			style="height: 55px">
			<div class="container-fluid justify-content-between"
				style="margin-left: 20px;">
				<!-- Left elements -->

				<div class="d-flex my-2 my-sm-0">


					<!-- Search form -->
					<a class="navbar-brand me-2 mb-1 d-flex justify-content-center"
						href="home"> <img src="views/images/logo1.png" height="20"
						style="margin-top: 3px;" />
					</a>
				</div>

				<!-- Left elements -->

				<!-- Center elements -->

				<div class="card bg-dark" style="width: 400px;"
					style="background-color: #101112;">
					<div class="input-group" style="background-color: #101112;">
						<input type="search" class="form-control border border-0"
							placeholder="Search" style="background-color: #101112;" />
						<button type="button" class="btn shadow-0 border border-0"
							style="background-color: #101112;">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>


				<!-- Center elements -->

				<!-- Right elements -->

				<ul class="navbar-nav flex-row">

					<div class="d-flex align-items-center">



						<c:if test="${user.getId()==null}">
							<li class="nav-item me-3 me-lg-3"><a href="login"><button
										type="button"
										class="btn btn-outline-success text-capitalize btn-sm border border-success"
										data-mdb-ripple-color="dark">Sign In</button></a></li>
						</c:if>

					</div>



					<c:if test="${user.getId()!=null}">
						<li class="nav-item dropdown text-light bg-dark"><a
							class="nav-link dropdown-toggle hidden-arrow d-flex align-items-center py-1"
							href="#" id="navbarDropdownMenuLink" role="button"
							data-mdb-toggle="dropdown" aria-expanded="false"> 
							<img src="views/images/${user.getAvatar()}" class="rounded-circle"
								height="35" width="35" style="object-fit: cover;"/>
						</a>
							<ul class="dropdown-menu text-light bg-dark dropdown-menu-end"
								aria-labelledby="navbarDropdownMenuLink" style="width: 100px">
								<li class="bg-dark"><a class="dropdown-item"
									href="editAccount"><i class="fas fa-user-circle fa-fw me-3"></i><span>${user.getId()}</span></a>

								</li>
								<li><hr class="dropdown-divider" /></li>


								<c:if test="${user.getAdmin()==true}">
									<li><a class="dropdown-item" href="quanLyUser"><i
											class="fas fa-cog fa-fw me-3"></i><span>Admin Studio</span></a></li>
								</c:if>

								<li class="bg-dark"><a class="dropdown-item"
									data-mdb-toggle="modal" data-mdb-target="#exampleModal"><i
										class="fas fa-power-off me-3"></i><span>Sign out</span></a></li>

							</ul></li>

					</c:if>


				</ul>
				<!-- Right elements -->
			</div>
		</nav>
		<!-- Navbar -->
	</header>
	<!-- confirm -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" data-mdb-backdrop="static"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content bg-dark text-light" style="padding: 10px;">
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
					<p>Are you sure you want to sign out?</p>
				</div>

				<div class="row">
					<div class="d-flex justify-content-end">
						<button type="button" class="btn btn-secondary me-md-2"
							data-mdb-dismiss="modal" style="background-color: #303030">Close</button>

						<a href="logout" class="btn btn-primary"
							style="background-color: #07bf67">OK</a>

					</div>

				</div>

			</div>
		</div>
	</div>
	<!-- User==null -->
	<div class="modal fade" id="userNull" tabindex="-1"
		aria-labelledby="exampleModalLabel" data-mdb-backdrop="static"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content bg-dark text-light" style="padding: 10px;">
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
					<p>Bạn chưa đăng nhập?</p>
				</div>

				<div class="row">
					<div class="d-flex justify-content-end">
						<button type="button" class="btn btn-secondary me-md-2"
							data-mdb-dismiss="modal" style="background-color: #303030">Close</button>

						<a href="logout" class="btn btn-primary"
							style="background-color: #07bf67">OK</a>

					</div>

				</div>

			</div>
		</div>
	</div>


	<!-- side-------------------------------------------------------------------------------------- -->
	<div class="menu__side" id="menu_side">


		<div class="options__menu">

			<a href="home" ${selectHome}>
				<div class="option" data-mdb-toggle="tooltip"
					data-mdb-placement="right" title="Home">

					<i class="fas fa-home"></i>

				</div>
			</a> <a href="likeList" ${selectFavorite}>
				<div class="option">
					<i class="fas fa-heart" data-mdb-toggle="tooltip"
						data-mdb-placement="right" title="List Favorite"></i>

				</div>
			</a> <a href="editAccount">
				<div class="option">
					<i class="fas fa-user" title="Cursos"></i>

				</div>
			</a> <a href="#">
				<div class="option">
					<i class="fas fa-fire-alt" title="Blog"></i>

				</div>
			</a> <a href="#">
				<div class="option">
					<i class="fas fa-newspaper" title="Contacto"></i>

				</div>
			</a>

		</div>

	</div>
	<!-- side-------------------------------------------------------------------------------------- -->
	<main style="background-color: #101112">
		<div id="loader">
			<div class="spinner-border text-success" role="status"
				style="width: 3rem; height: 3rem;">
				<span class="visually-hidden">Loading...</span>
			</div>
		</div>


		<div style="display: none; background-color: #101112" id="myDiv"
			class="animate-bottom">

			<jsp:include page="${views}" />


		</div>
	</main>
	<script type="text/javascript">
		function copyText() {
			/* Get the text field */
			var copyText = document.getElementById("myInput");

			/* Select the text field */
			copyText.select();
			copyText.setSelectionRange(0, 99999); /* For mobile devices */

			/* Copy the text inside the text field */
			navigator.clipboard.writeText(copyText.value);

			/* Alert the copied text */
			alert("Copied the text: " + copyText.value);
		}
	</script>
	<script class="jsbin"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="js/toast.js"></script>
	<script src="js/side.js"></script>
	<script src="js/loader.js"></script>
	<script src="js/mdb.min.js"></script>
</body>
</html>