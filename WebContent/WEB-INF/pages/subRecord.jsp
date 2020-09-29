<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <!-- Custom CSS -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-color.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />">
<style type="text/css">
	
<meta charset="UTF-8">
<title>訂閱頻道紀錄</title>
<style type="text/css">
* {
            margin: 0 auto;
            font-size: medium;
        }

        body {
        background-color:#f9f9f9;
/*             background-image: url(<c:url value='/img/banner/b3.jpg' />); */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
  
  		.custyle{
/*   		padding:100px;} */
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
            h2 {
/*     	margin: 10%; */
    	text-align:center;
	margin-bottom:10px;
        display: inline;
    }
    
    .default-heading{
    margin-top: 150px!important;
    margin-bottom:0px!important;
    }

</style>

</head>
<body>
<div class="head">
		<jsp:include page="header_banner_test.jsp" flush="true " />
	</div>
	
		<div class="default-heading">
		<h2 >購買紀錄</h2></div>
	
    <div class="container">
        <div class="custyle">
            <table class="table table-striped custab">
                <thead>
                    <tr>
                        <td colspan="4">${LoginOK.name}的訂閱頻道</td>
                    </tr>
                    <tr>
                        <th>頻道名稱</th>
                        <th>訂閱開始時間</th>
                        <th>訂閱結束時間</th>
                        <th>費用</th>
                    </tr>
                </thead>
                <c:forEach items="${subRecordList}" var="subRecord">
                    <tr>
                        <td>${subRecord.getReceipt()}</td>
                        <td>${subRecord.getSubdateStart()}</td>
                        <td>${subRecord.getSubdateEnd()}</td>
                        <td>${subRecord.getMonthlyPayment()}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td align="center" colspan="4">
                        <a class="btn btn-primary"
                            onclick="location.href='<c:url value="/" />'">回首頁</a>
                        <a class="btn btn-warning"
                            onclick="location.href='<c:url value="/orderList" />'">票券訂購紀錄</a>
                    </td>
                </tr>

            </table>
           </div>
      </div>

</body>
</html>