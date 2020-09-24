<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>修改會員資料</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />">
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
					style="color: #fff; font-weight: bold;">修改會員</h1>
				<div id="ui" class="text-center">
					<form class="form-group" action="updateMemberProcess" method="POST"
						enctype='multipart/form-data'>
						<div>
							<label>帳號：</label> <input type="text" name="account"
								class="form-control" value="${MemberBean.account}">
						</div>
						<br>


						<div>
							<label>密碼：</label> <input type="password" name="password"
								class="form-control" value="${MemberBean.password}">
						</div>
						<br>

						<div>
							<label>姓名：</label> <input type="text" name="name"
								class="form-control" value="${MemberBean.name}">
						</div>
						<br>

						<div>
							<label>暱稱：</label> <input type="text" name="nickname"
								class="form-control" value="${MemberBean.nickname}">
						</div>
						<br>


						<div>
							<label>生日：</label> <input type="date" name="birthday"
								class="form-control" value="${MemberBean.birthday}">
						</div>
						<br>

						<div>
							<label>註冊日期：</label> <input type="date" name="registerDate"
								class="form-control" value="${MemberBean.registerDate}">
						</div>
						<br>

						<div>
							<label>自我介紹：</label>
							<textarea name="info" class="form-control" rows="5"
								>${MemberBean.info}</textarea>
						</div>
						<br>

						<div>
							<label>電子信箱：</label> <input type="text" name="email"
								class="form-control" value="${MemberBean.email}">
						</div>
						<br>

						<div>
							<label>手機號碼：</label> <input type="text" name="cellphone"
								class="form-control" value="${MemberBean.cellphone}">
						</div>
						<br>

						<div>
							<label>住址：</label> <input type="text" name="address"
								class="form-control" value="${MemberBean.address}">
						</div>
						<br>

						<div>
							<label>性別：</label> <select class="form-control" name="sex" >
								<option value="-1">---請選擇---</option>
								<c:forEach items="${MemberBean.account}" var="d" varStatus="i">
								<option value="${MemberBean.sex}" selected>${MemberBean.sex}</option>
								</c:forEach>
							</select>
						</div>
						<br>

						<div>
							<label>照片：</label> <input type="file" name="file" 
								class="form-control" onchange="readURL(this)" targetID="preview_progressbarTW_img" accept="image/gif, image/jpeg, image/png" required/><br/>
   									<img id="preview_progressbarTW_img" src="${MemberBean.image}" style="max-width: 300px; max-height: 300px;"/>   								
						</div>
						<br>

						<div>
							<label>角色：</label> <select class="form-control" name="role" >
								<option value="-1">---請選擇---</option>
								<c:forEach items="${MemberBean.account}" var="d" varStatus="i">
								<option value="${MemberBean.role}" selected>${MemberBean.role}</option>
								</c:forEach>				
							</select>
						</div>
						<br>

						<div>
							<label>信用卡號：</label> <input type="text" name="creditCardNumber"
								class="form-control" value="${MemberBean.creditCardNumber}">
						</div>
						<br>

						<div  class="resources" style=" display: none;">
							<label>銀行帳號：</label> <input type="text" name="bankAccount"
								class="form-control"  value="${MemberBean.bankAccount}">
						</div>
						<br>

						<div  class="resources" style=" display: none;">
							<label>頻道月費：</label> <select class="form-control" name="monthlyPayment" >
								<option value="-1">---請選擇---</option>
								<c:forEach items="${MemberBean.account}" var="d" varStatus="i">
								<option value="${MemberBean.monthlyPayment}" selected>${MemberBean.monthlyPayment}</option>
								</c:forEach>
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
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>修改會員資料</title>
<script type="text/javascript">
	function removeElement() {
		document.getElementById("p1").style.display = "none";
		document.getElementById("p2").style.display = "none";
		
	}
	function showElement() {
		document.getElementById("p1").style.display = "block";
		document.getElementById("p2").style.display = "block";
	}
	function window_onload() {
		var text1 = window.document.getElementById('text1');
		var now = new Date();
		var today = now.getFullYear().toString() + '-'
				+ (now.getMonth() + 1).toString() + '-'
				+ now.getDate().toString();
		text1.value = today;
	}
