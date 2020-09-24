<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>新增會員資料</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/bootstrap.min.css' />">
<script type="text/javascript">

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

	function window_onload() {
		var text1 = window.document.getElementById('registerDate');
		var now = new Date();
		var today = now.getFullYear().toString() + '-'
				+ (now.getMonth() + 1).toString() + '-'
				+ now.getDate().toString();
		text1.value = today;
	}
	
     function dateValidation(str) {
     	  var re = new RegExp("^([0-9]{4})[.-]{1}([0-9]{1,2})[.-]{1}([0-9]{1,2})$");
     	  var days = [0, 31, 28, 31, 30,  31, 30, 31, 31, 30, 31, 30, 31];
     	  var strDataValue;
     	  var valid = true;
     	  if ((strDataValue = re.exec(str)) != null) {
     	    var y, m, d;
     	    y = parseFloat(strDataValue[1]);
     	    if (y <= 0 || y > 9999) { /*年*/
     	      return false;
     	    } 
     	    m = parseFloat(strDataValue[2]);
     	    
     	    if (m < 1 || m > 12) { /*月*/
     	        return false;
     	    }
     	    d = parseFloat(strDataValue[3]);
     	    if ( y % 4 == 0 && y % 100 != 0 || y % 400 == 0 ){
     	       days[2] = 29;
     	    }  else {
     	       days[2] = 28;
     	    }
     	    if (d <= 0 || d > days[m]) { /*日*/
     	      valid = false;
     	    }
     	  } else {
     	    valid = false;
     	  }  
     	  return valid;
     	}

     	function isEmail(email) {
     		return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
     	}
          
</script>
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
				<h1 class="text-center animated slideInDown"
					style="color: #fff; font-weight: bold;">新增會員資料</h1>
				<div id="ui" class="text-center">
					<form class="form-group" action="addMemberProcess" method="POST"
						enctype='multipart/form-data'>
						<div>
							<label>帳號：</label> <input type="text" name="account"
								class="form-control" placeholder="設定系統帳號" required>
						</div>
						<br>


						<div>
							<label>密碼：</label> <input type="password" name="password"
								class="form-control" placeholder="設定登入密碼" required>
						</div>
						<br>

						<div>
							<label>姓名：</label> <input type="text" name="name"
								class="form-control" placeholder="請輸入姓名" required>
						</div>
						<br>

						<div>
							<label>暱稱：</label> <input type="text" name="nickname"
								class="form-control" placeholder="請輸入暱稱" required>
						</div>
						<br>


						<div>
							<label>生日：</label> <input type="date" name="birthday"
								class="form-control" required>
						</div>
						<br>

						<div>
							<label>註冊日期：</label> <input type="date" name="registerDate"
								class="form-control" required>
						</div>
						<br>


						<div>
							<label>自我介紹：</label>
							<textarea name="info" class="form-control" rows="5"
								placeholder="請輸入自我介紹..." required> </textarea>
						</div>
						<br>

						<div>
							<label>電子信箱：</label> <input type="text" name="email"
								class="form-control" placeholder="abc@aaa.com" required>
						</div>
						<br>

						<div>
							<label>手機號碼：</label> <input type="text" name="cellphone"
								class="form-control" placeholder="0987654321" required>
						</div>
						<br>

						<div>
							<label>住址：</label> <input type="text" name="address"
								class="form-control" placeholder="台北市中正區重慶南路一段122號" required>
						</div>
						<br>

						<div>
							<label>性別：</label> <select class="form-control" name="sex"
								required>
								<option value="">---請選擇---</option>
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
						</div>
						<br>

						<div>
							<label>照片：</label> <input type="file" name="file"
								class="form-control" onchange="readURL(this)"
								targetID="preview_progressbarTW_img"
								accept="image/gif, image/jpeg, image/png" required /><br /> <img
								id="preview_progressbarTW_img" src="<c:url value='/img/unnamed.jpg' />"
								style="max-width: 300px; max-height: 300px;" />
						</div>
						<br>

						<div>
							<label>角色：</label> <select class="form-control" name="role"
								id="role" required>
								<option value="">---請選擇---</option>
								<option value="1">一般會員</option>
								<option value="2">播客</option>
							</select>
						</div>
						<br>

						<div>
							<label>信用卡號：</label> <input type="text" name="creditCardNumber"
								class="form-control" placeholder="xxxx-xxxx-xxxx-xxxx">
						</div>
						<br>

						<div class="resources" style="display: none;">
							<label>銀行帳號：</label> <input type="text" name="bankAccount"
								class="form-control" id="reason" placeholder="xxx-xxxxxxxxxxxx">
						</div>
						<br>

						<div class="resources" style="display: none;">
							<label>頻道月費：</label> <select class="form-control"
								name="monthlyPayment" id="reason1">
								<option value="">---請選擇---</option>
								<option value=0 selected>免費</option>
								<option value=100>100元</option>
								<option value=300>300元</option>
							</select>
						</div>
						<br>

						<div class="button">
							<input type="submit" name="submit" value="送出"
								class="btn btn-danger btn-block btn-lg"
								style="box-shadow: 2px 2px 2px gray;">
						</div>

					</form>
				</div>
			</div>
			<div class="col-lg-3"></div>
		</div>
	</div>

</body>
</html>