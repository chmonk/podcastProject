<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />">
    <title>Document</title>

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

        .name {
            width: 200px;
        }

table{ border-radius: 10px;}
        th,
        tr {
        border-radius-top-left:10px;
        border-radius-top-right:10px;
            text-align: center;
            background-color: white;
        }

        h1 {
            color: white;
        }
            .showPodcasterBody {
	padding-top: 40px;
	padding-bottom: 40px;
}

.showPodcasterBodyHeader {
	padding-top: 50px;
	/* 	border-bottom: 1px solid black;  */
}
    </style>

    <script type="text/javascript">
        function confirmDelete(n) {
            if (confirm("確定刪除此項商品 ? ")) {
                document.forms[0].action = "<c:url value='UpdateItem.do?cmd=DEL&activityId=" + n + "' />";
                document.forms[0].method = "POST";
                document.forms[0].submit();
            } else {

            }
        }

        function modify(key, qty, index) {
            var x = "newQty" + index;
            var newQty = document.getElementById(x).value;
            if (newQty < 0) {
                window.alert('數量不能小於 0');
                return;
            }
            if (newQty == 0) {
                window.alert("請執行刪除功能來刪除此項商品");
                document.getElementById(x).value = qty;
                return;
            }
            if (newQty == qty) {
                window.alert("新、舊數量相同，不必修改");
                return;
            }
            if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty + " ? ")) {
                document.forms[0].action = "<c:url value='UpdateItem.do?cmd=MOD&activityId=" + key + "&newQty=" +
                    newQty + "' />";
                document.forms[0].method = "POST";
                document.forms[0].submit();
            } else {
                document.getElementById(x).value = qty;
            }
        }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function Checkout(qty) {
            if (qty == 0) {
                alert("無購買任何商品，不需結帳");
                return false;
            }
            if (confirm("再次確認訂單內容 ? ")) {
                return true;
            } else {
                return false;
            }
        }

        function Abort() {
            if (confirm("確定放棄購物 ? ")) {
                return true;
            } else {
                return false;
            }
        }
    </script>


</head>

<body>
<div class="head">
		<jsp:include page="../header_banner_test.jsp" flush="true " />
	</div>

<div class="showPodcasterBody">
		<div class="row showPodcasterBodyHeader">
			<div class="col-md-4">
				<div class="memberImg">
					<img alt="" src="${podcasterData.podcastImg}">
				</div>
			</div>
			<div class="col-md-8">
				<div class="memberName">${podcasterData.podcastName}</div>
				<div class="memberInfo">${podcasterData.podcastInfo}</div>
				<div></div>
			</div>
		</div>
	</div>
    <c:set var="funcName" value="CHE" scope="session" />


    <c:choose>
        <c:when test="${ShoppingCart.subtotal > 0}">
            <c:set var="subtotalMessage" value="金額小計:${ShoppingCart.subtotal} 元" />
            <c:set var="subtotal" value="${ShoppingCart.subtotal}" />
        </c:when>
        <c:otherwise>
            <c:set var="subtotalMessage" value="金額小計:  0 元" />
            <c:set var="subtotal" value="0" />
        </c:otherwise>
    </c:choose>



    <div class="container">
        <div class="custyle">
            <table class="table table-striped custab">

                <h1 style="text-align:center;">${LoginOK.name}的購物清單</h1>

                <div class="row">
                    <thead>
                        <th class="col-md-2">
                            活動名稱
                        </th>
                        <th class="col-md-2">
                            活動地點
                        </th>
                        <th class="col-md-2">
                            活動日期
                        </th>
                        <th class="col-md-2">
                            單價
                        </th>
                        <th class="col-md-1">
                            數量
                        </th>
                        <th class="col-md-1">
                            小計
                        </th>
                        <th class="col-md-1">
                            修改
                        </th>
                        <th class="col-md-1">
                            刪除
                        </th>
                    <tbody>
                        <c:forEach varStatus="vs" var="anEntry" items="${ShoppingCart.content}">
                            <tr>
                                <td class="col-md-2">
                                    ${anEntry.value.activityName}
                                </td>
                                <td class="col-md-2">
                                    ${anEntry.value.activityLocation}
                                </td>
                                <td class="col-md-2">
                                    ${anEntry.value.activityDate}
                                </td>
                                <td class="col-md-2">
                                    <fmt:formatNumber value="${anEntry.value.unitPrice}" pattern="#,###" />元</td>
                                </td>
                                <td class="col-md-1">
                                   <Input id="newQty${vs.index}" style="width:28px;text-align:right" name="newQty" type="text" value="<fmt:formatNumber value="${anEntry.value.quantity}" />" name="qty" onkeypress="return isNumberKey(event)"  />
                                </td>
                                <td class="col-md-1">
                                    <fmt:formatNumber value="${anEntry.value.unitPrice * anEntry.value.quantity}"
                                        pattern="#,###,###" />元</td>
                                </td>
                                <td class="col-md-2">
                                    <Input type="button" class="btn btn-success" name="update" value="修改"
                                        onclick="modify(${anEntry.key}, ${anEntry.value.quantity}, ${vs.index})">
  </td>
                                <td class="col-md-2">
                                    <Input type="button" class="btn btn-danger" name="delete" value="刪除"
                                        onclick="confirmDelete(${anEntry.key})">
       </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan='5' align='right'>合計金額：</td>
                            <td align='right'>
                                <fmt:formatNumber value="${subtotal}" pattern="#,###,###" />元</td>
                            <td align='right'>&nbsp;</td>
                            <td></td>

                        </tr>
                        <tr>
                            <td></td>
                            <td colspan='2'> <a href="<c:url value='/#events' />">繼續購物</a></td>
                            <td colspan='2'><a href="<c:url value='checkout' />"
                                    onClick="return Checkout(${subtotal});">再次確認</a></td>
     <td colspan='2'> <a href="<c:url value='abort' />" onClick="return Abort();">放棄購物</a></td>
                            <td></td>

                        </tr>
                    </tbody>
                </div>

            </table>
            <form>
                <input type="hidden" name="a" />
            </form>
</body>

</html>