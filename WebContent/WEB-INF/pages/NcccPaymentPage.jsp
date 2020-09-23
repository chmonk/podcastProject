<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<%
// String amount = request.getParameter("300");

String amount = ("300");

int amount_final = 0;
if(amount.indexOf(".")> -1){
	amount = amount.substring(0, amount.indexOf("."));
	amount_final = Integer.parseInt(amount);
}
amount_final = Integer.parseInt(amount);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NCCC</title>

<SCRIPT language=JavaScript src="js/sha256.js"></SCRIPT>
<script language="javascript">

function setConf(){

	var SignatureData="";
	var SignatureTemp="";


	SignatureData = "MerchantID="+document.getElementById("MerchantID").value+
					"&TerminalID="+document.getElementById("TerminalID").value+
					"&OrderID="+document.getElementById("OrderID").value+
					"&TransAmt="+document.getElementById("TransAmt").value
	                +"&TransMode="+document.getElementById("TransMode").value+
	                "&Install="+document.getElementById("Install").value+
	                "&NotifyURL="+document.getElementById("NotifyURL").value
	                +"&CSS_URL="+document.getElementById("CSS_URL").value+
	                "&BankNo="+document.getElementById("BankNo").value+
	                "&TEMPLATE="+document.getElementById("BankNo").value
	                +"&BankNo="+document.getElementById("BankNo").value+
	                "&TravelStartDate="+document.getElementById("TravelStartDate").value+
	                "&TravelEndDate="+document.getElementById("TravelEndDate").value+
	                "&"+SHA256("8888888");

	SignatureTemp = SHA256(SignatureData);

	document.getElementById("Signature").value= SignatureData;

	alert(document.getElementById("Signature").value);

	return true;
}
</script>
</head>
<body onload="document.HPP.submit();">
<form name="HPP" method="post" target="HPPFrame" ACTION="https://nccnet-ectest.nccc.com.tw/merchant/HPPRequest">
<input type="hidden" name="MerchantID" id="MerchantID" value="6600800020">
<input type="hidden" name="TerminalID" id="TerminalID" value="70502744">
<input type="hidden" name="Install"    id="Install" value="0">
<input type="hidden" name="OrderID"    id="OrderID" value="<%=System.currentTimeMillis() %>">
<input type="hidden" name="TransMode"  id="TransMode" value="0">
<input type="hidden" name="CSS_URL"    id="CSS_URL" value="">
<input type="hidden" name="BankNo"     id="BankNo" value="">
<input type="hidden" name="TEMPLATE"   id="TEMPLATE" value="BOTH">
<input type="hidden" name="TravelStartDate"   id="TravelStartDate" value="">
<input type="hidden" name="TravelEndDate"     id="TravelEndDate" value="">
<input type="hidden" name="TransAmt"   id="TransAmt" value="<%=amount_final %>">
<input type="hidden" name="NotifyURL"  id="NotifyURL" value="http://localhost:8080/SpringWebProject/NcccResponsePage.jsp">
<input type="hidden" name="Signature"  id="Signature" value="">
<iframe name="HPPFrame" id="mainFrame" height="600" width="800" Frameborder="0"/>

</body>
</html>