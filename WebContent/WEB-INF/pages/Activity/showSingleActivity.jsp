<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>個人訂單明細</title>
<body>
<h1>修改活動</h1>

<form>
<div class="floating-placeholder">
  <input id="name" name="name" type="text"/>
  <label for="name">${aBean.activityName}</label>
</div>
<div class="floating-placeholder">
  <input id="address" name="address" type="text" />
  <label for="address">${aBean.activityLocation}</label>
</div>
<div class="floating-placeholder">
  <input id="city" name="city" type="text"/>
  <label for="city">${aBean.activityPrice}</label>
</div>
<div class="floating-placeholder">
  <input id="address" name="address" type="text" />
  <label for="address">${aBean.activityStatus}</label>
</div>
  
</form>


	<div style="text-align: center">
		<a href="<c:url value='orderList' />">回上一頁</a>&nbsp;&nbsp;
		<a href="<c:url value='removeShoppingCart' />">回首頁</a>
	</div>
</body>




<style type="text/css">
@import "compass/css3";

$padding-horizontal:20px;
$highlight-color:#16abf0;
body{
  background:#34495e;
  color:white;
  text-align:center;
  font-family:Helvetica, Arial, sans-serif;
  font-size:10pt;
}
h1{
  font-size:3em;
}
a{
  color:inherit;
}
form{
  width:500px;
  margin:0 auto;
  background:white;
  border-radius:10px;
  margin-bottom:20px;
  //padding:20px;
}
input, .floating-placeholder{
  font-family:Helvetica, Arial, sans-serif;
  font-size:20pt;
  line-height:2.6em;
  height:2.6em;
  margin:0;
  padding:0;
  width:100%;
}
.floating-placeholder input:focus+label{
  color:$highlight-color;
}
.floating-placeholder input[value]+label{
  color:red;
}
.floating-placeholder{
  position:relative;
}

.floating-placeholder input{
  font-size:20pt;
  border:none;
  outline:none;
  position:absolute;
  top:0;
  left:0;
  display:block;
  background:transparent;
  z-index:2;
  border-bottom:1px solid #ccc;
  text-indent:$padding-horizontal;
}

.floating-placeholder:last-child input{
  border-bottom:none;
}
.floating-placeholder label{
  display:block;
  position:absolute;
  top:0;
  left:$padding-horizontal;
  font-size:20pt;
  z-index:1;
  @include transform-origin(0,0.0em);
  @include transition(transform 160ms, color 200ms);
  @include transform(scale(1,1) rotateY(0));
  color:#999;
}
.floating-placeholder-float label{
  @include transform(scale(0.55,0.55) rotateY(0));
}
.floating-placeholder-float input{
  line-height:3.4em;
}

</style>


<script type="text/javascript">
//This code is a bit rudimentary.
//This is more of a proof of concept than code for production.
//The only thing it needs to do, however, is to check if the field has any value. The rest is done with CSS

$(document).ready(function(){
function updateText(event){
  var input=$(this);
  setTimeout(function(){
    var val=input.val();
    if(val!="")
      input.parent().addClass("floating-placeholder-float");
    else
      input.parent().removeClass("floating-placeholder-float");
  },1)
}
$(".floating-placeholder input").keydown(updateText);
$(".floating-placeholder input").change(updateText);
});

</script>

</html>
