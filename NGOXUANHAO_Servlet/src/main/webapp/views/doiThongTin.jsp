<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Information</title>

</head>
<body style="background-color: #f9f9f9;">

   
<div class="container" style="width: 60%;">

    <p class="note text-light" style="background-color: #1c1d1e; border-left: 3px solid #07bf67;">
        <strong>Account Security</strong> <br>Change your password.
    </p>
    <div class="container-fluid shadow-2 rounded" style="margin-top: 10px; margin-bottom: 50px; background-color: #1c1d1e;">
      
        <form action="editPassword" method="post" style="padding:10px">
         <p class="text-center text-danger fw-bold">${danger}</p>
				<p class="text-center text-success fw-bold">${success}</p>
            <!-- Email input -->
            <label class="form-label text-light fw-bold" >Change Password</label>
       
                <input type="password" name="password" class="form-control text-light border border-0 mb-3" placeholder="Password" style="background-color:#101112"/>

        
                <input type="password" name="confirmPassword" class="form-control text-light border border-0 mb-4" placeholder="Confirm Password" style="background-color:#101112"/>

        <p class="form-label fw-bold mb-0 text-light" >Confirm Current Password</p>
        <p class="form-label text-light" >You are required to verify your password for the changes above.</p>    
        
            <input type="password" name="currentPassword" class="form-control text-light border border-0 mb-3" placeholder="Current Password" style="background-color:#101112"/>

        <button formaction="editPassword" class="btn btn-success btn-sm" style="background-color: #07bf67;">Save</button>
    </form>
</div>
    <p class="note note-success text-light" style="background-color: #1c1d1e; border-left: 3px solid #07bf67;">
        <strong>Account Information</strong><br> Change your information.
    </p>
    <div class="container-fluid shadow-2 rounded" style="margin-top: 10px; margin-bottom: 50px; background-color:#1c1d1e">
    <form action="editAccount" method="post" style="padding:10px">
    
       ${danger}
				${success}
				
        <label class="form-label text-light fw-bold">Username</label>
            <input type="text" class="form-control text-light border border-0 mb-3" name="Id" value="${user.getId() }" placeholder="Username" readonly style="background-color:#101112"/>

            <label class="form-label text-light fw-bold">Fullname</label>
            <input type="text" class="form-control text-light border border-0 mb-3" name="Fullname" value="${user.getFullname() }" placeholder="Fullname" style="background-color:#101112"/>

            <label class="form-label text-light fw-bold">Email</label>
            <input type="email" class="form-control text-light border border-0 mb-3" name="Email" value="${user.getEmail() }" placeholder="Email" style="background-color:#101112"/>
       
            <button formaction="editAccount" class="btn btn-success btn-sm" style="background-color: #07bf67;">Save</button>
    </form>
    </div>
     <p class="note note-success text-light" style="background-color: #1c1d1e; border-left: 3px solid #07bf67;">
        <strong>Avatar</strong><br> Change your profile picture.
    </p>
     <div class="container-fluid shadow-2 rounded" style="margin-top: 10px; margin-bottom: 20px; background-color:#1c1d1e">
     <form action="editAvatar" method="post" style="padding:10px">
     <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
 <p class="form-label fw-bold mb-0 text-light" >Profile Picture</p>
        <p class="fw-light" >Allowed Formats: JPEG, PNG. Max size: 1.5mb. Optimal dimensions: 230x230.</p>    

  <div class="input-group mb-3">
<div class="avt">
  <div class="image-upload-wrap">
    <input class="file-upload-input" name="avt" type="file" onchange="readURL(this);" accept="image/*" />
    <div class="drag-text"> 
      <p>Drop image here or click to upload</p>
    </div>
  </div>
  <div class="file-upload-content">
    <img class="file-upload-image" src="#" alt="your image" />
   
  </div>

</div>
 <button type="button" onclick="removeUpload()" class="remove-image"><i class="fas fa-times"></i></button>

  </div>

  
<button formaction="editAvatar" class="btn btn-success btn-sm" style="background-color: #07bf67;">Save</button>
</form>
     </div>
</div>

<script type="text/javascript">
function readURL(input) {
	  if (input.files && input.files[0]) {

	    var reader = new FileReader();

	    reader.onload = function(e) {
	      $('.image-upload-wrap').hide();

	      $('.file-upload-image').attr('src', e.target.result);
	      $('.file-upload-content').show();

	      $('.image-title').html(input.files[0].name);
	    };

	    reader.readAsDataURL(input.files[0]);

	  } else {
	    removeUpload();
	  }
	}

	function removeUpload() {
	  $('.file-upload-input').replaceWith($('.file-upload-input').clone());
	  $('.file-upload-content').hide();
	  $('.image-upload-wrap').show();
	}
	$('.image-upload-wrap').bind('dragover', function () {
			$('.image-upload-wrap').addClass('image-dropping');
		});
		$('.image-upload-wrap').bind('dragleave', function () {
			$('.image-upload-wrap').removeClass('image-dropping');
	});

</script>
</body>
</html>