<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="AnchiaoChang">
<title>新增單集</title>
</head>
 <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />">

  <style type="text/css">
    body {
      background-image: url(<c:url value='/img/banner/b6.jpg' />);
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
    }

    #ui {
      border-radius: 10px;
      background-color: #333;
      padding: 50px;
      opacity: 0.8;
      box-shadow: 2px 2px 2px 2px #000;
      animation-delay: 2s;
      animation-duration: 2s;

    }

    #ui label {
      color: #fff;
      font-weight: 800;

    }

    #contact_showcase {
      margin-top: 70px;
    }

    .button {
      font-weight: 800;

    }
     .showPodcasterBody {
	padding-top: 40px;
	padding-bottom: 40px;
}

.showPodcasterBodyHeader {
	padding-top: 50px;
	/* 	border-bottom: 1px solid black;  */
}
.headtop{
	margin-top:120px;
	margin-bottom:20px;
}
  </style>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<div class="head">
		<jsp:include page="../header_banner_test.jsp" flush="true " />
	</div>
 <div class="container headtop">
    <div class="row">
		<div class="col-lg-3"></div>
     	<div class="col-lg-6">

        <h1 class="text-center animated slideInDown" style="color: #fff; font-weight: bold;">新增單集</h1>
		<div id="ui" class="text-center">

          <form id="totalform" class="form-group" action="addPodcastProcess" method="POST" enctype="multipart/form-data">
		   <label>單集名稱: </label>
            <input type="text" name="title" id="name" class="form-control" placeholder="請輸入單集名稱" required>
            <br>

			<div class="row">
             <div class="col-lg-6 col-md-6">
            <label>付費狀態: </label>
            <select id="openPayment" class="form-control" name="openPayment">
              <option value=0 checked>免費</option>
              <option value=1>訂閱</option>
            </select>
              </div>
             <div class="col-lg-6 col-md-6">
            <label>頻道類別: </label>
            <select id="category" class="form-control" name="category">
              <option value=1 checked>喜劇娛樂</option>
					<option value=2>生活文化</option>
					<option value=3>男女話題</option>
					<option value=4>名人精選</option>
					<option value=5>健康運動</option>
					<option value=6>兒童家庭</option>
					<option value=7>男女話題</option>
					<option value=8>新聞社會</option>
					<option value=9>故事書籍</option>
					<option value=10>科學奇趣</option>
					<option value=11>宗教心靈</option>
					<option value=12>旅遊玩樂</option>
					<option value=13>時尚美容</option>
					<option value=14>科技趨勢</option>
					<option value=15>音樂藝術</option>
					<option value=16>教育學習</option>
            </select>
              </div>
            <br>
            
            <label>單集簡介: </label>
            <textarea name="podcastInfo" id="info" class="form-control" rows="3" placeholder="請輸入單集簡介..."
              required> </textarea>
            <br>

            <label>單集封面: </label>
            <input type="file" name="podcastpic" id="pic" class="form-control" required>
            <br>
            <img width="60%" id="blah" src="<c:url value='/img/preview_photo.png' />"  alt="預覽你上傳的照片" />
            <br>
            <label>上傳單集: </label>
            <input type="file" name="podcastfile" id="audio" class="form-control" required>
            <br>

            <div class="button">
              <input type="button" id="send" value="送出" onclick= function(){checknull()} class="btn btn-danger btn-block btn-lg"
                style="box-shadow: 2px 2px 2px gray; ">
                <p id="err" style="background-color: white" ></p>
            </div>
            <br>
            <div style="text-align: center; margin-bottom: 20px;">
		
		<button  class="btn btn-primary btn-md" onclick="fillBlank()">一鍵輸入</button>
	</div>
          </form>
        </div>
      </div>
      <div class="col-lg-3"></div>
    </div>
  </div>

<!-- onclick=function(){columnTestify} -->
<script>
var send=document.getElementById("send");
send.onclick=function checknull() {
    var name = document.getElementById("name");
    var info = document.getElementById("info");
    var audio = document.getElementById("audio");
    var pic = document.getElementById("pic");
    var err=document.getElementById("err");
  if(name.value =="" || info.value=="" || audio.value=="" || pic.value=="") {
	  err.innerHTML="請填入所有內容";
	  return false;
  }
  else{
	err.innerHTML="";
	document.getElementById("totalform").submit();
	return true;
}
}



function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    
	    reader.onload = function(e) {
	      $('#blah').attr('src', e.target.result);
	    }
	    
	    reader.readAsDataURL(input.files[0]); // convert to base64 string
	  }
	}

	$("#pic").change(function() {
	  readURL(this);
	});


	function fillBlank(){

		$("#name").val("調酒入門");
		$("#openPayment")[0].selectedIndex=0;
		$("#category")[0].selectedIndex=3;
		$("#info").val("浪漫duke的調酒入門");
		

}
 </script> 
 
 

</body>


</html>