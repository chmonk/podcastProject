/**
 * 
 */
 
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
			console.log(selectMemberByIdText);
			if(!selectMemberByIdText){
				document.getElementById("selectMemberByIdErr").innerHTML="請輸入MemberId";
				return false;
			}	
			document.getElementById("selectMemberByIdForm").submit();
			return true;
		}
		
		var selectMemberAccount=document.getElementById("selectMemberAccountBtn");
		selectMemberAccount.onclick=function(){
			var selectMemberAccountText=document.getElementById("selectMemberAccountText").value;
			
			if(!selectMemberAccountText){
				document.getElementById("selectMemberAccountErr").innerHTML="請輸入MemberAccount";
				return false;
			}	
			document.getElementById("selectMemberByAccountForm").submit();
			return true;
		}
		
		var deleteMemberBtn=document.getElementById("deleteMemberBtn");
		deleteMemberBtn.onclick=function(){
			var deleteMemberText=document.getElementById("deleteMemberText").value;
			
			if(!deleteMemberText){
				document.getElementById("deleteMemberErr").innerHTML="請輸入MemberId";
				return false;
			}	
			document.getElementById("deleteMemberForm").submit();
			return true;
		}
		
		//TicketOrder Function=================================
		
		var selectOrderIdBtn=document.getElementById("selectOrderIdBtn");
		selectOrderIdBtn.onclick=function(){
			var selectOrderIdText=document.getElementById("selectOrderIdText").value;
			
			if(!selectOrderIdText){
				document.getElementById("selectOrderIdErr").innerHTML="請輸入TicketOrderId";
				return false;
			}	
			document.getElementById("selectOrderIdForm").submit();
			return true;
		}
		
		var selectOrderMemberBtn=document.getElementById("selectOrderMemberBtn");
		selectOrderMemberBtn.onclick=function(){
			var selectOrderMemberText=document.getElementById("selectOrderMemberText").value;
			
			if(!selectOrderMemberText){
				document.getElementById("selectOrderMemberErr").innerHTML="請輸入MemberId";
				return false;
			}	
			document.getElementById("selectOrderMemberForm").submit();
			return true;
		}
		
		var selectOrderActBtn=document.getElementById("selectOrderActBtn");
		selectOrderActBtn.onclick=function(){
			var selectOrderActText=document.getElementById("selectOrderActText").value;
			
			if(!selectOrderActText){
				document.getElementById("selectOrderActErr").innerHTML="請輸入ActivityId";
				return false;
			}	
			document.getElementById("selectOrderActForm").submit();
			return true;
		}
		
		//ProgramCommentFunction========================================
		
		var selectCommentIdBtn=document.getElementById("selectCommentIdBtn");
		selectCommentIdBtn.onclick=function(){
			var selectCommentIdText=document.getElementById("selectCommentIdText").value;
			
			if(!selectCommentIdText){
				document.getElementById("selectCommentIdErr").innerHTML="請輸入MemberId";
				return false;
			}	
			document.getElementById("selectCommentIdForm").submit();
			return true;
		}
		
		var selectCommentMemberBtn=document.getElementById("selectCommentMemberBtn");
		selectCommentMemberBtn.onclick=function(){
			var selectCommentMemberMText=document.getElementById("selectCommentMemberMText").value;
			var selectCommentMemberPText=document.getElementById("selectCommentMemberPText").value;
			
			if(!selectCommentMemberMText){
				document.getElementById("selectCommentMemerErr").innerHTML="請輸入MemberId & PodcasterId";
				return false;
			}else if(!selectCommentMemberPText){
				document.getElementById("selectCommentMemerErr").innerHTML="請輸入MemberId & PodcasterId";
				return false;
			}
			document.getElementById("selectCommentMemberForm").submit();
			return true;
		}
		
		var selectCommentPodcasterBtn=document.getElementById("selectCommentPodcasterBtn");
		selectCommentPodcasterBtn.onclick=function(){
			var selectCommentPodcasterText=document.getElementById("selectCommentPodcasterText").value;
			
			if(!selectCommentPodcasterText){
				document.getElementById("selectCommentPodcasterErr").innerHTML="請輸入PodcasterId";
				return false;
			}	
			document.getElementById("selectCommentPodcasterForm").submit();
			return true;
		}
		
		var deleteCommentIdBtn=document.getElementById("deleteCommentIdBtn");
		deleteCommentIdBtn.onclick=function(){
			var deleteCommentIdText=document.getElementById("deleteCommentIdText").value;
			
			if(!deleteCommentIdText){
				document.getElementById("deleteCommentIdErr").innerHTML="請輸入CommentId";
				return false;
			}	
			document.getElementById("deleteCommentIdForm").submit();
			return true;
		}
		
		var deleteCommentMemberBtn=document.getElementById("deleteCommentMemberBtn");
		deleteCommentMemberBtn.onclick=function(){
			var deleteCommentMemberMText=document.getElementById("deleteCommentMemberMText").value;
			var deleteCommentMemberPText=document.getElementById("deleteCommentMemberPText").value;
			
			if(!deleteCommentMemberMText){
				document.getElementById("deleteCommentMemberErr").innerHTML="請輸入MemberId & PodcasterId";
				return false;
			}else if(!deleteCommentMemberPText){
				document.getElementById("deleteCommentMemberErr").innerHTML="請輸入MemberId & PodcasterId";
				return false;
			}
			document.getElementById("deleteCommentMemberForm").submit();
			return true;
		}
		
		//Category Function===========================================
		
		var setNewCategoryBtn=document.getElementById("setNewCategoryBtn");
		setNewCategoryBtn.onclick=function(){
			var setNewCategoryText=document.getElementById("setNewCategoryText").value;
			
			if(!setNewCategoryText){
				document.getElementById("setNewCategoryErr").innerHTML="請輸入CategoryName";
				return false;
			}	
			document.getElementById("setNewCategoryForm").submit();
			return true;
		}
		
		var upgradeCategoryBtn=document.getElementById("upgradeCategoryBtn");
		upgradeCategoryBtn.onclick=function(){
			var upgradeCategoryIdText=document.getElementById("upgradeCategoryIdText").value;
			var upgradeCategoryNameText=document.getElementById("upgradeCategoryNameText").value;
			
			if(!upgradeCategoryIdText){
				document.getElementById("upgradeCategoryErr").innerHTML="請輸入CategoryId & CategoryNewName";
				return false;
			}else if(!upgradeCategoryNameText){
				document.getElementById("upgradeCategoryErr").innerHTML="請輸入CategoryId & CategoryNewName";
				return false;
			}
			document.getElementById("upgradeCategoryForm").submit();
			return true;
		}
		
		
		//Subscription Function=======================================
		
		var selectSubMemberBtn=document.getElementById("selectSubMemberBtn");
		selectSubMemberBtn.onclick=function(){
			var selectSubMemberText=document.getElementById("selectSubMemberText").value;
			
			if(!selectSubMemberText){
				document.getElementById("selectSubMemberErr").innerHTML="請輸入MemberId";
				return false;
			}	
			document.getElementById("selectSubMemberForm").submit();
			return true;
		}
		
		var selectSubPodcasterBtn=document.getElementById("selectSubPodcasterBtn");
		selectSubPodcasterBtn.onclick=function(){
			var selectSubPodcasterText=document.getElementById("selectSubPodcasterText").value;
			
			if(!selectSubPodcasterText){
				document.getElementById("selectSubPodcasterErr").innerHTML="請輸入PodcasterId";
				return false;
			}	
			document.getElementById("selectSubPodcasterForm").submit();
			return true;
		}
		
		//Activity Function=============================================
		
		var selectActIdBtn=document.getElementById("selectActIdBtn");
		selectActIdBtn.onclick=function(){
			var selectActIdText=document.getElementById("selectActIdText").value;
			
			if(!selectActIdText){
				document.getElementById("selectActIdErr").innerHTML="請輸入ActivityId";
				return false;
			}	
			document.getElementById("selectActIdForm").submit();
			return true;
		}
		
		var selectActPodcasterBtn=document.getElementById("selectActPodcasterBtn");
		selectActPodcasterBtn.onclick=function(){
			var selectActPodcasterText=document.getElementById("selectActPodcasterText").value;
			
			if(!selectActPodcasterText){
				document.getElementById("selectActPodcasterErr").innerHTML="請輸入PodcasterId";
				return false;
			}	
			document.getElementById("selectActPodcasterForm").submit();
			return true;
		}
		
		var selectActDateBtn=document.getElementById("selectActDateBtn");
		selectActDateBtn.onclick=function(){
			var selectActDateText=document.getElementById("selectActDateText").value;
			
			if(!selectActDateText){
				document.getElementById("selectActDateErr").innerHTML="請輸入ActivityDate";
				return false;
			}	
			document.getElementById("selectActDateForm").submit();
			return true;
		}
		
		var deleteActIdBtn=document.getElementById("deleteActIdBtn");
		deleteActIdBtn.onclick=function(){
			var deleteActIdText=document.getElementById("deleteActIdText").value;
			
			if(!deleteActIdText){
				document.getElementById("deleteActIdErr").innerHTML="請輸入ActivityId";
				return false;
			}	
			document.getElementById("deleteActIdForm").submit();
			return true;
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
			document.getElementById("deleteHistoryDateForm").submit();
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
		