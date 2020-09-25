
 
 
 //model=====================================
 	$('input').on('focusin', function() {
			$(this).parent().find('label').addClass('active');
		});

		$('input').on('focusout', function() {
			if (!this.value) {
				$(this).parent().find('label').removeClass('active');
			}
		});
		
		
		$("input.dinput").on('focusin',function() {
			$(this).parent().find('label').addClass('doubleact');
		});

		$('input.dinput').on('focusout', function() {
			if (!this.value) {
				$(this).parent().find('label').removeClass('doubleact');
			}
		});
 
 //======================================
 
 function fff() {
			let oValue = document.getElementById('options');
			console.log(oValue.value);
			document.getElementById("result").innerHTML = oValue.value;
		}

		function showhide() {
			var x = document.getElementById('options');
			var xv = x.value;
			let displayobj = document.getElementById(xv);
			let areas = document.getElementsByClassName('areas');
			var i;
			for (i = 0; i < areas.length; i++) {
				areas[i].style.display = "none";
			}

			displayobj.style.display = "block";

		}

		//column check code==================================================================
		function columnTestify(){
		
		//Member Function=====================================
		
		var selectMemberId=document.getElementById("memberIdBtn");
		selectMemberId.onclick=function(){
			var selectMemberByIdText=document.getElementById("selectMemberIdText").value;
			
			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectMemberAccountText").value="";
			document.getElementById("deleteMemberText").value="";
			//清空其他ERR訊息
			document.getElementById("selectMemberByIdErr").innerHTML="";
			document.getElementById("selectMemberAccountErr").innerHTML="";
			document.getElementById("deleteMemberErr").innerHTML="";

			if(!selectMemberByIdText){
				document.getElementById("selectMemberByIdErr").innerHTML="請輸入MemberId";
				return false;
				}
			
			document.getElementById("selectMemberByIdErr").innerHTML="";
			let input=document.getElementById("selectMemberIdText").value;
			processMember("BackStageSelectMember",input);
			return true;
		}
		
		var selectMemberAccount=document.getElementById("selectMemberAccountBtn");
		selectMemberAccount.onclick=function(){
			var selectMemberAccountText=document.getElementById("selectMemberAccountText").value;
			
			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectMemberIdText").value="";
			document.getElementById("deleteMemberText").value="";
			//清空其他ERR訊息
			document.getElementById("selectMemberByIdErr").innerHTML="";
			document.getElementById("selectMemberAccountErr").innerHTML="";
			document.getElementById("deleteMemberErr").innerHTML="";

			if(!selectMemberAccountText){
				document.getElementById("selectMemberAccountErr").innerHTML="請輸入MemberAccount";
				return false;
			}
			
			document.getElementById("selectMemberAccountErr").innerHTML="";	
			let input=document.getElementById("selectMemberAccountText").value;
			processMember("BackStageSelectMemberByAccount",input);
			return true;
		}
		
		var deleteMemberBtn=document.getElementById("deleteMemberBtn");
		deleteMemberBtn.onclick=function(){
			var deleteMemberText=document.getElementById("deleteMemberText").value;
			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectMemberIdText").value="";
			document.getElementById("selectMemberAccountText").value="";
			//清空其他ERR訊息
			document.getElementById("selectMemberByIdErr").innerHTML="";
			document.getElementById("selectMemberAccountErr").innerHTML="";
			document.getElementById("deleteMemberErr").innerHTML="";

			if(!deleteMemberText){
				document.getElementById("deleteMemberErr").innerHTML="請輸入MemberId";
				return false;
			}	
			
			var r=confirm("確定要刪除此Member?")
			if(r==true){

				document.getElementById("deleteMemberErr").innerHTML="";
				let input=document.getElementById("deleteMemberText").value;
				processMember("BackStageDeleteMember",input);
				return true;
			}else{
		
			}
			
			
			
		}
		
		//TicketOrder Function=================================
		
		var selectOrderIdBtn=document.getElementById("selectOrderIdBtn");
		selectOrderIdBtn.onclick=function(){
			
				//按下按鈕就先清空結果&其他欄位的值
				document.getElementById("ajaxTable").innerHTML="";
				document.getElementById("selectOrderMemberText").value="";
				document.getElementById("selectOrderActText").value="";
				//清空其他ERR訊息
				document.getElementById("selectOrderIdErr").innerHTML="";
				document.getElementById("selectOrderMemberErr").innerHTML="";
				document.getElementById("selectOrderActErr").innerHTML="";
			let input=document.getElementById("selectOrderIdText").value;
			if(!input){
				document.getElementById("selectOrderIdErr").innerHTML="請輸入TicketOrderId";
				return false;
			}
				
			processTicketOrder("BackStageSelectOrderById",input);
			return true;
		}
		
		var selectOrderMemberBtn=document.getElementById("selectOrderMemberBtn");
		selectOrderMemberBtn.onclick=function(){

			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectOrderIdText").value="";
			document.getElementById("selectOrderActText").value="";
			//清空其他ERR訊息
			document.getElementById("selectOrderIdErr").innerHTML="";
			document.getElementById("selectOrderMemberErr").innerHTML="";
			document.getElementById("selectOrderActErr").innerHTML="";

			let input=document.getElementById("selectOrderMemberText").value;
			if(!input){
				document.getElementById("selectOrderMemberErr").innerHTML="請輸入MemberId";
				return false;
			}	
			processTicketOrder("BackStageSelectOrderByMember",input);
			return true;
		}
		
		var selectOrderActBtn=document.getElementById("selectOrderActBtn");
		selectOrderActBtn.onclick=function(){

			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectOrderIdText").value="";
			document.getElementById("selectOrderMemberText").value="";
			//清空其他ERR訊息
			document.getElementById("selectOrderIdErr").innerHTML="";
			document.getElementById("selectOrderMemberErr").innerHTML="";
			document.getElementById("selectOrderActErr").innerHTML="";

			
			let input=document.getElementById("selectOrderActText").value;
			if(!input){
				document.getElementById("selectOrderActErr").innerHTML="請輸入ActivityId";
				return false;
			}	
			processTicketOrder("BackStageSelectOrderByActivity",input);
			return true;
		}
		
		//ProgramCommentFunction========================================
		
		var selectCommentIdBtn=document.getElementById("selectCommentIdBtn");
		selectCommentIdBtn.onclick=function(){

			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectCommentMemberMText").value="";
			document.getElementById("selectCommentMemberPText").value="";
			document.getElementById("selectCommentPodcasterText").value="";
			document.getElementById("deleteCommentIdText").value="";
			document.getElementById("deleteCommentMemberMText").value="";
			document.getElementById("deleteCommentMemberPText").value="";
			//清空其他ERR訊息
			document.getElementById("selectCommentIdErr").innerHTML="";
			document.getElementById("selectCommentMemberErr").innerHTML="";
			document.getElementById("selectCommentPodcasterErr").innerHTML="";
			document.getElementById("deleteCommentIdErr").innerHTML="";
			document.getElementById("deleteCommentMemberErr").innerHTML="";

			let inputm=document.getElementById("selectCommentIdText").value;
			let inputp=33;
			if(!inputm){
				document.getElementById("selectCommentIdErr").innerHTML="請輸入MemberId";
				return false;
			}	
			processComment("BackStageSelectCommentById",inputm,inputp);
			return true;
		}
		
		var selectCommentMemberBtn=document.getElementById("selectCommentMemberBtn");
		selectCommentMemberBtn.onclick=function(){
			
			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectCommentIdText").value="";
			document.getElementById("selectCommentPodcasterText").value="";
			document.getElementById("deleteCommentIdText").value="";
			document.getElementById("deleteCommentMemberMText").value="";
			document.getElementById("deleteCommentMemberPText").value="";
			//清空其他ERR訊息
			document.getElementById("selectCommentIdErr").innerHTML="";
			document.getElementById("selectCommentMemberErr").innerHTML="";
			document.getElementById("selectCommentPodcasterErr").innerHTML="";
			document.getElementById("deleteCommentIdErr").innerHTML="";
			document.getElementById("deleteCommentMemberErr").innerHTML="";
			
			let inputm=document.getElementById("selectCommentMemberMText").value;
			let inputp=document.getElementById("selectCommentMemberPText").value;
			if(!inputm){
				document.getElementById("selectCommentMemberErr").innerHTML="請輸入MemberId & PodcasterId";
				return false;
			}else if(!inputp){
				document.getElementById("selectCommentMemberErr").innerHTML="請輸入MemberId & PodcasterId";
				return false;
			}
			processComment("BackStageSelectCommentByMember",inputm,inputp);
			return true;
		}
		
		var selectCommentPodcasterBtn=document.getElementById("selectCommentPodcasterBtn");
		selectCommentPodcasterBtn.onclick=function(){
			
				//按下按鈕就先清空結果&其他欄位的值
				document.getElementById("ajaxTable").innerHTML="";
				document.getElementById("selectCommentMemberMText").value="";
				document.getElementById("selectCommentMemberPText").value="";
				document.getElementById("selectCommentIdText").value="";
				document.getElementById("deleteCommentIdText").value="";
				document.getElementById("deleteCommentMemberMText").value="";
				document.getElementById("deleteCommentMemberPText").value="";
				//清空其他ERR訊息
				document.getElementById("selectCommentIdErr").innerHTML="";
				document.getElementById("selectCommentMemberErr").innerHTML="";
				document.getElementById("selectCommentPodcasterErr").innerHTML="";
				document.getElementById("deleteCommentIdErr").innerHTML="";
				document.getElementById("deleteCommentMemberErr").innerHTML="";
			
			let inputm=document.getElementById("selectCommentPodcasterText").value;
			let inputp=33;
			if(!inputm){
				document.getElementById("selectCommentPodcasterErr").innerHTML="請輸入PodcasterId";
				return false;
			}	
			processComment("BackStageSelectCommentByPodcaster",inputm,inputp);
			return true;
		}
		
		var deleteCommentIdBtn=document.getElementById("deleteCommentIdBtn");
		deleteCommentIdBtn.onclick=function(){
			
			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectCommentMemberMText").value="";
			document.getElementById("selectCommentMemberPText").value="";
			document.getElementById("selectCommentIdText").value="";
			document.getElementById("selectCommentPodcasterText").value="";
			document.getElementById("deleteCommentMemberMText").value="";
			document.getElementById("deleteCommentMemberPText").value="";
			//清空其他ERR訊息
			document.getElementById("selectCommentIdErr").innerHTML="";
			document.getElementById("selectCommentMemberErr").innerHTML="";
			document.getElementById("selectCommentPodcasterErr").innerHTML="";
			document.getElementById("deleteCommentIdErr").innerHTML="";
			document.getElementById("deleteCommentMemberErr").innerHTML="";
			
			let inputm=document.getElementById("deleteCommentIdText").value;
			let inputp=33;
			if(!inputm){
				document.getElementById("deleteCommentIdErr").innerHTML="請輸入CommentId";
				return false;
			}
			
			var r=confirm("確定要刪除此Comment?")
			if(r==true){
		
				processComment("BackStageDeleteCommentById",inputm,inputp);
				return true;
			}else{
		
			}
				
			
		}
		
		var deleteCommentMemberBtn=document.getElementById("deleteCommentMemberBtn");
		deleteCommentMemberBtn.onclick=function(){
			
			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectCommentIdText").value="";
			document.getElementById("selectCommentPodcasterText").value="";
			document.getElementById("deleteCommentIdText").value="";
			document.getElementById("selectCommentMemberMText").value="";
			document.getElementById("selectCommentMemberPText").value="";
			//清空其他ERR訊息
			document.getElementById("selectCommentIdErr").innerHTML="";
			document.getElementById("selectCommentMemberErr").innerHTML="";
			document.getElementById("selectCommentPodcasterErr").innerHTML="";
			document.getElementById("deleteCommentIdErr").innerHTML="";
			document.getElementById("deleteCommentMemberErr").innerHTML="";
			
			let inputm=document.getElementById("deleteCommentMemberMText").value;
			let inputp=document.getElementById("deleteCommentMemberPText").value;
			if(!inputm){
				document.getElementById("deleteCommentMemberErr").innerHTML="請輸入MemberId & PodcasterId";
				return false;
			}else if(!inputp){
				document.getElementById("deleteCommentMemberErr").innerHTML="請輸入MemberId & PodcasterId";
				return false;
			}
			
			var r=confirm("確定要刪除Comment?")
			if(r==true){
		
				processComment("BackStageDeleteCommentByMemberd",inputm,inputp);
				return true;
			}else{
		
			}
		}

		//Category Function===========================================
		let ajaxTable=document.getElementById("ajaxTable");

		var setNewCategoryBtn=document.getElementById("setNewCategoryBtn");
		setNewCategoryBtn.onclick=function(){

			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("upgradeCategoryIdText").value="";
			document.getElementById("upgradeCategoryNameText").value="";
			//清空所有ERR訊息
			document.getElementById("setNewCategoryErr").innerHTML="";
			document.getElementById("upgradeCategoryErr").innerHTML="";

			let inputo=document.getElementById("setNewCategoryText").value;
			let inputn=33;
			if(!inputo){
				document.getElementById("setNewCategoryErr").innerHTML="請輸入CategoryName";
				return false;
			}	
			processCategory("BackStageSetNewCategory",inputo,inputn);
			return true;
		}
		
		var upgradeCategoryBtn=document.getElementById("upgradeCategoryBtn");
		upgradeCategoryBtn.onclick=function(){

			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("setNewCategoryText").value="";
			//清空所有ERR訊息
			document.getElementById("setNewCategoryErr").innerHTML="";
			document.getElementById("upgradeCategoryErr").innerHTML="";

			let inputo=document.getElementById("upgradeCategoryIdText").value;
			let inputn=document.getElementById("upgradeCategoryNameText").value;
			
			if(!inputo){
				document.getElementById("upgradeCategoryErr").innerHTML="請輸入CategoryId & CategoryNewName";
				return false;
			}else if(!inputn){
				document.getElementById("upgradeCategoryErr").innerHTML="請輸入CategoryId & CategoryNewName";
				return false;
			}
			processCategory("BackStageUpdateCategoryById",inputo,inputn);
			return true;
		}
		
		
		//Subscription Function=======================================
		
		var selectSubMemberBtn=document.getElementById("selectSubMemberBtn");
		selectSubMemberBtn.onclick=function(){

			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectSubPodcasterText").value="";
			//清空所有ERR訊息
			document.getElementById("selectSubMemberErr").innerHTML="";
			document.getElementById("selectSubPodcasterErr").innerHTML="";

			let input=document.getElementById("selectSubMemberText").value;
			if(!input){
				document.getElementById("selectSubMemberErr").innerHTML="請輸入MemberId";
				return false;
			}	
			processSub("SelectSubscriptionByMember",input);
			return true;
		}
		
		var selectSubPodcasterBtn=document.getElementById("selectSubPodcasterBtn");
		selectSubPodcasterBtn.onclick=function(){

			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectSubMemberText").value="";
			//清空所有ERR訊息
			document.getElementById("selectSubMemberErr").innerHTML="";
			document.getElementById("selectSubPodcasterErr").innerHTML="";

			let input=document.getElementById("selectSubPodcasterText").value;
			if(!input){
				document.getElementById("selectSubPodcasterErr").innerHTML="請輸入PodcasterId";
				return false;
			}	
			processSub("SelectSubscriptionByPodcaster",input);
			return true;
		}
		
		//Activity Function=============================================
		
		var selectActIdBtn=document.getElementById("selectActIdBtn");
		selectActIdBtn.onclick=function(){

			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectActPodcasterText").value="";
			document.getElementById("selectActDateText").value="";
			document.getElementById("deleteActIdText").value="";
			//清空所有ERR訊息
			document.getElementById("selectActIdErr").value="";
			document.getElementById("selectActPodcasterErr").value="";
			document.getElementById("selectActDateErr").value="";
			document.getElementById("deleteActIdErr").value="";

			let input=document.getElementById("selectActIdText").value;
			if(!input){
				document.getElementById("selectActIdErr").innerHTML="請輸入ActivityId";
				return false;
			}	
			processActivity("SelectActivityById",input);
			return true;
		}
		
		var selectActPodcasterBtn=document.getElementById("selectActPodcasterBtn");
		selectActPodcasterBtn.onclick=function(){

			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectActIdText").value="";
			document.getElementById("selectActDateText").value="";
			document.getElementById("deleteActIdText").value="";
			//清空所有ERR訊息
			document.getElementById("selectActIdErr").value="";
			document.getElementById("selectActPodcasterErr").value="";
			document.getElementById("selectActDateErr").value="";
			document.getElementById("deleteActIdErr").value="";

			let input=document.getElementById("selectActPodcasterText").value;
			if(!input){
				document.getElementById("selectActPodcasterErr").innerHTML="請輸入PodcasterId";
				return false;
			}	
			processActivity("SelectActivityByPodcaster",input);
			return true;
		}
		
		var selectActDateBtn=document.getElementById("selectActDateBtn");
		selectActDateBtn.onclick=function(){

			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectActPodcasterText").value="";
			document.getElementById("selectActIdText").value="";
			document.getElementById("deleteActIdText").value="";
			//清空所有ERR訊息
			document.getElementById("selectActIdErr").value="";
			document.getElementById("selectActPodcasterErr").value="";
			document.getElementById("selectActDateErr").value="";
			document.getElementById("deleteActIdErr").value="";

			let input=document.getElementById("selectActDateText").value;

			if(!input){
				document.getElementById("selectActDateErr").innerHTML="請輸入ActivityDate";
				return false;
			}	
			processActivity("SelectActivityByDate",input);
			return true;
		}
		
		var deleteActIdBtn=document.getElementById("deleteActIdBtn");
		deleteActIdBtn.onclick=function(){

			//按下按鈕就先清空結果&其他欄位的值
			document.getElementById("ajaxTable").innerHTML="";
			document.getElementById("selectActPodcasterText").value="";
			document.getElementById("selectActDateText").value="";
			document.getElementById("selectActIdText").value="";
			//清空所有ERR訊息
			document.getElementById("selectActIdErr").value="";
			document.getElementById("selectActPodcasterErr").value="";
			document.getElementById("selectActDateErr").value="";
			document.getElementById("deleteActIdErr").value="";

			let input=document.getElementById("deleteActIdText").value;
			if(!input){
				document.getElementById("deleteActIdErr").innerHTML="請輸入ActivityId";
				return false;
			}
			
			var r=confirm("確定要刪除此Activity?")
			if(r==true){
				processActivity("DeleteActivityByID",input);
				return true;
			}else{
		
			}	
			
		}
		
		//BrowsingHistory Function========================================
		
		var selectHistoryIdBtn=document.getElementById("selectHistoryIdBtn");
		selectHistoryIdBtn.onclick=function(){
			var selectHistoryIdText=document.getElementById("selectHistoryIdText").value;
			
			if(!selectHistoryIdText){
				document.getElementById("selectHistoryIdErr").innerHTML="請輸入HistoryId";
				return false;
			}	
			document.getElementById("selectHistoryIdForm").submit();
			return true;
		}
		
		var selectHistoryMemberBtn=document.getElementById("selectHistoryMemberBtn");
		selectHistoryMemberBtn.onclick=function(){
			var selectHistoryMemberText=document.getElementById("selectHistoryMemberText").value;
			
			if(!selectHistoryMemberText){
				document.getElementById("selectHistoryMemberErr").innerHTML="請輸入MemberId";
				return false;
			}	
			document.getElementById("selectHistoryMemberForm").submit();
			return true;
		}
		
		var selectHistoryPodcasterBtn=document.getElementById("selectHistoryPodcasterBtn");
		selectHistoryPodcasterBtn.onclick=function(){
			var selectHistoryPodcasterText=document.getElementById("selectHistoryPodcasterText").value;
			
			if(!selectHistoryPodcasterText){
				document.getElementById("selectHistoryPodcasterErr").innerHTML="請輸入PodcasterId";
				return false;
			}	
			document.getElementById("selectHistoryPodcasterForm").submit();
			return true;
		}
		
		var selectHistoryLastBtn=document.getElementById("selectHistoryLastBtn");
		selectHistoryLastBtn.onclick=function(){
			var selectHistoryLastText=document.getElementById("selectHistoryLastText").value;
			
			if(!selectHistoryLastText){
				document.getElementById("selectHistoryLastErr").innerHTML="請輸入Date";
				return false;
			}	
			document.getElementById("selectHistoryLastForm").submit();
			return true;
		}
		
		var deleteHistoryDateBtn=document.getElementById("deleteHistoryDateBtn");
		deleteHistoryDateBtn.onclick=function(){
			var deleteHistoryDateText=document.getElementById("deleteHistoryDateText").value;
			
			if(!deleteHistoryDateText){
				document.getElementById("deleteHistoryDateErr").innerHTML="請輸入Date";
				return false;
			}	
			
			var r=confirm("確定要刪除History?")
			if(r==true){
				document.getElementById("deleteHistoryDateForm").submit();
				return true;
			}else{
		
			}	
			
		}
		
		
		//Podcast Function==========================================================================
		
		var selectPodcastMemberBtn=document.getElementById("selectPodcastMemberBtn");
		selectPodcastMemberBtn.onclick=function(){
			var selectPodcastMemberText=document.getElementById("selectPodcastMemberText").value;
			
			if(!selectPodcastMemberText){
				document.getElementById("selectPodcastMemberErr").innerHTML="請輸入MemberId";
				return false;
			}	
			document.getElementById("selectPodcastMemberForm").submit();
			return true;
		}
		
		var deletePodcastIdBtn=document.getElementById("deletePodcastIdBtn");
		deletePodcastIdBtn.onclick=function(){
			var deletePodcastIdText=document.getElementById("deletePodcastIdText").value;
			
			if(!deletePodcastIdText){
				document.getElementById("deletePodcastIdErr").innerHTML="請輸入PodcastId";
				return false;
			}
			
			var r=confirm("確定要刪除Podcast?")
			if(r==true){
				document.getElementById("deletePodcastIdForm").submit();
				return true;
			}else{
		
			}		
			
		}
		
		var topPodcastBtn=document.getElementById("topPodcastBtn");
		topPodcastBtn.onclick=function(){
			var topPodcastText=document.getElementById("topPodcastText").value;
			
			if(!topPodcastText){
				document.getElementById("topPodcastErr").innerHTML="請輸入uploadTime";
				return false;
			}	
			document.getElementById("topPodcastForm").submit();
			return true;
		}
		
		
		
		//Income Calculate Function========================================
		
		var subIncomeBtn=document.getElementById("subIncomeBtn");
		subIncomeBtn.onclick=function(){
			var subIncomeSDText=document.getElementById("subIncomeSDText").value;
			var subIncomeEDText=document.getElementById("subIncomeEDText").value;
			
			if(!subIncomeSDText){
				document.getElementById("subIncomeErr").innerHTML="請輸入StartDate & EndDate";
				return false;
			}else if(!subIncomeEDText){
				document.getElementById("subIncomeErr").innerHTML="請輸入StartDate & EndDate";
				return false;
			}
			document.getElementById("subIncomeForm").submit();
			return true;
		}
		
		var ticketIncomeBtn=document.getElementById("ticketIncomeBtn");
		ticketIncomeBtn.onclick=function(){
			var ticketIncomeSDText=document.getElementById("ticketIncomeSDText").value;
			var ticketIncomeEDText=document.getElementById("ticketIncomeEDText").value;
			
			if(!ticketIncomeSDText){
				document.getElementById("ticketIncomeErr").innerHTML="請輸入StartDate & EndDate";
				return false;
			}else if(!ticketIncomeEDText){
				document.getElementById("ticketIncomeErr").innerHTML="請輸入StartDate & EndDate";
				return false;
			}
			document.getElementById("ticketIncomeForm").submit();
			return true;
		}
		
}
		
