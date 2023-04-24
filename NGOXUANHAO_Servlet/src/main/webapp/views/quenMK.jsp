<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Account Recovery</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
     <style type="text/css">
<jsp:include page="css/dangNhap.css"></jsp:include>

</style>

<link
href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min.css"
rel="stylesheet"/>


    
</head>
<body style="background-color: #0cd5b5;">
    <div class="container shadow p-3 mb-5 bg-body rounded rounded-3" style="width: 420px; height: 500px; margin-top: 10%;">
        
        <form action="forgotPassword" method="post" style="margin-left: 20px; margin-right: 20px; margin-top: 20px;">
          <a href="home">
            <img src="views/images/logo.png" class="rounded-2 mb-4" width="170px">
            </a>
            	<p class="text-center text-danger fw-bold">${danger}</p>
				<p class="text-center text-success fw-bold">${success}</p>
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control rounded-7 border" placeholder="Enter username" />
              </div>
            <div class="mb-3">
              <label  class="form-label">Email</label>
              <input type="email" name="email" class="form-control rounded-7 border" placeholder="Enter email">
              
            </div>

              <div class="text-center text-lg-start pt-2">

                <div class="text-center pt-1 mb-5 pb-1">
                  <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" formaction="forgotPassword">Reset</button>
         <p class="small fw-bold">Don't have an account? <a href="register"
                    class="link-success">Sign Up</a></p>
                </div>
                

              </div>
    
          </form>
    </div>
    <script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min.js"
></script>
</body>
</html>