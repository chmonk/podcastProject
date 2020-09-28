_<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/bootstrap.min.css' />">
<title>票券訂購紀錄</title>

<style>
* {
	margin: 0 auto;
	font-size: medium;
}

body {
	background-image: url(<c:url value='/img/banner/b4.jpg' />);
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
}

.custab {
	border: 1px solid #ccc;
	padding: 5px;
	margin: 5% 0;
	box-shadow: 3px 3px 2px #ccc;
	transition: 0.5s;
}

.custab:hover {
	box-shadow: 3px 3px 0px transparent;
	transition: 0.5s;
}


th, tr {
	text-align: center;
	background-color: white;
}


.showPodcasterBody {
	padding-top: 40px;
	padding-bottom: 40px;
}

.showPodcasterBodyHeader {
	padding-top: 50px;
	/* 	border-bottom: 1px solid black;  */
}
}
.secondary-menu {
    position: fixed;
    z-index: 99999;
    width: 100%;
    background: rgba(0,0,0,0.9);
    top: 0;}
.head{ position: fixed;
top: 0;}
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
					<img alt="" src="">
				</div>
			</div>
			<div class="col-md-8">
				<div class="memberName"></div>
				<div class="memberInfo"></div>
				<div></div>
			</div>
		</div>
	</div>

	<c:set var="funcName" value="ORD" scope="session" />
	
	<div class="container-fluid">
		<div class="custyle">
			<table class="table table-striped custab">
		 <tr><td colspan='4'><b>${LoginOK.name}的訂購紀錄：</b></tr>
					<tr>
						<td>訂單編號</td>
						<td>訂購日期</td>
						<td>總金額</td>
						<td>送貨地址</td>
					</tr>
					<c:forEach var="anOrderBean" varStatus="stat"
						items="${memberOrders}">
						<tr>
							<td><a style="color:red;"
								href='<c:url value='
                                    orderDetail?memberId=${LoginOK.memberId}&ticketOrderId=${anOrderBean.ticketOrderId}' />'>
									<u>${anOrderBean.ticketOrderId}</u> </a></td>
							<td>${fn:substring(anOrderBean.orderDate, 0, 10)}</td>
							<td>${anOrderBean.totalAmount}</td>
							<td>${anOrderBean.shippingAddress}</td>
						</tr>
					</c:forEach>
					<tr>
						<td align="center" colspan="4"><a
							href="https://p.ecpay.com.tw/4AA72DD"><img
								src="https://payment.ecpay.com.tw/Content/themes/WebStyle20170517/images/ecgo.png"
								alt="" /></a></td>
					</tr>
					<tr>
						<td id='borderA' align="center" colspan="4"><a
							class="btn btn-primary"
							href="<c:url value='removeShoppingCart' />">回首頁</a></td>
					</tr>
		
			</table>
		</div>
	</div>



</body>

</html>