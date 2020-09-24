<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>會員基本資料</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/bootstrap.min.css' />">
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
					style="color: #fff; font-weight: bold;">會員基本資料</h1>
				<div id="ui" class="text-center">
					<form class="form-group" enctype='multipart/form-data'>
						<div class="form-control">
							帳號：${MemberBean.account}
						</div><br /> 
							
						<div class="form-control">					
							註冊日期：${MemberBean.registerDate}
							</div><br /> 
							
						<div class="form-control">		
							姓名：${MemberBean.name}
							</div><br /> 
							
						<div class="form-control">		
							暱稱：${MemberBean.nickname}
							</div><br /> 
							
						<div class="form-control">		
							生日：${MemberBean.birthday}
							</div><br /> 
							
						<div class="form-control">	
							自我介紹：${MemberBean.info}
							</div><br /> 
							
						<div class="form-control">
							電子信箱：${MemberBean.email}
							</div><br /> 
							
						<div class="form-control">
							手機號碼：${MemberBean.cellphone}
							</div><br /> 
							
						<div class="form-control">
							住址：${MemberBean.address}
							</div><br /> 
							
						<div class="form-control">
							性別：${MemberBean.sex}
							</div><br /> 
							
						<div class="form-control" style="height: 300px">
							照片：				
							<img src="${MemberBean.image}"
								style="max-width: 300px; max-height: 300px;">
						</div><br /> 
							
						<div class="form-control">
							角色：${MemberBean.role}
							</div><br /> 
							
						<div class="form-control">
							信用卡號：${MemberBean.creditCardNumber}
							</div><br /> 
							
						<div class="form-control">
							銀行帳號：${MemberBean.bankAccount}
							</div><br /> 
							
						<div class="form-control">
							頻道月費：${MemberBean.monthlyPayment}				
						</div><br>

						<div class="button">
							<Input type="button" name="" value="首頁" onclick="location='http://localhost:8080/SpringWebProject/'">
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-3"></div>
		</div>
	</div>
</body>
</html>