//All Member=============================================================================
	
	document.getElementById("showAllMemberBtn").onclick=function showAllMembers(){
		let ajaxtable=document.getElementById("ajaxTable");
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "showAllMember", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("readyState & status GOOD!");
				let type = xhr.getResponseHeader("Content-Type");
				let allMembers = JSON.parse(xhr.responseText);

				let content=
				"<table class='ta' >"
				+"<tr>"
				+"<th>MemberId</th>"
				+"<th>Account</th>"
				+"<th>Name</th>"	
				+"<th>NickName</th>"
				+"<th>Email</th>"	
				+"<th>CellPhone</th>"	
				+"<th>Sex</th>"	
				+"<th>Role</th>"	
				+"</tr>";
				
				for(var i=0;i<allMembers.length;i++){
				content+=
				"<tr>"
				+"<td>"+allMembers[i].memberId+"</td>"
				+"<td>"+allMembers[i].account+"</td>"
				+"<td>"+allMembers[i].name+"</td>"
				+"<td>"+allMembers[i].nickname+"</td>"
				+"<td>"+allMembers[i].email+"</td>"
				+"<td>"+allMembers[i].cellphone+"</td>"
				+"<td>"+allMembers[i].sex+"</td>"
				+"<td>"+allMembers[i].role+"</td>"
				+"</tr>";	
			}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
				
				content+="</table>";
				ajaxtable.innerHTML=content;
		}
	}
}

