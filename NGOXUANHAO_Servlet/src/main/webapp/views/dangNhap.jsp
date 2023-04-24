<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Login</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<style type="text/css">
<
jsp
:include
 
page
="
css
/
dangNhap
.css
"
>
</
jsp
:include
>
<
jsp
:include
 
page
="
css
/
toast
.css
"
>
</
jsp
:include
>
</style>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min.css"
	rel="stylesheet" />

</head>
<body style="background-color: #0cd5b5;">
	<div class="container shadow p-3 mb-5 bg-body rounded-7"
		style="width: 420px; height: 500px; margin-top: 10%;">

		<form action="login" method="post"
			style="margin-left: 20px; margin-right: 20px; margin-top: 20px;">
			<p class="text-center text-danger fw-bold" style="z-index: 11">${message}</p>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Username</label>
				<input type="text" name="username" value="${username }"
					class="form-control rounded-7 border" placeholder="Enter username" />
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Password</label>
				<input type="password" name="password" value="${password}"
					class="form-control rounded-7 border" placeholder="Enter password">

			</div>
			<div class="form-check mb-3">
				<input class="form-check-input" name="remember" type="checkbox" />
				<label class="form-check-label">Nhớ tôi</label>
			</div>
			<div class="d-md-flex justify-content-md-end">

				<a href="forgotPassword" class="text-body">Forgot password?</a>
			</div>

			<div class="text-center text-lg-start pt-2">

				<div class="text-center pt-1 mb-5 pb-1">
					<button
						class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"
						formaction="login">Sign in</button>

					<p class="small fw-bold">
						Don't have an account? <a href="register" class="link-success">Sign
							Up</a>
					</p>
				</div>

			</div>

		</form>
	</div>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min.js"></script>
</body>
</html>
