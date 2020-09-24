<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂閱頻道紀錄</title>
<style type="text/css">

div{
margin:25px auto;
width:250px


}

h1{

width:300px;
margin:25px auto;
}
body{
background:


}
table {
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
      color:#4F4F4F;
      background: #f4f4f4;
      }
   
  
  th, td {
    color: #999;
    border: 1px solid 	#ADADAD;
    padding: 12px 35px;
    border-collapse: collapse;
  }
  th {
 	 font-family:微軟正黑體;
    background:	#7B7B7B;
    color: 		#FFFFFF;
    text-transform: uppercase;
    font-size: 20px;
    &.last {
      border-right: none;
    }
  }
}</style>

<script type="text/javascript">

</script>

</head>
<body>

<h1>${LoginOK.name}的頻道訂閱紀錄</h1>
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
<a href="<c:url value="/"/>">回首頁</a></div>
</body>
</html>