//All Ticket Order
	document.getElementById("showAllOrderBtn").onclick=function showAllOrder(){
		let ajaxtable=document.getElementById("ajaxTable");
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "showAllTicketOrder", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("readyState & status GOOD!");
				let type2 = xhr.getResponseHeader("Content-Type");
				let allOrder = JSON.parse(xhr.responseText);

				let content=
				"<table class='ta' >"
				+"<tr>"
				+"<th>TicketOrderId</th>"
				+"<th>OrderDate</th>"
				+"<th>MemberId</th>"	
				+"<th>ActivityId</th>"
				+"<th>ShippingAddress</th>"	
				+"<th>BNO</th>"	
				+"<th>InVoiceTitle</th>"	
				+"<th>TotalAmount</th>"	
				+"</tr>";
				
				for(var i=0;i<allOrder.length;i++){
				content+=
				"<tr>"
				+"<td>"+allOrder[i].ticketOrderId+"</td>"
				+"<td>"+allOrder[i].orderDate+"</td>"
				+"<td>"+allOrder[i].memberId+"</td>"
				+"<td>"+allOrder[i].activityId+"</td>"
				+"<td>"+allOrder[i].shippingAddress+"</td>"
				+"<td>"+allOrder[i].bno+"</td>"
				+"<td>"+allOrder[i].invoiceTitle+"</td>"
				+"<td>"+allOrder[i].totalAmount+"</td>"
				+"</tr>";	
			}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
				
				content+="</table>";
				ajaxtable.innerHTML=content;
		}
	}
}

