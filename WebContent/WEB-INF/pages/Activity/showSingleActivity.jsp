<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>修改活動</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
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

        <h1 class="text-center animated slideInDown" style="color: #fff; font-weight: bold;">修改活動</h1>

        <div id="ui" class="text-center">

          <form class="form-group" action="updateAc" method="POST" enctype="multipart/form-data">


            <label>活動名稱: </label>
            <input type="text" name="activityName" class="form-control" placeholder="請輸入活動名稱"  value="${aBean.activityName}" required>
            <br>

            <div class="row">
              <div class="col-lg-6 col-md-6">
                <label>活動日期: </label>
                <input type="date" name="activityDate" class="form-control" value="${aBean.activityDate}" required>
              </div>

              <div class="col-lg-6 col-md-6">
                <label>舉辦時間: </label>
                <input type="text" name="activityTime" class="form-control" value="${aBean.activityTime}" placeholder="06:30 pm" required>
              </div>
            </div>
            <br>
            <label>地點: </label>
            <input type="text" name="activityLocation" class="form-control"  value="${aBean.activityLocation}" placeholder="新竹市" required>
            <br>

            <div class="row">
              <div class="col-lg-6 col-md-6">
                <label>票券價格: </label>
                <input type="text" name="activityPrice" class="form-control"  value="${aBean.activityPrice}" placeholder="350" required>
              </div>

              <div class="col-lg-6 col-md-6">
                <label>人數上限: </label>
                <input type="text" name="activityMaxPeople" class="form-control" value="${aBean.activityMaxPeople}" placeholder="100" required>
              </div>
            </div>
            <br>

            <label>活動狀態: </label>
            <select class="form-control" name="activityStatus" value="${aBean.activityStatus}">
            	<option>請選擇</option>
              <option value=0>公開</option>
              <option value=1>關閉</option>
            </select>
            <br>

            <label>活動內容: </label>
            <textarea name="activityContent" class="form-control" rows="3" value="${aBean.activityContent}"  required>${aBean.activityContent} </textarea>


            <br>

<!--             <label>活動照片: </label> -->
<!--             <input type="file" name="file" class="form-control"> -->
<!--             <br> -->
            
            <input type=hidden name="activityId" value="${aBean.activityId}">
            <input type=hidden name="activityImg" value="${aBean.activityImg}">
            <input type=hidden name="oldMaxppl" value="${aBean.activityMaxPeople}">
			<input type=hidden name="soldQuantity" value="${aBean.stock}">
            <div class="button">
              <input type="submit" name="submit" value="送出" class="btn btn-danger btn-block btn-lg"
                style="box-shadow: 2px 2px 2px gray;">
            </div>
          </form>
        </div>
      </div>
      <div class="col-lg-3"></div>
    </div>
    <br>
	<div style="text-align: center">
		<a href="<c:url value='/manageActivities' />" class="btn btn-primary btn-md">回上一頁</a>&nbsp;&nbsp;
		<a href="<c:url value='/' />" class="btn btn-primary btn-md">回首頁</a>
	</div>
  </div>
<!-- end of container -->



</body>

</html>







