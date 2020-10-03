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
    .aaa{
     display: inline-block; 
    }
  </style>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<h1 class="text-center animated slideInDown"
					style="color: #fff; font-weight: bold;">修改會員資料</h1>
				<div id="ui" class="text-center">
					<form class="form-group" action="updateMemberProcess" method="POST"
						enctype='multipart/form-data'>

<!-- 						<div> -->
<!-- 							<label>註冊日期：</label> <input type="hidden" name="registerDate" -->
<!-- 								class="form-control" required value="2020-09-28"> -->
<!-- 						</div> -->
<!-- 						<br> -->



						<div class="row">
							<div class="col-sm-6">
								<label style=" display: inline-block; ">帳號：<font color="red">${err.account}</font></label> <input type="text" name="account"
									class="form-control" placeholder="請輸入帳號" value="${MemberBean.account}" readonly="readonly">
							</div>
							<div class="col-sm-6">
							<label>密碼：<font color="red">${err.password}</font></label> <input type="password" name="password"
								class="form-control" placeholder="請輸入密碼" value="${MemberBean.password}" required>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-6">
								<label>姓名：<font color="red">${err.name}</font></label>
								<input type="text" name="name"
									class="form-control" placeholder="請輸入姓名" value="${MemberBean.name}" required>
							</div>
							<div class="col-sm-6">
								<label>暱稱：<font color="red">${err.nickname}</font></label> 
								<input type="text" name="nickname"
									class="form-control" placeholder="請輸入暱稱" value="${MemberBean.nickname}" required>
							</div>
						</div>
					
						<br>
						<div class="row">
							<div class="col-sm-6">
								<label>性別：<font color="red">${err.sex}</font></label>
								 <select class="form-control" name="sex" readonly="readonly" value="${MemberBean.sex}">
									<!--<option value="">---請選擇---</option>-->
									<option value="男" id="status0" readonly="readonly">男</option>
									<option value="女" id="status1" readonly="readonly">女</option>
								</select>
							</div>
							<div class="col-sm-6">
								<label>角色：<font color="red">${err.role}</font></label> 
								<select class="form-control" name="role"
									id="role" required>
									<option value="-1">請選擇</option>
									<option value="2" id="role2">播客</option>
									<option value="1" id="role1">一般會員</option>
									
								</select>
							</div>
						</div>
					
						<br>

						<div>
							<label>生日：<font color="red">${err.birthday}</font></label> <input type="date" name="birthday"
								class="form-control" value="${MemberBean.birthday}" required>
						</div>
						<br>

						<div>
							<label>自我介紹：</label>
							<textarea name="info" class="form-control" rows="5"
								placeholder="請輸入自我介紹..." required>${MemberBean.info}</textarea>
						</div>
						<br>

						<div>

							<label>電子信箱：<font color="red">${err.email}</font></label> <input type="text" name="email"
								class="form-control" placeholder="請輸入信箱" value="${MemberBean.email}" required>

						</div>
						<br>

						<div>

							<label>手機號碼：<font color="red">${err.cellphone}</font></label> <input type="text" name="cellphone"
								class="form-control" placeholder="請輸入手機" value="${MemberBean.cellphone}" required>

						</div>
						<br>


						<div>
						

							<label>住址：<font color="red">${err.address}</font></label> <input type="text" name="address"
								class="form-control" placeholder="請輸入地址" value="${MemberBean.address}" required>
	

						</div>
						<br>

						<div>
							<label>照片：<font color="red">${err.file}</font></label> <input type="file" name="file"
								class="form-control" onchange="readURL(this)"
								targetID="preview_progressbarTW_img"
								accept="image/gif, image/jpeg, image/png" id="file"/><br /> <img
								id="preview_progressbarTW_img" src="${MemberBean.image}"
								style="max-width: 300px; max-height: 300px;" />
						</div>
						<br>


						<br>

						<div>
							<label>信用卡號：<font color="red">${err.creditCardNumber}</font></label> <input type="text" name="creditCardNumber"
								class="form-control" value="${MemberBean.creditCardNumber}" placeholder="xxxx-xxxx-xxxx-xxxx">
						</div>
						<br>

						<div class="resources" style="display: none;">
							<label>銀行帳號：<font color="red">${err.bankAccount}</font></label> <input type="text" name="bankAccount"
								class="form-control" id="reason" value="${MemberBean.bankAccount}" placeholder="xxx-xxxxxxxxxxxx">
						</div>
						<br>

						<div class="resources" style="display: none;">
							<label>頻道月費：</label> <select class="form-control"
								name="monthlyPayment" id="reason1">
								<option value=0 id="pay0" selected>免費</option>
								<option value=100 id="pay100">100元</option>
								<option value=300 id="pay300">300元</option>
							</select>
						</div>
						<br>
						<input type=hidden name="oldImage" value="${MemberBean.image}">

						<div class="button">
							<input type="submit" name="submit" value="送出"
								class="btn btn-danger btn-block btn-lg"
								style="box-shadow: 2px 2px 2px gray;">
						</div>

					</form>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
	<br>
	<div style="text-align: center">
			<a href="<c:url value='/' />" class="btn btn-primary btn-md">回首頁</a>
		</div>

<script>
window.onload=function(){
// 	var sex=${MemberBean.sex};
// 	document.getElementById("status"+sex).selected=true;

	var role=${MemberBean.role};
	document.getElementById("role"+role).selected=true;

	var monthlyPayment=${MemberBean.monthlyPayment};
	document.getElementById("pay"+monthlyPayment).selected=true;


	}


</script>


</body>
</html>