//All ProgramComment
document.getElementById("showAllCommentBtn").onclick=function showAllComment(){
	let ajaxtable=document.getElementById("ajaxTable");
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "showAllComment", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			console.log("readyState & status GOOD!");
			let type2 = xhr.getResponseHeader("Content-Type");
			let allComment = JSON.parse(xhr.responseText);

			let content=
			"<table class='ta' >"
			+"<tr>"
			+"<th>CommentId</th>"
			+"<th>CommentMsg</th>"
			+"<th>MemberId</th>"	
			+"<th>PodcasterId</th>"
			+"<th>MsgStatus</th>"	
			+"<th>MsgDate</th>"		
			+"</tr>";
			
			for(var i=0;i<allComment.length;i++){
			content+=
			"<tr>"
			+"<td>"+allComment[i].commentId+"</td>"
			+"<td>"+allComment[i].commentMsg+"</td>"
			+"<td>"+allComment[i].memberId+"</td>"
			+"<td>"+allComment[i].podcasterId+"</td>"
			+"<td>"+allComment[i].msgStatus+"</td>"
			+"<td>"+allComment[i].msgDate+"</td>"
			+"</tr>";
		}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
			
			content+="</table>";
			ajaxtable.innerHTML=content;
	}
}
}


//All Category
document.getElementById("showAllCategoryBtn").onclick=function showAllCategory(){
	let ajaxtable=document.getElementById("ajaxTable");
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "showAllCategory", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			console.log("readyState & status GOOD!");
			let type2 = xhr.getResponseHeader("Content-Type");
			let allCategory = JSON.parse(xhr.responseText);

			let content=
			"<table class='ta' >"
			+"<tr>"
			+"<th>CategoryId</th>"
			+"<th>CategoryName</th>"	
			+"</tr>";
			
			for(var i=0;i<allCategory.length;i++){
			content+=
			"<tr>"
			+"<td>"+allCategory[i].categoryId+"</td>"
			+"<td>"+allCategory[i].categoryName+"</td>"	
			+"</tr>";
		}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
			
			content+="</table>";
			ajaxtable.innerHTML=content;
	}
}
}


