<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>



    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />">
    <title>Document</title>

    <script type="text/javascript">
    function cancelOrder() {
    	if (confirm("確定取消此份訂單 ? ") ) {
    		// 接收此資料的Servlet會使用 finalDecision 參數的值
    		console.log(document.forms);
    		document.forms[1].finalDecision.value = "CANCEL";
    		document.forms[1].action="<c:url value='cancelOrder' />";
    		document.forms[1].method="GET";
    		document.forms[1].submit();
    		return;
    	} else {
    		return;
    	}
    }
    function reconfirmOrder() {
    	console.log(document.forms);
    	var sa = document.getElementById('ShippingAddress').value;
    	if  (sa === "") {
    		window.alert ('出貨地址不能是空白');
    		return ; 
    	}
    	if (confirm("確定送出此份訂單 ? ") ) {
        	console.log(document.forms);
        	
    		// 接收此資料的Servlet會使用 finalDecision 參數的值
    		document.forms[1].finalDecision.value = "ORDER";
    		document.forms[1].action="<c:url value='ProcessOrder' />";
    		document.forms[1].method="POST";
        	console.log(document.forms);
    		
    		document.forms[1].submit();
    		return;
    	} else {
    		return;
    	}
    }
    </script>

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

        th,
        tr {
            text-align: center;
            background-color: white;
        }

   table{ table-layout: fixed;}

        #table2 {
            margin-top: 0px;
            padding-top: 0px;
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
    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 取得今天的日期，今天的日期應當在最後確認時才取得 -->
    <jsp:useBean id="today" class="java.util.Date" scope="session" />
</head>

<body>

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

    <div class="container">
        <div class="custyle">
            <FORM action="<c:url value='preProcessOrder' />" method="POST">
            <table class="table table-striped custab">
            
                <tr><td colspan='6'>請確認訂購資訊：</tr>
                    <tr>
                        <td colspan='2'>會員編號：${LoginOK.memberId}</td>
                        <td colspan='2'>客戶姓名：${LoginOK.name}</td>
                        <td colspan='2'>訂單日期：
                            <fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan='6' style="text-align:left;">會員地址：${LoginOK.address}</td>
                    </tr>
                    <tr>
                        <td colspan='6' style="text-align:left;"> 出貨地址：<Input size="60" type="text" id='ShippingAddress'
                                name="ShippingAddress" value="${LoginOK.address}"></td>
                    </tr>
                    <tr>
                        <td colspan='6' style="text-align:left;">統一編號：<Input size="10" type="text" name="BNO" value="">
                        </td>
                    </tr>
                    <tr>
                        <td colspan='6' style="text-align:left;">發票抬頭：<Input size="50" type="text" name="InvoiceTitle"
                                value="${LoginOK.name}"></td>
                    </tr>
                    <TR>
                        <TD colspan='6'>
                    </tr>

                    <TR>
                        <td>票券名稱</td>
                        <td>地點</td>
                        <td>日期</td>
                        <td>單價</td>
                        <td>數量</td>
                        <td>小計</td>
                    </TR>
 <c:forEach varStatus="vs" var="entry" items="${ShoppingCart.content}">
                    <TR>
                        <td><img width="70%" src="<c:url value='${entry.value.description}' />">
                        <br>${entry.value.activityName}</td>
                        <td>${entry.value.activityLocation}</td>
                        <td>${entry.value.activityDate}</td>
                        <td>
                            <fmt:formatNumber value="${entry.value.unitPrice}" pattern="#,###" />元</td>
                        <td>${entry.value.quantity}</td>
                        <td>
                            <fmt:formatNumber value="${entry.value.unitPrice * entry.value.quantity}"
                                pattern="#,###,###" />元</td>
                    </TR>
                     </c:forEach>
                    <tr>
                        <td colspan='5' style="text-align:right">合計金額：</td>
                        <td style="text-align:center">
                            <fmt:formatNumber value="${ShoppingCart.subtotal}" pattern="#,###,###" />元</td>
                    </tr>


                    <tr>
                        <td colspan='6'>
  <input type="hidden" name="finalDecision"  value="">   
   <input type="button" class="btn btn-primary" name="OrderBtn"  value="確定送出" onclick="reconfirmOrder()">
   <input type="button" class="btn btn-danger" name="CancelBtn" value="取消訂單" onclick="cancelOrder()">
                        </td>
                    </tr>
            </table>
            </FORM>
        </div>
    </div>

</body>

</html>