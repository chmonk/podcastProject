<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單列表</title>
<style type="text/css">
#borderA {
   border:1px solid black;
}

</style>
</head>
<body style="background:;">
<c:set var="funcName" value="ORD" scope="session"/>

	<!-- 引入共同的頁首 -->
<%-- 	<jsp:include page="/fragment/topMVC.jsp" /> --%>
    <p/>
	<table style="margin-left:auto; margin-right:auto; width:810; background:; border:2px solid blue; border-style: outset; ">

		<tr id='borderA' height='50' >
			<th id='borderA'  colspan="4" align="center">${LoginOK.name}的訂購紀錄</th>
		</tr>
		<tr id='borderA' height='36' >
			<th id='borderA'>訂單編號</th>
			<th id='borderA'>訂購日期</th>
			<th id='borderA'>總金額</th>
			<th id='borderA'>送貨地址</th>
		</tr>
		<c:forEach var="anOrderBean" varStatus="stat" items="${memberOrders}">
			<TR id='borderA' height='30'>
			<TD id='borderA' width="86" align="center">
			    <a  href='<c:url value='orderDetail?memberId=${LoginOK.memberId}&ticketOrderId=${anOrderBean.ticketOrderId}' />'>
				    ${anOrderBean.ticketOrderId}
			    </a>
			</TD> 
			<TD id='borderA' width="100" align="center">${fn:substring(anOrderBean.orderDate, 0, 10)}</TD>
			<TD id='borderA' width="80" align="right">${anOrderBean.totalAmount}</TD>
			<TD id='borderA' width="400" align="left">&nbsp;${anOrderBean.shippingAddress}</TD>
							
		</TR>
		</c:forEach>
		<tr height='36' id='borderA' ><td align="center" colspan="4">
		<a href="https://p.ecpay.com.tw/4AA72DD"><img src="https://payment.ecpay.com.tw/Content/themes/WebStyle20170517/images/ecgo.png" alt=""/></a>
		</td></tr>
		
		<tr height='36' id='borderA'>
			<td id='borderA' align="center" colspan="4"><a href="<c:url value='removeShoppingCart' />">回首頁</a></td>
		</tr>
	</TABLE>
	</center>
</body>
</html>