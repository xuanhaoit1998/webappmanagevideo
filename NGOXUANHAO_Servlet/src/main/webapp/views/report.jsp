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

</head>
<body>

	<div class="tab">

		<strong>Editions</strong>
		<a href="quanLyUser" class="tablinks mb-2">
			<i class="fas fa-user me-md-2"></i> User editions
			</a>
	
			<a href="quanLyVideo" class="tablinks mb-2">
			<i class="fas fa-video me-md-2"></i> Video editions
			</a>
			<a href="thongKe" class="tablinks active">
			<i class="fas fa-clipboard-list me-md-2"></i> Reports
			</a>	

	</div>

	<div id="reports" class="tabcontent">
	
	<!-- Tabs navs -->
<ul class="nav nav-tabs text-light bg-dark mb-3" id="ex-with-icons" role="tablist">
  <li class="nav-item" role="presentation">
    <a class="nav-link active" id="ex-with-icons-tab-1" data-mdb-toggle="tab" href="#ex-with-icons-tabs-1" role="tab"
      aria-controls="ex-with-icons-tabs-1" aria-selected="false"><i class="fas fa-chart-pie fa-fw me-2"></i>Favorites</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="ex-with-icons-tab-2" data-mdb-toggle="tab" href="#ex-with-icons-tabs-2" role="tab"
      aria-controls="ex-with-icons-tabs-2" aria-selected="true"><i class="fas fa-chart-line fa-fw me-2"></i>Favorite Users</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="ex-with-icons-tab-3" data-mdb-toggle="tab" href="#ex-with-icons-tabs-3" role="tab"
      aria-controls="ex-with-icons-tabs-3" aria-selected="false"><i class="fas fa-cogs fa-fw me-2"></i>Shared Friends</a>
  </li>
</ul>
<!-- Tabs navs -->

<!-- Tabs content -->
<div class="tab-content text-light bg-dark" id="ex-with-icons-content">
  <div class="tab-pane fade show " id="ex-with-icons-tabs-1" role="tabpanel" aria-labelledby="ex-with-icons-tab-1">
   
  </div>
  <div class="tab-pane fade active" id="ex-with-icons-tabs-2" role="tabpanel" aria-labelledby="ex-with-icons-tab-2">
  
  </div>
  <div class="tab-pane fade" id="ex-with-icons-tabs-3" role="tabpanel" aria-labelledby="ex-with-icons-tab-3">
    Tab 3 content
  </div>
</div>


		
	
		
	</div>

</body>
</html>