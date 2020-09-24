<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>訂閱頻道紀錄</title>
<style type="text/css">

div{
margin:25px auto;
width:200px
}

h1{
color:#FFFFFF;
width:1000px;
margin:25px auto;
text-align: center;
}
body{
 background-image:url(<c:url value='/img/banner/b4.jpg' />)}
table {
	
  text-align:center;
  width:1000px;
  height:200px;
  font-family: 'Arial';
  margin: 25px auto;
  border-collapse: collapse;
  border: 1px solid 	#ADADAD;
  border-bottom: 2px solid #9D9D9D;
  box-shadow: 0px 0px 20px rgba(0,0,0,0.20),
     0px 10px 20px rgba(0,0,0,0.05),
     0px 20px 20px rgba(0,0,0,0.05),
     0px 30px 20px rgba(0,0,0,0.05);
     }
  tr:hover {
  	
      color:#000000;
      background: #FF9797;
      }
   th{
   text-align: center;
   }
  
  th, td {
  font-size:20px;
/*   text-align:center; */
  height:100px;
    color: #FFFFFF;
    border: 1px solid 	#ADADAD;
    padding: auto;
    border-collapse: collapse;
  }
  th {
  	
 	 font-family:微軟正黑體;
    background:	#7B7B7B;
    color: 		#FFFFFF;
    text-transform: uppercase;
    font-size: 24px;
    &.last {
      border-right: none;
    }
  }
}</style>

</head>
<body>

<h1 >${LoginOK.name}的頻道訂閱紀錄</h1>
	<table border="1">
<thead>
<tr>
<th>頻道名稱</th>
<th>訂閱開始時間</th>
<th>訂閱結束時間</th>
<th>費用</th>
</tr>
</thead>
<c:forEach items="${subRecordList}" var="subRecord">
<tr><td>${subRecord.getReceipt()}</td>
<td>${subRecord.getSubdateStart()}</td>
<td>${subRecord.getSubdateEnd()}</td>
<td>${subRecord.getMonthlyPayment()}</td></tr>
</c:forEach>

</table>
<div>
<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/" />'">回首頁</button>
<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/orderList" />'">票券訂購紀錄</button>
</div>

</body>
</html>