</script>
</head>
<style>
* {
	margin: 0 auto;
}

fieldset {
	width: 500px;
	border: 2px solid;
	border-radius: 15px;
	/* 	background-color: beige; */
}

.div1 {
	width: 450px;
	border-bottom: 3px dashed #E0E0E0;
	margin: 20px;
	padding-bottom: 10px;
}

.div2 {
	display: flex;
	justify-content: center;
	margin-bottom: 15px;
}

.div2 input {
	margin: 1px
}

.notice {
	font-size: 10px;
}

.wrong_contnet {
	color: red;
	font-size: small;
}

.right_contnet {
	color: green;
	font-size: small;
}

.l1 {
	width: 100px;
	float: left;
	text-align: right;
}
</style>

<body>
	<fieldset>
		<legend>修改會員</legend>
		<form:form action="updateMemberProcess" method="POST"
			modelAttribute="MemberBean" enctype='multipart/form-data'>

			<div class="div1">
				<form:label path="account" for="" class="l1">帳號：</form:label>
				<form:input path="account" type="text" size="40"  value="${MemberBean.account}"/>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="password" for="" class="l1">密碼：</form:label>
				<form:input path="password" type="password" size="40" value="${MemberBean.password}"/>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="name" for="" class="l1">姓名：</form:label>
				<form:input path="name" type="text" size="40" value="${MemberBean.name}"/>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="nickname" for="" class="l1">暱稱：</form:label>
				<form:input path="nickname" type="text" size="40" value="${MemberBean.nickname}"/>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="birthday" for="" class="l1">生日：</form:label>
				<form:input path="birthday" type="date" size="40" value="${MemberBean.birthday}"/>
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>

			<div class="div1" style="display: none;">
				<form:label path="registerDate" for="" class="l1" >註冊日期：</form:label>
				<form:input path="registerDate" type="text" size="40" id="text1"  value="${MemberBean.registerDate}"/>
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="info" for="" class="l1">自我介紹：</form:label>
				<form:textarea path="info" type="text" size="40" cols="40" rows="5" value="${MemberBean.info}"/>
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="email" for="" class="l1">電子信箱：</form:label>
				<form:input path="email" type="email" size="40" value="${MemberBean.email}"/>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="cellphone" for="" class="l1">手機號碼：</form:label>
				<form:input path="cellphone" type="tel" maxlength="10" size="40" value="${MemberBean.cellphone}"/>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="address" for="" class="l1">住址：</form:label>
				<form:input path="address" type="text" size="40" value="${MemberBean.address}"/>
				<span id="idsp1"></span>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<label for="" class="l1">性別：</label> <input type=radio name="sex"
					value=男 />男 <input type=radio name="sex" value=女 />女 <span
					id="idsp1"></span>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<label for="" class="l1">照片：</label> <input type="file" name="file"
					size="40">
				<div class="notice"></div>
			</div>

			<div class="div1">
				<label for="" class="l1">角色：</label> <input type=radio name="role"
					value=1 onclick="removeElement()" />一般會員 <input type=radio
					name="role" value=2 onclick="showElement()" />播客 <span id="idsp1"></span>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="creditCardNumber" for="" class="l1">信用卡號：</form:label>
				<form:input path="creditCardNumber" type="text" maxlength="20"
					size="40" value="${MemberBean.creditCardNumber}"/>				
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>

			<div class="div1" id="p1" style="display: none;">
				<form:label path="bankAccount" for="" class="l1">銀行帳號：</form:label>
				<form:input path="bankAccount" size="40" value="${MemberBean.bankAccount}"/>
				<span id="idsp1"></span>
				<div class="notice"></div>
			</div>

			<div class="div1" id="p2" style="display: none;">
				<label for="" class="l1">頻道月費：</label> <input type="radio"
					name="monthlyPayment" value=0 checked="checked">免費 <input type="radio"
					name="monthlyPayment" value=100>100元 <input type="radio"
					name="monthlyPayment" value=300>300元 <span id="idsp1"></span>
				<div class="notice"></div>
			</div>

			<div class="div2">
				<input type="submit" value="確認修改">
			</div>
		</form:form>
	</fieldset>
</body>
</html>--%>