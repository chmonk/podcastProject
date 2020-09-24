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
  </style>



</head>

<body>


 <div class="container">
    <div class="row">
		<div class="col-lg-3"></div>
     	<div class="col-lg-6">

        <h1 class="text-center animated slideInDown" style="color: #fff; font-weight: bold;">修改單集</h1>
		<div id="ui" class="text-center">
		
          <form id="podcastModifyForm" class="form-group" action="PodcastModifyProcess" method="POST" enctype="multipart/form-data">
		   <label path="title">單集名稱: </label>
            <input path="title" id="title" type="text" name="title" class="form-control" required>
            <br>

			<div class="row">
             <div class="col-lg-6 col-md-6">
            <label>付費狀態: </label>
            <select class="form-control" >
              <option value=0 name="radioP" id="radioP0">免費</option>
              <option value=1 id="radioP1" name="radioP">訂閱</option>
            </select>
              </div>
             <div class="col-lg-6 col-md-6">
            <label>頻道類別: </label>
            <select class="form-control">
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
            
            <label path="podcastInfo">單集簡介: </label>
            <textarea path="podcastInfo" title="podcastInfo" name="podcastInfo" id="podcastInfo" class="form-control" rows="3"
              required> </textarea>
            <br>
            <div class="button">
              <input id="submitBtn" type="button" value="確認修改" class="btn btn-danger btn-block btn-lg"
                style="box-shadow: 2px 2px 2px gray; ">
              
            </div>
          </form>
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

</script>



</body>

</html>