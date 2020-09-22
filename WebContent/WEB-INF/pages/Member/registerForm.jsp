<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>register</title>
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

<body onload="return window_onload()">
	<fieldset>
		<legend>新增會員</legend>
		<form:form action="addMemberProcess" method="POST"
			modelAttribute="MemberBean" enctype='multipart/form-data'>

			<div class="div1">
				<form:label path="account" for="" class="l1">帳號：</form:label>
				<form:input path="account" type="text" size="40" />
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="password" for="" class="l1">密碼：</form:label>
				<form:input path="password" type="password" size="40" />
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="name" for="" class="l1">姓名：</form:label>
				<form:input path="name" type="text" size="40" />
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="nickname" for="" class="l1">暱稱：</form:label>
				<form:input path="nickname" type="text" size="40" />
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="birthday" for="" class="l1">生日：</form:label>
				<form:input path="birthday" type="date" size="40" />
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="registerDate" for="" class="l1">註冊日期：</form:label>
				<form:input path="registerDate" type="text" size="40" id="text1"  value="οnfοcus=this.blur()" onfocus="this.blur()" />
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="info" for="" class="l1">自我介紹：</form:label>
				<form:textarea path="info" type="text" size="40" cols="40" rows="5" />
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="email" for="" class="l1">電子信箱：</form:label>
				<form:input path="email" type="email" size="40" />
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="cellphone" for="" class="l1">手機號碼：</form:label>
				<form:input path="cellphone" type="tel" maxlength="10" size="40" />
				<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="address" for="" class="l1">住址：</form:label>
				<form:input path="address" type="text" size="40"
					placeholder="台北市大同區大同路五段1111號30F" />
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
				<form:input path="creditCardNumber" type="text" maxlength="4"
					size="4" />
				-
				<form:input path="creditCardNumber" type="text" maxlength="4"
					size="4" />
				-
				<form:input path="creditCardNumber" type="text" maxlength="4"
					size="4" />
				-
				<form:input path="creditCardNumber" type="text" maxlength="4"
					size="4" />
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>

			<div class="div1" id="p1" style="display: none;">
				<form:label path="bankAccount" for="" class="l1">銀行帳號：</form:label>
				<form:input path="bankAccount" size="40" />
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
				<input type="submit" value="送出"> <input type="reset"
					value="清除">
			</div>
		</form:form>
	</fieldset>
</body>
</html>