//All Subscription
document.getElementById("showAllSubBtn").onclick=function showAllSub(){
	let ajaxtable=document.getElementById("ajaxTable");
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "showAllSub", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			console.log("readyState & status GOOD!");
			let type2 = xhr.getResponseHeader("Content-Type");
			let allSub = JSON.parse(xhr.responseText);

			let content=
			"<table class='ta' >"
			+"<tr>"
			+"<th>SubOrderId</th>"
			+"<th>SubDateStart</th>"
			+"<th>SubDateEnd</th>"
			+"<th>MonthlyPayment</th>"
			+"<th>MemberId</th>"
			+"<th>PodcasterId</th>"
			+"<th>CardNumber</th>"
			+"<th>Reciept</th>"	
			+"</tr>";
			
			for(var i=0;i<allSub.length;i++){
			content+=
			"<tr>"
			+"<td>"+allSub[i].subOrderId+"</td>"
			+"<td>"+allSub[i].subdateStart+"</td>"
			+"<td>"+allSub[i].subdateEnd+"</td>"
			+"<td>"+allSub[i].monthlyPayment+"</td>"
			+"<td>"+allSub[i].memberId+"</td>"
			+"<td>"+allSub[i].podcasterId+"</td>"
			+"<td>"+allSub[i].creditCardNumber+"</td>"
			+"<td>"+allSub[i].receipt+"</td>"	
			+"</tr>";
		}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
			
			content+="</table>";
			ajaxtable.innerHTML=content;
	}
}
}


