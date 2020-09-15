<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
window.onload = function(){ 


	    //var name = document.getElementById("visitor").value;
	   // var addr = document.getElementById("address").value;  
	   	var xhr = new XMLHttpRequest();
	   	xhr.open("GET", "<c:url value='/jsonTest' />", true);
	   //	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	   //	xhr.send("visitor=" + name + "&addr0=" + addr);
	    xhr.send();	
	   	xhr.onreadystatechange = function() {
		// 向伺服器提出的請求已經收到回應
	        if (xhr.readyState === 4) {
	        // status: HTTP通訊協定的狀態碼伺服器，
	        // 200表示Server成功的處理請求
	            if (xhr.status === 200) {
	          	// getResponseHeader: 取得回應內容的MIME Type
	                var type = xhr.getResponseHeader("Content-Type");   
	                // 判斷回應類型，這裡使用 JSON  找不到匯市-1
	                 if (type.indexOf("application/json") === 0) {               
	                      var obj = JSON.parse(xhr.responseText);
	                        if (obj.number) {
	                        		result.innerHTML =
	                            	"<font color='red'>" + obj.name  + '</font> 您好，' + 
	                            	'您的明牌為：' + obj.number + "<br>" + 
	                                '您的地址為：' + obj.addrAjax1 + "<br>" ;
	                                alert(xhr.status);
	                                alert(xhr.responseText);
	                        } else {
	                        	result.innerHTML = "資料錯誤";
	                        }
	                    }
	                } else {
	                    alert("發生錯誤1: " + xhr.status + ", " + xhr.responseText);
	                }
	            }
	   	} 
	   

}

</script>



</body>
</html>