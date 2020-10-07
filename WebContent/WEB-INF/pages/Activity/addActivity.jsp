<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>活動表單</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
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
margin-top:150px;
}
  </style>

</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<div class="head">
		<jsp:include page="../header_banner_test.jsp" flush="true " />
	</div>
	
  <div class="container headtop">
    <div class="row">



      <div class="col-lg-3"></div>
      <div class="col-lg-6">

        <h1 class="text-center animated slideInDown" style="color: #fff; font-weight: bold;">新增活動</h1>

        <div id="ui" class="text-center">

          <form class="form-group" action="addActivityProcess" method="POST" enctype="multipart/form-data">


            <label>活動名稱: </label>
            <input type="text" id="activityName"  name="activityName" class="form-control" placeholder="請輸入活動名稱" required>
            <br>

            <div class="row">
              <div class="col-lg-6 col-md-6">
                <label>活動日期: </label>
                <input type="date" id="activityDate" name="activityDate" class="form-control" required>
              </div>

              <div class="col-lg-6 col-md-6">
                <label>舉辦時間: </label>
                <input type="text" id="activityTime"  name="activityTime" class="form-control" placeholder="06:30 pm" required>
              </div>
            </div>
            <br>
            <label>地點: </label>
            <input type="text" id="activityLocation" name="activityLocation" class="form-control" placeholder="新竹市" required>
            <br>

            <div class="row">
              <div class="col-lg-6 col-md-6">
                <label>票券價格: </label>
                <input type="text" id="activityPrice" name="activityPrice" class="form-control" placeholder="350" required>
              </div>

              <div class="col-lg-6 col-md-6">
                <label>人數上限: </label>
                <input type="text" id="activityMaxPeople" name="activityMaxPeople" class="form-control" placeholder="100" required>
              </div>
            </div>
            <br>

            <label>活動狀態: </label>
            <select id="activityStatus" class="form-control" name="activityStatus">
            	<option>請選擇</option>
              <option value=0>公開</option>
              <option value=1>關閉</option>
            </select>
            <br>

            <label>活動內容: </label>
            <textarea id="activityContent" name="activityContent" class="form-control" rows="3" placeholder="請輸入活動內容..."
              required> </textarea>
            <br>

            <label>活動照片: </label>
            <input type="file" name="file" class="form-control" id="imgInp" required>
            <br>
            
            <img width="60%" id="blah" src="<c:url value='/img/preview_photo.png' />" alt="預覽你上傳的照片" />

            <div class="button">
            <br>
              <input type="submit" name="submit" value="送出" class="btn btn-danger btn-block btn-lg"
                style="box-shadow: 2px 2px 2px gray;">
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
<!-- end of container -->
<script>
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    
	    reader.onload = function(e) {
	      $('#blah').attr('src', e.target.result);
	    }
	    
	    reader.readAsDataURL(input.files[0]); // convert to base64 string
	  }
	}

	$("#imgInp").change(function() {
	  readURL(this);
	});


	function fillBlank(){

		$("#activityName").val("第一次當podcaster就上手");
		$("#activityDate").val("2020-11-15");
		$("#activityTime").val("07:30 pm");
		$("#activityLocation").val("台北資策會");
		$("#activityPrice").val("200");
		$("#activityMaxPeople").val("30");
		$("#activityStatus")[0].selectedIndex=1;
		$("#activityContent").val("現在podcast正當紅，迅速上手如何製作好節目");

	
}
</script>


</body>

</html>