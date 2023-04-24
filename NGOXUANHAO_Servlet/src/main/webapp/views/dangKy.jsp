<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Register</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
   <style type="text/css">
<jsp:include page="css/dangNhap.css"></jsp:include>

</style>

    <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    <link
    href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min.css"
    rel="stylesheet"/>


</head>


    
<body style="background-color: #0cd5b5;">
    <div class="container shadow p-3 mb-5 bg-body rounded-7" style="width: 420px; height: 500px;; margin-top: 10%;">
         
        <form action="register" method="post" style="margin-left: 20px; margin-right: 20px; margin-top: 20px;">
         <!--  <a href="home">
            <img src="views/images/logo.png" class="rounded-2 mb-4" width="170px">
            </a> -->
            <p class="text-center text-danger fw-bold">${danger}</p>
			<p class="text-center text-success fw-bold">${success}</p>
            <div class="mb-3">
                <input type="text" name="Id" class="form-control rounded-7 border" placeholder="Enter username" required />
              </div>

              <div class="row mb-3">
                <div class="col">
                   
                   <input type="password" name="Password" class="form-control rounded-7 border" placeholder="Enter password"required />
                  
                </div>
                <div class="col">
                  
                   <input type="password" name="Repeat" class="form-control rounded-7 border" placeholder="Enter repeat"required />
                  
                </div>
              </div>
            <div class="mb-3">
         
            <input type="text" name="Fullname" class="form-control rounded-7 border" placeholder="Enter fullname"required />
              
            </div>

            <div class="mb-3">
        
             <input type="email" name="Email" class="form-control rounded-7 border" placeholder="Enter email"required />
              
            </div>
     

              <div class="text-center text-lg-start pt-2">

                <div class="text-center pt-1 mb-5 pb-1">
                  <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" formaction="register">Sign up</button>
                 
                  <p class="small fw-bold">Already have an account? <a href="login"
                    class="link-success">Sign In</a></p>
                </div>

              </div>
    
          </form>
    </div>
    <script
  type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min.js"
></script>
</body>
</html>