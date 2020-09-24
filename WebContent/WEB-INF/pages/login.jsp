
<!DOCTYPE HTML>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
<link rel="stylesheet" href="css/loginStyle.css">
<title>登入</title>

<script type="text/javascript">
//由<body>的onLoad事件處理函數觸發此函數
function setFocusToUserId(){   
	 document.forms[0].userId.focus();   // 將游標放在userId欄位內
}


</script>
</head>
<body onLoad="setFocusToUserId()" style="background:;">
<!-- 下列敘述設定變數funcName的值為LOG，top.jsp 會用到此變數 -->
<c:set var="funcName" value="LOG" scope="session"/>
<c:set var="msg" value="登入" />
<c:if test="${ ! empty sessionScope.timeOut }" > <!-- 表示使用逾時，重新登入 -->
   <c:set var="msg" value="<font color='red'>${sessionScope.timeOut}</font>" />
</c:if>
<!-- 引入共同的頁首 -->
<%-- <jsp:include page="/fragment/topMVC.jsp" /> --%>

  <form action="<c:url value='login' />" method="POST" name="loginForm" class="login-form">
    <h1>登入</h1>
    <div class="textb">
      <input type="text" name="userId" required value="${requestScope.user}${param.userId}">
      <div class="placeholder">Username</div>
    </div>

    <div class="textb">
      <input type="password" required name="password" value="${requestScope.password}${param.password}">
      <div class="placeholder">Password</div>
      <div class="show-password fas fa-eye-slash"></div>
    </div>

    <div class="checkbox">
      <input type="checkbox" name="rememberMe" 
               <c:if test='${requestScope.rememberMe==true}'>
                  
                  checked='checked'
               </c:if> 
             value="true">
      <div class="fas fa-check"></div>
     保持登入狀態
    </div>

    <button type="submit" class="btn fas fa-arrow-right" disabled></button>
    <a href="#">無法登入?</a>
    <a href="<c:url value='/register' />">註冊新的帳號</a>
  </form>
<script type="text/javascript">
var fields = document.querySelectorAll(".textb input");
var btn = document.querySelector(".btn");
function check(){
  if(fields[0].value != "" && fields[1].value != "")
    btn.disabled = false;
  else
    btn.disabled = true;  
}

fields[0].addEventListener("keyup",check);
fields[1].addEventListener("keyup",check);

document.querySelector(".show-password").addEventListener("click",function(){
  if(this.classList[2] == "fa-eye-slash"){
    this.classList.remove("fa-eye-slash");
    this.classList.add("fa-eye");
    fields[1].type = "text";
  }else{
    this.classList.remove("fa-eye");
    this.classList.add("fa-eye-slash");
    fields[1].type = "password";
  }
});
</script>


<%-- <Form action="<c:url value='login.do' />" method="POST" name="loginForm">
  <div id='content'>
    <Table  style="border-width:2; background:; width: 500px;
                        border-style:inset; border-color:;">
         <TR>
             <TH width="180">&nbsp;</TH>
             <TH width="180">&nbsp;</TH>
         </TR>
         <TR>
             <TD colspan='2' align="CENTER" style="font-size:0.6cm;font-weight: 300;"> 
                <Font color="#006600" face="">
                </Font>
             </TD>
         </TR>
         <TR>
             <TD height='50' colspan='2' align="CENTER" style="font-size:0.5cm;font-weight: 300;"> 
                <Font color=""  face="">
                    ${msg}
                </Font>
             </TD>
         </TR>
         <TR height='10'>
             <TD align="CENTER" colspan='2'>&nbsp;</TD>
         </TR>
         <TR>
             <TD width="180" align="right">帳號：　</TD>
             <TD width="180" colspan='2' align="LEFT">
             <input  type="text" name="userId" size="10" 
             value="${requestScope.user}${param.userId}">
             
             &nbsp;<small><Font color='red' size="-3">${errorMsg}
             ${ErrorMsgKey.AccountEmptyError}
             </Font></small></TD>
         </TR>
         <TR>
             <TD width="180" align="right">密碼：　</TD>
             <TD width="180" colspan='2' align="LEFT" >
             <input  type="password" name="password"  size="10" 
             value="${requestScope.password}${param.password}">
              
             &nbsp;<small><Font color='red'  size="-3">${ErrorMsgKey.PasswordEmptyError}
             </Font></small></TD>
             
         </TR>  
         <tr>
         <TD width="180" align="right" >
             <input type="checkbox" name="rememberMe" 
               <c:if test='${requestScope.rememberMe==true}'>
                  
                  checked='checked'
               </c:if> 
             value="true">
         </TD>
         <TD width="180"  colspan='2' align="left"><small>記住密碼</small></TD>
         </tr>
         <TR height='10'>
             <TD align="CENTER" colspan='2'>&nbsp;<Font color='red' size="-1">
             ${ErrorMsgKey.LoginError}&nbsp;</Font></TD>
         </TR>
        <TR>
            <TD colspan="2" align="center"><input type="submit" value="提交"> </TD>
         </TR>
         <TR height='10'>
             <TD align="CENTER" colspan='2'>&nbsp;</TD>
         </TR>
    </Table>
  </div>
</Form> --%>
</body>
</html>