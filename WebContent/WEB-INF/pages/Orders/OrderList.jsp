_<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />">
    <title>票券訂購紀錄</title>

    <style>
        * {
            margin: 0 auto;
            font-size: medium;
        }

        body {
            background-image:url(<c:url value='/img/banner/b4.jpg' />);
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

        h1 {
            color: white;
        }
    </style>

</head>


<body>
    <c:set var="funcName" value="ORD" scope="session" />
    <div class="container">
        <div class="custyle">
            <h1 style="text-align:center;">${LoginOK.name}的訂購紀錄：</h1>
            <table class="table table-striped custab">
                <div class="row">
                    <tr>
                        <th>訂單編號</th>
                        <th>訂購日期</th>
                        <th>總金額</th>
                        <th>送貨地址</th>
                    </tr>
                    <c:forEach var="anOrderBean" varStatus="stat" items="${memberOrders}">
                        <tr>
                            <td><a href='<c:url value='
                                    orderDetail?memberId=${LoginOK.memberId}&ticketOrderId=${anOrderBean.ticketOrderId}' />'>
                                ${anOrderBean.ticketOrderId}
                                </a></td>
                            <td>${fn:substring(anOrderBean.orderDate, 0, 10)}</td>
                            <td>${anOrderBean.totalAmount}</td>
                            <td>${anOrderBean.shippingAddress}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td align="center" colspan="4">
                            <a href="https://p.ecpay.com.tw/4AA72DD"><img
                                    src="https://payment.ecpay.com.tw/Content/themes/WebStyle20170517/images/ecgo.png"
                                    alt="" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td id='borderA' align="center" colspan="4"><a class="btn btn-primary"
                                href="<c:url value='removeShoppingCart' />">回首頁</a></td>
                    </tr>
                </div>
        </div>
        </table>
    </div>
    </div>



</body>

</html>