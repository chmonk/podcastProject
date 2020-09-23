<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>頻道頁面</title>
</head>

<body>
$().ready(function() {
				//获取留言信息
				getComment();
			});


<script>

function  getComment(){
		$.ajax({
			url : "../../CommentServlet?method=getComment&page_now=1&com_type=3",
				dataType : "JSON",
				success : function(data) {
				//	var json = jQuery.parseJSON(data); 
				//$("#myText").text(json);
				$.each(data,function(i,va){//这是可以的
					//alert(va["count_all"]);i为data的索引，va为该索引的对象。
					//对象变量名[“属性名”] 得到该对象下该属性名的属性值
					var list = va["list"];
					
					//写一个存放所有评论的com_id的数组，用于后面和con_pid进行比较，如果相同，则说明，该评论有回复，就加上回复的内容
					$.each(list,function(p,va){//	1.这里是先把没有回复内容的留言拿到
						var com_id = va.com_pid;
						if(com_id == ""){//没有回复
							appendToDiv(va);//直接生成评论
						}
					});
					$.each(list,function(p,va){
							var com_id = va.com_pid;
							if(com_id != ""){//2.在根据有pid（就是回复留言的留言），然后根据pid来把这个内容追加到对应的留言内容里
							var html = jsonToHtml(va);
							$("#"+com_id).children(".panel-body").append(html);
							}
					});	
				});	
			},
			error : function() {
				alert("ajax错误");
			}
	});
	}

function jsonToHtml(va){
	var html = "";
	html = '<div class="panel panel-danger" id = "'+va.com_id+'">'+
			//评论title和时间
			'<div class="panel-heading">' +
			'<h3 class="panel-title">' +
			'<div id="show_name">' + 
			'<span class="glyphicon glyphicon-user" aria-hidden="true"></span>' +
			'昵称：' + va.com_name +
			'<div style="float: right;" id ="show_time">Tiime:'+va.com_date+'</div>' +
			'</div>' +
			'</h3>' +
			'</div>' +
			//评论内容
			'<div class="panel-body" id="show_content"><div id="show_other"></div>　　　'+va.com_content+'</div>' +
			//评论未
			'<div class="panel-footer" align="left">' +
			'<div align="right">' +
			'<span class="glyphicon glyphicon-send" aria-hidden="true"></span>' +
			'<small><button type="button" class="btn btn-sm" id="replay'+va.com_id+'" οnclick="replay('+va.com_id+');">回复</button></small>' +
			'</div>'+
			'</div>'
			'</div>';
	return html;
}
</script>
</body>
</html>