//All Activity
document.getElementById("showAllActivityBtn").onclick=function showAllActivity(){
	let ajaxtable=document.getElementById("ajaxTable");
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "showAllActivity", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			console.log("readyState & status GOOD!");
			let type2 = xhr.getResponseHeader("Content-Type");
			let allActivity = JSON.parse(xhr.responseText);

			let content=
			"<table class='ta' >"
			+"<tr>"
			+"<th>ActivityId</th>"
			+"<th>ActivityName</th>"
			+"<th>ActivityDate</th>"
			+"<th>ActivityTime</th>"
			+"<th>ActivityLocation</th>"
			+"<th>PodcasterId</th>"
			+"<th>ActivityPrice</th>"
			+"</tr>";
			
			for(var i=0;i<allActivity.length;i++){
			content+=
			"<tr>"
			+"<td>"+allActivity[i].activityId+"</td>"
			+"<td>"+allActivity[i].activityName+"</td>"
			+"<td>"+allActivity[i].activityDate+"</td>"
			+"<td>"+allActivity[i].activityTime+"</td>"
			+"<td>"+allActivity[i].activityLocation+"</td>"
			+"<td>"+allActivity[i].podcasterId+"</td>"
			+"<td>"+allActivity[i].activityPrice+"</td>"
			+"</tr>";	
		}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
			
			content+="</table>";
			ajaxtable.innerHTML=content;
	}
}
}


