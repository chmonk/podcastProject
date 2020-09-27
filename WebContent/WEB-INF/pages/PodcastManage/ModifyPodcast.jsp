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
<title>修改單集</title>
 <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />">

  <style type="text/css">
    body {
      background-image: url(<c:url value='/img/banner/b1.jpg' />);
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
  </style>



</head>

<body>
<div class="head">
		<jsp:include page="../header_banner_test.jsp" flush="true " />
	</div>

<div class="showPodcasterBody">
		<div class="row showPodcasterBodyHeader">
			<div class="col-md-4">
				<div class="memberImg">
					<img alt="" src="${podcasterData.podcastImg}">
				</div>
			</div>
			<div class="col-md-8">
				<div class="memberName">${podcasterData.podcastName}</div>
				<div class="memberInfo">${podcasterData.podcastInfo}</div>
				<div></div>
			</div>
		</div>
	</div>

 <div class="container">
    <div class="row">
		<div class="col-lg-3"></div>
     	<div class="col-lg-6">

        <h1 class="text-center animated slideInDown" style="color: #fff; font-weight: bold;">修改單集</h1>
		<div id="ui" class="text-center">
		
          <form id="podcastModifyForm" class="form-group" action="PodcastModifyProcess" method="POST" enctype="multipart/form-data">
          <input type="hidden" name="podcastId" value=${modifyPodcastId}>
		   <label path="title">單集名稱: </label>
            <input path="title" id="title" type="text" name="title" class="form-control" required>
            <br>

			<div class="row">
             <div class="col-lg-6 col-md-6">
            <label>付費狀態: </label>
            <select class="form-control" name="radioP">
              <option value=0 id="radioP0" >免費</option>
              <option value=1 id="radioP1" >訂閱</option>
            </select>
              </div>
             <div class="col-lg-6 col-md-6">
            <label>頻道類別: </label>
            <select class="form-control" name="category">
              <option value=1 id="cat1" >喜劇娛樂</option>
					<option value=2 id="cat2">生活文化</option>
					<option value=3 id="cat3">男女話題</option>
					<option value=4 id="cat4">名人精選</option>
					<option value=5 id="cat5">健康運動</option>
					<option value=6 id="cat6">兒童家庭</option>
					<option value=7 id="cat7">男女話題</option>
					<option value=8 id="cat8">新聞社會</option>
					<option value=9 id="cat9">故事書籍</option>
					<option value=10 id="cat10">科學奇趣</option>
					<option value=11 id="cat11">宗教心靈</option>
					<option value=12 id="cat12">旅遊玩樂</option>
					<option value=13 id="cat13">時尚美容</option>
					<option value=14 id="cat14">科技趨勢</option>
					<option value=15 id="cat15">音樂藝術</option>
					<option value=16 id="cat16" >教育學習</option>
            </select>
              </div>
            <br>
            
             <div class="col-lg-12">
             <br>
            <label path="podcastInfo">單集簡介: </label>
            <textarea path="podcastInfo" title="podcastInfo" name="podcastInfo" id="podcastInfo" class="form-control" rows="3"
              required> </textarea>
            </div>
            <br>
            
            
            <div class="col-lg-12">
             <br>
				<label>單集照片：</label> <input type="file" name="file" 
								class="form-control" onchange="readURL(this)" targetID="preview_progressbarTW_img" accept="image/gif, image/jpeg, image/png" required/><br/>
   									<img id="preview_progressbarTW_img" src="${uploadPodcastBean.audioimg}" style="max-width: 300px; max-height: 300px;"/>   								
						</div>
						<br>
            
            <div class="button col-lg-12">
            <br><br>
              <input id="submitBtn" type="button" value="確認修改" class="btn btn-danger btn-block btn-lg" style="box-shadow: 2px 2px 2px gray; ">
              
            </div>
          </form>
          <div  class="col-lg-12" style="text-align: center">
          <br>
		<a href="<c:url value='/managePodcast' />" class="btn btn-primary btn-md">回上一頁</a>&nbsp;&nbsp;
		<a href="<c:url value='/' />" class="btn btn-primary btn-md">回首頁</a>
	</div>
        </div>
      </div>
      <div class="col-lg-3"></div>
    </div>
  </div>





<!-- 	<fieldset> -->
<!-- 		<legend>修改單集</legend> -->
			
<%-- 		<form:form id="podcastModifyForm" action="PodcastModifyProcess" method="POST" modelAttribute="uploadPodcastBean" enctype="multipart/form-data">				 --%>
<!-- 				<input type="hidden" name="podcastId" value=${modifyPodcastId}> -->
<!-- 			<div class="div1"> -->
<%-- 				<form:label path="title" for="" class="l1" >單集名稱:</form:label> --%>
<%-- 				<form:input path="title" id="title" /> --%>
<!-- 				<div class="notice"></div> -->
<!-- 			</div> -->


<!-- 			<div class="div1"> -->
<%-- 				<form:label path="podcastInfo" for="" class="l1">單集簡介:</form:label> --%>
<%-- 			    <form:textarea path="podcastInfo" title="podcastInfo" /> --%>
<!-- 				<span id="idsp2"></span> -->
<!-- 				<div class="notice"></div> -->
<!-- 			</div> -->

			
<!-- 			<div class="div1"> -->
<!-- 			<label for="" class="l1">付費狀態:</label> -->
<!-- 			<input id="radioP0" type=radio name="radioP" value=0 />免費 -->
<!-- 			<input id="radioP1" type=radio name="radioP" value=1 />訂閱  -->
<!-- 			<span id="idsp1"></span> -->
<!-- 			<div class="notice"></div> -->
<!-- 			</div> -->

<!-- 			<div class="div2"> -->
<!-- 				<input id="submitBtn" type="button" value="確認修改">  -->
<!-- 				<input id="clear" type="button" value="清除" > -->
<!-- 			</div> -->
<%-- 			</form:form> --%>
		
<!-- 	</fieldset> -->

<script>
window.onload=function(){

	var title="${uploadPodcastBean.title}";
	document.getElementById("title").value=title;
	
	var podcastInfo="${uploadPodcastBean.podcastInfo}";
	document.getElementById("podcastInfo").value=podcastInfo;
	

	var openPayment=${uploadPodcastBean.openPayment};
	document.getElementById("radioP"+openPayment).selected=true;

	var categoryId=${uploadPodcastBean.categoryId};
	document.getElementById("cat"+categoryId).selected=true;
}

// document.getElementById("clear").onclick = function() {clear()};
// function clear(){
// 	document.getElementById("title").value="";
// 	document.getElementById("podcastInfo").value="";

// 	document.getElementById("radioP0").checked=true;
// 	document.getElementById("radioP1").checked=false;
	
// }

document.getElementById("submitBtn").onclick = function() {check()};
function check(){

	var title=document.getElementById("title").value;
	var podcastInfo=document.getElementById("podcastInfo").value;
	
	if(!title || !podcastInfo){
		alert("請輸入內容")
	}else{
		document.getElementById("podcastModifyForm").submit();
	}	
}


function readURL(input){
  if(input.files && input.files[0]){
    var imageTagID = input.getAttribute("targetID");
    var reader = new FileReader();
    reader.onload = function (e) {
       var img = document.getElementById(imageTagID);
       img.setAttribute("src", e.target.result)
    }
    reader.readAsDataURL(input.files[0]);
  }
}

</script>



</body>

</html>