<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Custom CSS -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-color.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />">
<style type="text/css">
  
  <script type="text/javascript">
function confirmDelete(n) {
	if (confirm("確定刪除此項活動 ? ") ) {
		document.forms[0].action="<c:url value='DeleteActivity?cmd=DEL&activityId=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	
	}
}
</script>
  
  
    <title>管理活動</title>

    <style>
        * {
            margin: 0 auto;
            font-size: medium;
        }

        body {
         background-color:#f7f7f7!important;
/*             background-image: url(<c:url value='/img/banner/b5.jpg' />); */
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
table{
table-layout: fixed;}

        th,
        tr {
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

.closeTr{
background-color:#f3e1e1!important;
}

    h2 {
    	margin: 10%;
    	text-align:center;
	margin-bottom:10px;
        display: inline;
    }
.headtop{
	margin-top:150px;
	margin-bottom:0px!important;
}
.mb10{
	margin-bottom:10px;
}
    </style>

</head>

<body>
	<div class="head">
		<jsp:include page="../header_banner_test.jsp" flush="true " />
	</div>

	<div class="default-heading headtop">
		<h2 >活動管理</h2>
	</div>
<!-- 		<button id="pressHistoryAdd" class="btn btn-primary">一鍵加入</button> -->
    <div class="container">
        <div class="custyle">
            <table class="table table-striped custab">
                <thead>
					<tr>
                        <td colspan="6">${LoginOK.name}的活動列表</td>
                    </tr>
                    <a href="<c:url value='/addActivityForm' />" class="btn btn-primary btn-md pull-right mb10" >+新增活動</a>
                    <tr>
                    <th>照片</th>
                        <td><b>名稱</b></td>
                        <td><b>日期</b></td>
                        <td><b>參加人數</b></td>
                        <td><b>狀態</b></td>
                        <td><b>操作</b></td>
                    </tr>
                </thead>
                <c:forEach var="alist" varStatus="loop" items="${ActivityList}">
                <c:choose>
   <c:when test="${alist.activityStatus == 1 }">
      <!-- 購物車內有一項以上的商品 -->
      <c:set var="activityStatus" value="關閉"/>
   </c:when>
   <c:otherwise>
      <!-- 購物車內沒有商品 -->
      <c:set var="activityStatus" value="開啟"/>        
   </c:otherwise>   
</c:choose>

<c:set var="rowColor" value="none" />
<c:if test="${alist.activityStatus == 1 }">
<c:set var="rowColor" value="closeTr" />
</c:if>
                <tr class="${rowColor}"><td><img width="50%" src="<c:url value='${alist.activityImg}' />"></td>
     
                    <td><a  href='<c:url value='ActivityDetail?memberId=${LoginOK.memberId}&activityId=${alist.activityId}' />'>
						<u>${alist.activityName}</u>
			    </a></td>
                    <td  width="110px">${alist.activityDate}</td>
                    <td width="90px">${alist.activityMaxPeople - alist.stock}人</td>
                    <td>${activityStatus}</td>
                    <td class="text-center">
                        <a href="#" class="btn btn-danger btn-md" onclick="confirmDelete(${alist.activityId})">刪除</a>
                    </td>
                </tr>

</c:forEach>
                <tr height='36' id='borderA'>
                    <td id='borderA' align="center" colspan="6">
                   <a class="btn btn-primary" href="<c:url value='/' />">回首頁</a>
                    </td>
                </tr>


            </table>
            <form>
		<input type="hidden" name="a" />
	</form>
        </div>
    </div>

</body>

</html>