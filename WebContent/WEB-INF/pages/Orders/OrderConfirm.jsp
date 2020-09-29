<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script type="text/javascript">
function cancelOrder() {
	if (confirm("確定取消此份訂單 ? ") ) {
		// 接收此資料的Servlet會使用 finalDecision 參數的值
		document.forms[0].finalDecision.value = "CANCEL";
		document.forms[0].action="<c:url value='cancelOrder' />";
		document.forms[0].method="GET";
		document.forms[0].submit();
		return;
	} else {
		return;
	}
}
function reconfirmOrder() {
	var sa = document.getElementById('ShippingAddress').value;
	if  (sa === "") {
		window.alert ('出貨地址不能是空白');
		return ; 
	}
	if (confirm("確定送出此份訂單 ? ") ) {
		// 接收此資料的Servlet會使用 finalDecision 參數的值
		document.forms[0].finalDecision.value = "ORDER";
		document.forms[0].action="<c:url value='ProcessOrder' />";
		document.forms[0].method="POST";
		document.forms[0].submit();
		return;
	} else {
		return;
	}
}
</script>
<meta charset="UTF-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 取得今天的日期，今天的日期應當在最後確認時才取得 -->
<jsp:useBean   id="today"  class="java.util.Date" scope="session"/> 
<title>訂單明細資訊確認</title>
<style type="text/css">

  .showPodcasterBody {
	padding-top: 40px;
	padding-bottom: 40px;
}

.showPodcasterBodyHeader {
	padding-top: 50px;
	/* 	border-bottom: 1px solid black;  */
}

.headtop{
	margin-top:120px;
	margin-bottom:20px;
}

</style>
</head>
<body style="background:;">
<div class="head">
		<jsp:include page="../header_banner_test.jsp" flush="true " />
	</div>

<c:set var="funcName" value="CHE" scope="session"/>
<%-- <jsp:include page="/fragment/topMVC.jsp" /> --%>
<div style="text-align:center" class="headtop">
<h3>請確認訂購資訊：</h3>
<FORM style="margin: 0 auto; width:750px;" action="<c:url value='preProcessOrder' />" method="POST" >
   <TABLE border='1' style="background:; border-color:rgb( 100, 100, 255); border-style: outset; width:810;">
      <TR >
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	會員編號：${LoginOK.memberId}
         </TD>
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	客戶姓名：${LoginOK.name}
         </TD>
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	訂單日期：<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>
         </TD>
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	會員地址：${LoginOK.address}
         </TD>
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;">
                             出貨地址：<Input style="background:;" size="60" type="text" id='ShippingAddress' 
                   name="ShippingAddress" value="${LoginOK.address}">
                   <font color='red'>${errorMsg.ShippingAddress}</font>
         </TD>
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;">
                                   統一編號：<Input style="background:;" size="10" type="text" 
                      name="BNO" value="">
         </TD>
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;">
                                   發票抬頭：<Input style="background:;" size="50" type="text" 
                      name="InvoiceTitle" value="${LoginOK.name}" >
         </TD>
      </TR>
    
      <TR>
         <TD colspan='3'>
         
   <TABLE border='1' style="background:; border-color:rgb( 100, 100, 255); " >
      
     <TR><TH style="text-align:center;font-size: 12pt;" width="350">名稱</TH>
         <TH style="text-align:center;font-size: 12pt;" width="80">活動地點</TH>
         <TH style="text-align:center;font-size: 12pt;" width="80">活動日期</TH>
         <TH style="text-align:center;font-size: 12pt;" width="80">單價</TH>
         <TH style="text-align:center;font-size: 12pt;" width="60">數量</TH>
         <TH style="text-align:center;font-size: 12pt;" width="110">小計</TH></TR>
     
     <c:forEach varStatus="vs" var="entry" items="${ShoppingCart.content}">
                                                    
        <TR height='16'>
          <TD style="text-align:left  ;font-size: 11pt;">${entry.value.activityName}</TD>
          <TD style="text-align:center;font-size: 11pt;">${entry.value.activityLocation}
<%--           	${fn:substring(entry.value.author, 0, 3)} --%>
          </TD>
          <TD style="text-align:center;font-size: 11pt;">${entry.value.activityDate}
<%--           	${fn:substring(entry.value.companyName, 0, 2)} --%>
          </TD>
          <TD style="text-align:right ;font-size: 11pt;">
                    	<fmt:formatNumber value="${entry.value.unitPrice}" pattern="#,###" />元
<%--           	<fmt:formatNumber value="${entry.value.unitPrice * entry.value.discount }" pattern="#,###" />元 --%>
          </TD>
          <TD style="text-align:right ;font-size: 11pt;"> 
          	${entry.value.quantity}
          </TD>
          <TD style="text-align:right ;font-size: 11pt;">
<%--           	<fmt:formatNumber value="${entry.value.unitPrice * entry.value.discount * entry.value.quantity}" pattern="#,###,###" />元 --%>
          	<fmt:formatNumber value="${entry.value.unitPrice * entry.value.quantity}" pattern="#,###,###" />元
          </TD>
        </TR>
     </c:forEach>
     
        <TR height='16'>
          <TD style="text-align:right;font-size: 11pt;" colspan='5' >合計金額：</TD>
          <TD style="text-align:right;font-size: 11pt;" >
          <fmt:formatNumber value="${ShoppingCart.subtotal}" pattern="#,###,###" />元</TD>             
        </TR>
<!--         <TR> -->
<!--           <TD colspan='5' style="text-align:right;font-size: 11pt;" >營業稅：</TD> -->
<%--           <c:set var="VAT" value="${ShoppingCart.subtotal*0.05 + 0.0001}"/> --%>
<!--           <TD style="text-align:right;font-size: 11pt;" >  -->
<%--           <fmt:formatNumber value="${VAT}" pattern="#,###,###" />元</TD> --%>
<!--         </TR> -->
<!--         <TR> -->
<!--           <TD colspan='5' style="text-align:right;font-size: 11pt;" >總計金額：</TD> -->
<!--           <TD style="text-align:right;font-size: 11pt;color:#AA0200;" > -->
<%--           <fmt:formatNumber value="${ShoppingCart.subtotal + VAT }" pattern="#,###,###" />元</TD> --%>
<!--         </TR> -->
   </TABLE>
          </TD>
      </TR>
 
   </TABLE><P/>
   <input type="hidden" name="finalDecision"  value="">   
   <input type="button" name="OrderBtn"  value="確定送出" onclick="reconfirmOrder()">
   <input type="button" name="CancelBtn" value="取消訂單" onclick="cancelOrder()">
</FORM>
</div>

</body>
</html>