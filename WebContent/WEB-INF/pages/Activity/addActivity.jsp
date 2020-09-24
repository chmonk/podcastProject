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

        <h1 class="text-center animated slideInDown" style="color: #fff; font-weight: bold;">新增活動</h1>

        <div id="ui" class="text-center">

          <form class="form-group" action="addActivityProcess" method="POST" enctype="multipart/form-data">


            <label>活動名稱: </label>
            <input type="text" name="activityName" class="form-control" placeholder="請輸入活動名稱" required>
            <br>

            <div class="row">
              <div class="col-lg-6 col-md-6">
                <label>活動日期: </label>
                <input type="date" name="activityDate" class="form-control" required>
              </div>

              <div class="col-lg-6 col-md-6">
                <label>舉辦時間: </label>
                <input type="text" name="activityTime" class="form-control" placeholder="06:30 pm" required>
              </div>
            </div>
            <br>
            <label>地點: </label>
            <input type="text" name="activityLocation" class="form-control" placeholder="新竹市" required>
            <br>

            <div class="row">
              <div class="col-lg-6 col-md-6">
                <label>票券價格: </label>
                <input type="text" name="activityPrice" class="form-control" placeholder="350" required>
              </div>

              <div class="col-lg-6 col-md-6">
                <label>人數上限: </label>
                <input type="text" name="activityMaxPeople" class="form-control" placeholder="100" required>
              </div>
            </div>
            <br>

            <label>活動狀態: </label>
            <select class="form-control" name="activityStatus">
            	<option>請選擇</option>
              <option value=0>公開</option>
              <option value=1>關閉</option>
            </select>
            <br>

            <label>活動內容: </label>
            <textarea name="activityContent" class="form-control" rows="3" placeholder="請輸入活動內容..."
              required> </textarea>
            <br>

            <label>活動照片: </label>
            <input type="file" name="file" class="form-control" required>
            <br>

            <div class="button">
              <input type="submit" name="submit" value="送出" class="btn btn-danger btn-block btn-lg"
                style="box-shadow: 2px 2px 2px gray;">
            </div>
          </form>
        </div>
      </div>
      <div class="col-lg-3"></div>
    </div>

  </div>
<!-- end of container -->



</body>

</html>