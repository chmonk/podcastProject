<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
    
<%
response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server 
response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance 
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale" 
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility 
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function confirmDelete(n) {
	if (confirm("確定刪除此項商品 ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem.do?cmd=DEL&activityId=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	
	}
}
function modify(key, qty, index) {
	var x = "newQty" + index;
	var newQty = document.getElementById(x).value;
	if  (newQty < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}
	if  (newQty == 0 ) {
		window.alert ("請執行刪除功能來刪除此項商品");
		document.getElementById(x).value = qty;
		return ; 
	}
	if  (newQty == qty ) {
		window.alert ("新、舊數量相同，不必修改");
		return ; 
	}
	if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty + " ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem.do?cmd=MOD&activityId=" + key + "&newQty=" + newQty +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
		document.getElementById(x).value = qty;
	}
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57)){
      return false;
   }
   return true;
}
function Checkout(qty) {
	if (qty == 0)  {
		alert("無購買任何商品，不需結帳");
		return false;
	}
	if (confirm("再次確認訂單內容 ? ") ) {
		return true;
	} else {
		return false;
	}
}
function Abort() {
	if (confirm("確定放棄購物 ? ") ) {
		return true;
	} else {
		return false;
	}
}
</script>
<style type="text/css">
    .showPodcasterBody {
	padding-top: 40px;
	padding-bottom: 40px;
}

.showPodcasterBodyHeader {
	padding-top: 50px;
	/* 	border-bottom: 1px solid black;  */
}

</style>
<meta charset="UTF-8">
<title>購物清單</title>
</head>
<body style="background:;">

<div class="head">
		<jsp:include page="../header_banner_test.jsp" flush="true " />
	</div>

<c:set var="funcName" value="CHE" scope="session"/>


<c:choose>
   <c:when test="${ShoppingCart.subtotal > 0}">
      <c:set var="subtotalMessage" value="金額小計:${ShoppingCart.subtotal} 元"/>
      <c:set var="subtotal" value="${ShoppingCart.subtotal}"/>  
   </c:when>
   <c:otherwise>
      <c:set var="subtotalMessage" value="金額小計:  0 元"/>
      <c:set var="subtotal" value="0"/>                
   </c:otherwise>
</c:choose>


<table style="margin: 0 auto; width:820px; background:; border:1px solid grey; ">
<tr><td colspan='4'>
<!--          購物車的標題          --> 
   <table style="width:820px">
     <tr height='40'>
     	<td width="270">&nbsp;</td>
     	<td width="280" align='center'><FONT  size='+2'>${AppName}</FONT></td>
     	<td width="270" align='right'></td>
     </tr>
     <tr height='18'>
     	<td width="270">&nbsp;</td>
     	<td width="280" align='center'><FONT  size='+2'>購 物 清 單</FONT></td>
     	<td width="270" align='right'></td>
     </tr>
</table>
</td></tr>

<tr>
   <td>
     <table border='1'>
     <tr><th width="280">名稱</th><th width="80">活動地點</th><th width="80">活動日期</th><th width="60">單價</th><th width="40">數量</th><th width="110">小計</th><th width="110">修改</th></tr>
     <c:forEach varStatus="vs" var="anEntry" items="${ShoppingCart.content}">
        <tr height='16'>
          <td >${anEntry.value.activityName}</td>
          <td style="text-align:center;">${anEntry.value.activityLocation}</td>
          <td style="text-align:center;">${anEntry.value.activityDate}</td>
          <td style="text-align:right;"><fmt:formatNumber value="${anEntry.value.unitPrice}" pattern="#,###" />元</td>
          <td style="text-align:right;">
                <Input id="newQty${vs.index}" style="width:28px;text-align:right" name="newQty" type="text" value="<fmt:formatNumber value="${anEntry.value.quantity}" />" name="qty" onkeypress="return isNumberKey(event)"  />
          </td>
          <td style="text-align:right;"><fmt:formatNumber value="${anEntry.value.unitPrice * anEntry.value.quantity}" pattern="#,###,###" />元</td>
          <td ><Input type="button" name="update" value="修改" onclick="modify(${anEntry.key}, ${anEntry.value.quantity}, ${vs.index})">
               <Input type="button" name="delete" value="刪除" onclick="confirmDelete(${anEntry.key})"></td>
        </tr>
     </c:forEach>
        <tr height='16'>
          <td colspan='5' align='right'>合計金額：</td>
          <td align='right'><fmt:formatNumber value="${subtotal}" pattern="#,###,###" />元</td>
          <td align='right'>&nbsp;</td>          
        </tr>
<!--         <tr> -->
<!--           <td colspan='5' align='right'>營業稅：</td> -->
<%--           <c:set var="VAT" value="${subtotal*0.05 + 0.0001}"/> --%>
<%--           <td align='right'><fmt:formatNumber value="${VAT}" pattern="#,###,###" />元</td> --%>
<!--           <td align='right'>&nbsp;</td>           -->
<!--         </tr> -->
        <tr>
          <td colspan='5' align='right'>總計金額：</td>
          <td align='right'><fmt:formatNumber value="${subtotal}" pattern="#,###,###" />元</td>
          <td align='right'>&nbsp;</td>          
        </tr>
   </table>
   
   </td>
</tr>
<tr height='80'>
   <td > 
     <table border='1'>
        <tr >
          <td width="265" align='center'>
              <a href="<c:url value='/#events' />">繼續購物</a>
          </td>
          <td width="265" align='center'>
              <a href="<c:url value='checkout' />" onClick="return Checkout(${subtotal});">再次確認</a>
          </td>
          <td width="265" align='center'>
              <a href="<c:url value='abort' />" onClick="return Abort();">放棄購物</a>
          </td>
        </tr>
     </table>
   </td>
</tr>
</table>
<div style='text-align:center;'>
<c:if test='${not empty OrderErrorMessage}'>
		<font color='red'>${OrderErrorMessage}</font>
		<c:remove var="OrderErrorMessage"/>	
</c:if>
</div>
    
<form>
   <input type="hidden" name="a"/>
</form>

</body>
</html>