//All Subscription
document.getElementById("showAllSubBtn").onclick=function showAllSub(){
	let ajaxtable=document.getElementById("ajaxTable");
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "showAllSub", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			console.log("readyState & status GOOD!");
			let type2 = xhr.getResponseHeader("Content-Type");
			let allSub = JSON.parse(xhr.responseText);

			let content=
			"<table class='ta' >"
			+"<tr>"
			+"<th>SubOrderId</th>"
			+"<th>SubDateStart</th>"
			+"<th>SubDateEnd</th>"
			+"<th>MonthlyPayment</th>"
			+"<th>MemberId</th>"
			+"<th>PodcasterId</th>"
			+"<th>CardNumber</th>"
			+"<th>Reciept</th>"	
			+"</tr>";
			
			for(var i=0;i<allSub.length;i++){
			content+=
			"<tr>"
			+"<td>"+allSub[i].subOrderId+"</td>"
			+"<td>"+allSub[i].subdateStart+"</td>"
			+"<td>"+allSub[i].subdateEnd+"</td>"
			+"<td>"+allSub[i].monthlyPayment+"</td>"
			+"<td>"+allSub[i].memberId+"</td>"
			+"<td>"+allSub[i].podcasterId+"</td>"
			+"<td>"+allSub[i].creditCardNumber+"</td>"
			+"<td>"+allSub[i].receipt+"</td>"	
			+"</tr>";
		}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
			
			content+="</table>";
			ajaxtable.innerHTML=content;
	}
}
}


