package podcast.model.javabean;

import java.util.Date;

public class HistoryOrderProgramBean {
	
	Integer podcastId;
	String podcastName;
	Integer publisherId;
	String lastListen;
	Integer memberId;
	String nickname;
	String uploadTime;
	Integer likesCount;
	Integer clickAmount;
	String audioImg;
	String audioPath;
	String podcastInfo;
	String categoryName;
	Integer likestatus;
	Integer showInListOrNot;
	Integer openPayment;
	String subdateEnd;
	Integer watchProgramValidation;
	

	public HistoryOrderProgramBean() {
	}


	public HistoryOrderProgramBean(Integer podcastId, String podcastName, Integer publisherId, String lastListen,
			Integer memberId, String nickname, String uploadTime, Integer likesCount, Integer clickAmount,
			String audioImg, String audioPath, String podcastInfo, String categoryName, Integer likestatus,
			Integer showInListOrNot, Integer openPayment, String subdateEnd, Integer watchProgramValidation) {
		super();
		this.podcastId = podcastId;
		this.podcastName = podcastName;
		this.publisherId = publisherId;
		this.lastListen = lastListen;
		this.memberId = memberId;
		this.nickname = nickname;
		this.uploadTime = uploadTime;
		this.likesCount = likesCount;
		this.clickAmount = clickAmount;
		this.audioImg = audioImg;
		this.audioPath = audioPath;
		this.podcastInfo = podcastInfo;
		this.categoryName = categoryName;
		this.likestatus = likestatus;
		this.showInListOrNot = showInListOrNot;
		this.openPayment = openPayment;
		this.subdateEnd = subdateEnd;
		this.watchProgramValidation = watchProgramValidation;
	}



	public Integer getPodcastId() {
		return podcastId;
	}

	public void setPodcastId(Integer podcastId) {
		this.podcastId = podcastId;
	}

	public String getPodcastName() {
		return podcastName;
	}

	public void setPodcastName(String podcastName) {
		this.podcastName = podcastName;
	}

	public Integer getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(Integer publisherId) {
		this.publisherId = publisherId;
	}

	public String getLastListen() {
		return lastListen;
	}

	public void setLastListen(String lastListen) {
		this.lastListen = lastListen;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Integer getLikesCount() {
		return likesCount;
	}

	public void setLikesCount(Integer likesCount) {
		this.likesCount = likesCount;
	}

	public Integer getClickAmount() {
		return clickAmount;
	}

	public void setClickAmount(Integer clickAmount) {
		this.clickAmount = clickAmount;
	}



	public String getAudioImg() {
		return audioImg;
	}



	public void setAudioImg(String audioImg) {
		this.audioImg = audioImg;
	}



	public String getAudioPath() {
		return audioPath;
	}



	public void setAudioPath(String audioPath) {
		this.audioPath = audioPath;
	}

	public String getPodcastInfo() {
		return podcastInfo;
	}

	public void setPodcastInfo(String podcastInfo) {
		this.podcastInfo = podcastInfo;
	}



	public String getCategoryName() {
		return categoryName;
	}



	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Integer getLikestatus() {
		return likestatus;
	}

	public void setLikestatus(Integer likestatus) {
		this.likestatus = likestatus;
	}

	public Integer getShowInListOrNot() {
		return showInListOrNot;
	}

	public void setShowInListOrNot(Integer showInListOrNot) {
		this.showInListOrNot = showInListOrNot;
	}


	public Integer getOpenPayment() {
		return openPayment;
	}


	public void setOpenPayment(Integer openPayment) {
		this.openPayment = openPayment;
	}


	public String getSubdateEnd() {
		return subdateEnd;
	}


	public void setSubdateEnd(String subdateEnd) {
		this.subdateEnd = subdateEnd;
	}


	public Integer getWatchProgramValidation() {
		return watchProgramValidation;
	}


	public void setWatchProgramValidation(Integer watchProgramValidation) {
		this.watchProgramValidation = watchProgramValidation;
	}





	


	
	
	
	
	
	

}
