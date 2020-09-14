<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=no">
<title>마이페이지</title>

<style type="text/css" content="text/html;">

* {
font-family: HanSans;}
body {
	margin: 0;
}
.section {
	float: left;
	width: 100%;
} 

#header-area h2{
	text-align: left;
	color: rgb(255, 255, 255);
	float: left;
	width: 100%;	
	height: 30px;
	margin: 12px 0px;
	line-height:30px;
	text-align: center;
	font-size: large;
	}


#header-area{
	background-color:rgb(35, 42, 48);
	float: left;
	
}

#back{
	margin-right:10px; 
	float: right;
	
}


.outer-menu{

	line-height: 17px;
    margin:0;
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 10px;

	position: relative;

	text-align: left;

	
	z-index: 9999;
	list-style: none;
	
	float: left;
	width: 100%;
	
	border-bottom: 1px solid rgb(178, 214, 202);

}



#h1{

	font-size: 17px;
	font-weight: bold;
	color: rgb(0, 0, 0);
}



a{
	text-decoration:none;
	color:rgb(0, 0, 0);
}



span{float: right;
    padding-right:20px;}

.inner-menu{
	
	float: left;
	width: 100%;
	list-style: none;
	display: none;
	margin-top: 10px;
	padding-left:0px; 
}

.inner-menu li{
	float: left;
	width: 50%;
}
.inner-menu a{
	display: block;
	padding: 15px 10px;
	z-index: 5000;
	text-decoration:none
}



#footer-area{
	height: 100%;
}

</style>

</head>
<body>

<div id="header-area" class="section">
<h2> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마이페이지 <a href="main.jsp"><img src="img/home.PNG" id="back" width="35px;" height ="35px;"></a></h2>
</div>


<div id="content-area" class="section">

<div class="content-menu">
	<ul class="outer-menu">
		<li >
			<a id="h1"href="sale.jsp">판매</a>


		</li>
	</ul>

    <ul class="outer-menu">
		<li >
			<a id="h1" href="bidding.jsp">입찰</a>

		</li>
	</ul>

	<ul class="outer-menu">
		<li >
			<a id="h1" href="account.jsp">계좌관리</a>
		</li>
	</ul>
	<ul class="outer-menu">
		<li >
			<a id="h1" href="#">내 정보</a>
		</li>
	</ul>
<ul class="outer-menu">
<li >
<a id="h1" href="admin.jsp">관리자 페이지 </a>
	</li>
	</ul>
	
</div>

</div>

<div id="footer-area" class="section">
</div>


</body>
</html>