//All History
document.getElementById("showAllHistoryBtn").onclick=function showAllHistory(){
	let ajaxtable=document.getElementById("ajaxTable");
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "showAllHistory", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			console.log("readyState & status GOOD!");
			let type2 = xhr.getResponseHeader("Content-Type");
			let allHistory = JSON.parse(xhr.responseText);

			let content=
			"<table class='ta' >"
			+"<tr>"
			+"<th>HistoryId</th>"
			+"<th>PodcastId</th>"
			+"<th>PodcastName</th>"
			+"<th>PublisherId</th>"
			+"<th>MemberId</th>"
			+"<th>LastListen</th>"
			+"</tr>";
			
			for(var i=0;i<allHistory.length;i++){
			content+=
			"<tr>"
			+"<td>"+allHistory[i].historyId+"</td>"
			+"<td>"+allHistory[i].podcastId+"</td>"
			+"<td>"+allHistory[i].podcastName+"</td>"
			+"<td>"+allHistory[i].publisherId+"</td>"
			+"<td>"+allHistory[i].memberId+"</td>"
			+"<td>"+allHistory[i].lastListen+"</td>"
			+"</tr>";	
		}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
			
			content+="</table>";
			ajaxtable.innerHTML=content;
	}
}
}


//All Podcast
document.getElementById("showAllPodcastBtn").onclick=function showAllPodcast(){
	let ajaxtable=document.getElementById("ajaxTable");
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "showAllPodcast", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			console.log("readyState & status GOOD!");
			let type2 = xhr.getResponseHeader("Content-Type");
			let allPodcast = JSON.parse(xhr.responseText);

			let content=
			"<table class='ta' >"
			+"<tr>"
			+"<th>PodcastId</th>"
			+"<th>Title</th>"
			+"<th>CategoryId</th>"
			+"<th>MemberId</th>"
			+"<th>OpenPayment</th>"
			+"<th>UploadTime</th>"
			+"<th>ClickAmount</th>"
			+"<th>LikesCount</th>"
			+"</tr>";
			
			for(var i=0;i<allPodcast.length;i++){
			content+=
			"<tr>"
			+"<td>"+allPodcast[i].podcastId+"</td>"
			+"<td>"+allPodcast[i].title+"</td>"
			+"<td>"+allPodcast[i].categoryId+"</td>"
			+"<td>"+allPodcast[i].memberId+"</td>"
			+"<td>"+allPodcast[i].openPayment+"</td>"
			+"<td>"+allPodcast[i].uploadTime+"</td>"
			+"<td>"+allPodcast[i].clickAmount+"</td>"
			+"<td>"+allPodcast[i].likesCount+"</td>"
			+"</tr>";	
		}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
			
			content+="</table>";
			ajaxtable.innerHTML=content;
	}
}
}






		