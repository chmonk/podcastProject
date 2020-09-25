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
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />">
  
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
            width: 300px;
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
        <h1 style="text-align:center;">${LoginOK.name}的活動列表</h1><br>
        <div class="row col-md-6 col-md-offset-3 custyle">
            <table class="table table-striped custab">
                <thead>

                    <a href="<c:url value='/addActivityForm' />" class="btn btn-primary btn-md pull-right">+新增活動</a>
                    <br>
                    <tr>
                        <th class="name">名稱</th>
                        <th>日期</th>
                        <th>庫存</th>
                        <th class="text-center">操作</th>
                    </tr>
                </thead>
                <c:forEach var="alist" varStatus="loop" items="${ActivityList}">
                <tr>
                    <td><a  href='<c:url value='ActivityDetail?memberId=${LoginOK.memberId}&activityId=${alist.activityId}' />'>
						${alist.activityName}
			    </a></td>
                    <td>${alist.activityDate}</td>
                    <td>${alist.stock}張</td>
                    <td class="text-center">
                        <a href="#" class="btn btn-danger btn-md" onclick="confirmDelete(${alist.activityId})">刪除</a>
                    </td>
                </tr>

</c:forEach>
                <tr height='36' id='borderA'>
                    <td id='borderA' align="center" colspan="4">
                        <button type="button" class="btn btn-dark"><a href="<c:url value='/' />">回首頁</button>
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