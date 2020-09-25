<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />">
    <title>個人訂單資訊</title>
    
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
    <div class="container">
        <div class="custyle">
            <h1 style="text-align:center;">${LoginOK.name}的訂單明細</h1>
            <table class="table table-striped custab">
                <tr>
                    <td colspan='2'><b>出貨地址：</b>${OrderBean.shippingAddress}</td>
                    <td colspan='2'><b>訂購日期：</b>${fn:substring(OrderBean.orderDate, 0, 10)}</td>
                    <td colspan='2'><b>訂單編號：</b>${OrderBean.ticketOrderId}</td>
                </tr>
                <tr>
                    <td><b>票券編號</b></td>
                    <td><b>票券名稱</b></td>
                    <td><b>單價</b></td>
                    <td><b>數量</b></td>
                    <td><b>折扣</b></td>
                    <td><b>金額</b></td>
                </tr>
                <c:set var="subtotal" value="0" />
                <c:forEach var="aBean" varStatus="stat" items="${OrderBean.items}">
                    <tr>
                        <td>${aBean.activityId}</td>
                        <td>${aBean.activityName}</td>
                        <td>${aBean.unitPrice}</td>
                        <td>${aBean.quantity}</td>
                        <td>0</td>
                        <td>
                            <fmt:formatNumber value="${aBean.unitPrice*aBean.quantity}" pattern="#,###,###" />元</td>
                        </td>
                        <c:set var="subtotal"
                            value="${ subtotal + aBean.unitPrice * aBean.discount * aBean.quantity }" />
                    </tr>
                </c:forEach>
                <tr>
                    <td rowspan="3" colspan="4"></td>
                    <td colspan="2"><b>合 計</b></td>
                </tr>
                <tr>
                    <TD align="center"><b>折扣</b></TD>
                    <c:set var="VAT" value="${subtotal*0.05 + 0.0001}" />
                    <TD align="right">
                        <fmt:formatNumber value="${VAT}" pattern="#,###,###" />元</TD>
                </tr>
                <tr height='30'>
                    <TD align="center"><b>總金額</b></TD>
                    <TD align="right">
                        <fmt:formatNumber value="${OrderBean.totalAmount}" pattern="#,###,###" />元</TD>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <a class="btn btn-warning" href="<c:url value='orderList' />">回上一頁</a>&nbsp;&nbsp;
                        <a class="btn btn-primary" href="<c:url value='removeShoppingCart' />">回首頁</a></td>

                </tr>
            </table>

</body>

</html>