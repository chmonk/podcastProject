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
<script type="text/javascript"
	src="js/jquery.js"></script>
<script type="text/javascript">




	
	//預覽圖片用
	function readURL(input){
	  if(input.files && input.files[0]){
	    var imageTagID = input.getAttribute("targetID");
	    var reader = new FileReader();
	    reader.onload = function (e) {
	       var img = document.getElementById(imageTagID);
	       img.setAttribute("src", e.target.result);
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

	//日期檢核(無需用到)
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

     	//輸入密碼時轉成text password 
     	$(document).ready(function(){

     		$("#pass").on("focus",function(){
     			var pass = $('<input type="password" id="pass" name="password" class="form-control" onblur="checkpassword()"  required>');
     			console.log(this);
     	        $(this).replaceWith(pass);
     	        pass.focus();
     		});
     	})	
     	
     	//確認帳號可否使用
     	function checkAcount(account){
     			let accountValue= $("#account").val();
     			if(accountValue.trim()==""){
						console.log("null");
						console.log($("#acountRS").text());
						$("#acountRS").text("不可為空").removeClass("right").addClass("wrong");
						return;
         			}
         	 	console.log('account is '+ accountValue);
           		let xhr=new XMLHttpRequest();
            	xhr.open("get",'<c:url value="/checkAccount"/>?account='+accountValue,true);
            	xhr.send();

				xhr.onreadystatechange=function(){
					if(xhr.readyState==4 && xhr.status==200){
						let result= xhr.responseText;
						console.log("async"+result);


						if(result==="可以使用"){
							$("#acountRS").text(result).removeClass("wrong").addClass("right");
							}else{
							$("#acountRS").text(result).removeClass("right").addClass("wrong");
							}
						
						
	                	}else{
							console.log("no get");
	                    	}
	        			}

					}

     	//一鍵輸入
     	function fillBlank(){

     		$("#acountRS").text("");;
     		$("#nicknameRS").text("");
     		$("#passRS").text("");

     		
			$("#account").val("Duke");
			$("#pass").val("Duke1111"); 
			$("#name").val("Duke");
			$("#nickname").val("浪漫duke");
			$("#gender")[0].selectedIndex=0;  //男
			$("#role")[0].selectedIndex=1;	//播客
			$("#birth").val("2012-09-10");
			$("#info").text("洋流操盤手");
			$("#email").val("ssssss@gmail.com");
			$("#cellphone").val("0977777777");
			$("#address").val("台北市大安區復興南路一段390號");
			$("#creditCardNumber").val("1111-1111-1111-1111");

			checkAcount();
			checkpassword();
			checkNickname();
	
}
     	//確認密碼可否使用
     	function checkpassword(){

     		$("#passRS").html="<span id='passRS'>這裡</span>";
         	
     			let passValue= $("#pass").val();
     			if (passValue == null || passValue.length == 0) {
     				$("#passRS").text("不可為空").removeClass("right").addClass("wrong");
     			}else if(!passValue.match(".*\\d+.*")){
     				$("#passRS").text("需含有數字").removeClass("right").addClass("wrong");
				}else if(!passValue.match(".*[a-zA-Z]+.*")){
     				$("#passRS").text("需含有大小寫字母").removeClass("right").addClass("wrong");
				}else{
					$("#passRS").text("可以使用").removeClass("wrong").addClass("right");
				}
				console.log( $("#pass").val());
     	}  


 
     	//確認暱稱可否使用
     	function checkNickname(){
     			let nickname= $("#nickname").val();
     			if(nickname.trim()==""){
						console.log("null");
						$("#nicknameRS").text("不可為空").removeClass("right").addClass("wrong");
						return;
         			}
         	 	console.log('nickname is '+ nickname);
           		let xhr=new XMLHttpRequest();
            	xhr.open("get",'<c:url value="/checkNickname"/>?nickname='+nickname,true);
            	xhr.send();

				xhr.onreadystatechange=function(){
					if(xhr.readyState==4 && xhr.status==200){
						let result= xhr.responseText;
						console.log("async"+result);
						if(result==="可以使用"){
							$("#nicknameRS").text(result).removeClass("wrong").addClass("right");
							}else{
							$("#nicknameRS").text(result).removeClass("right").addClass("wrong");
							}
	                	}else{
							console.log("no get");
	                    	}
	        			}

					}
     	
 

</script>
<style type="text/css">
body {
	background-image: url(<c:url value='/img/banner/b6.jpg'/>);
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

.aaa {
	display: inline-block;
}

.wrong{
color: red;
}

.right{
color: 	#28FF28;
}

</style>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<h1 class="text-center animated slideInDown"
					style="color: #fff; font-weight: bold;">新增會員資料</h1>
				<div id="ui" class="text-center">
					<form class="form-group" action="addMemberProcess" method="POST"
						enctype='multipart/form-data'>

						<!-- 						<div> -->
						<!-- 							<label>註冊日期：</label> <input type="hidden" name="registerDate" -->
						<!-- 								class="form-control" required value="2020-09-28"> -->
						<!-- 						</div> -->
						<!-- 						<br> -->



						<div class="row">
							<div class="col-sm-6">
								<label style="display: inline-block;">帳號：<font
									color="red">${err.account}</font></label> <input type="text"
									name="account" id="account" class="form-control"
									placeholder="請輸入帳號" onblur="checkAcount()" required />
									<span id="acountRS">這裡</span>
							</div>
							<div class="col-sm-6">
								<label>密碼：<font color="red">${err.password}</font></label> <input
									type="text" id="pass" name="password" class="form-control"
									placeholder="請輸入密碼"  required>
									<span id="passRS">這裡</span>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-6">
								<label>姓名：<font color="red">${err.name}</font></label> <input
									type="text" id="name" name="name" class="form-control"
									placeholder="請輸入姓名" required>
							</div>
							<div class="col-sm-6">
								<label>暱稱：<font color="red">${err.nickname}</font></label> <input
									type="text" id="nickname" name="nickname"  onblur="checkNickname()"  class="form-control"
									placeholder="請輸入暱稱" required><span id="nicknameRS">這裡</span>
							</div>
						</div>

						<br>
						<div class="row">
							<div class="col-sm-6">
								<label>性別：<font color="red">${err.sex}</font></label> <select
									class="form-control" name="sex" id="gender"> 
									<!--<option value="">---請選擇---</option>-->
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
							<div class="col-sm-6">
								<label>角色：<font color="red">${err.role}</font></label> <select
									class="form-control" name="role" id="role" required >
									<!--  <option value="">---請選擇---</option>-->
									<option value="1">一般會員</option>
									<option value="2">播客</option>
								</select>
							</div>
						</div>

						<br>

						<div>
							<label>生日：<font color="red">${err.birthday}</font></label> <input
								id="birth" type="date" name="birthday" class="form-control"
								required>
						</div>
						<br>

						<div>
							<label>自我介紹：</label>
							<textarea name="info" id="info" class="form-control" rows="5"
								placeholder="請輸入自我介紹..." required></textarea>
						</div>
						<br>

						<div>

							<label>電子信箱：<font color="red">${err.email}</font></label> <input
								type="text" id="email" name="email" class="form-control"
								placeholder="請輸入信箱" required>

						</div>
						<br>

						<div>

							<label>手機號碼：<font color="red">${err.cellphone}</font></label> <input
								type="text" id="cellphone" name="cellphone" class="form-control"
								placeholder="請輸入手機" required>

						</div>
						<br>


						<div>


							<label>住址：<font color="red">${err.address}</font></label> <input
								type="text"  id="address" name="address" class="form-control"
								placeholder="請輸入地址" required>

						</div>
						<br>

						<div>
							<label>照片：<font color="red">${err.file}</font></label> <input
								type="file" name="file" class="form-control"
								onchange="readURL(this)" targetID="preview_progressbarTW_img"
								accept="image/gif, image/jpeg, image/png" required /><br /> <img
								id="preview_progressbarTW_img"
								src="<c:url value='/img/unnamed.jpg' />"
								style="max-width: 300px; max-height: 300px;" />
						</div>
						<br> <br>

						<div>
							<label>信用卡號：<font color="red">${err.creditCardNumber}</font></label>
							<input  type="text"  id="creditCardNumber"  name="creditCardNumber" class="form-control"
								placeholder="xxxx-xxxx-xxxx-xxxx">
						</div>
						<br>

						<div class="resources" style="display: none;">
							<label>銀行帳號：<font color="red">${err.bankAccount}</font></label> <input
								type="text" name="bankAccount" class="form-control" id="reason"
								placeholder="xxx-xxxxxxxxxxxx">
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
			<div class="col-sm-3"></div>
		</div>
	</div>
	<br>
	<div style="text-align: center; margin-bottom: 20px;">
		<a href="<c:url value='/' />" class="btn btn-primary btn-md">回首頁</a>
		<button  class="btn btn-primary btn-md" onclick="fillBlank()">一鍵輸入</button>
	</div>
	

</body>
</html>