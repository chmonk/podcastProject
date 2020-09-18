package podcast.model.javabean;

import java.util.Date;

public class fuzzyPodcastReturnArchitecture {
	private Integer podcastId;
	private String title;
	private String categoryName;
	private String podcasterName;
	private String podcastInfo;
	private Integer openPayment;
	private Date uploadTime;
	private Integer clickAmount;
	private String audioPath;
	private String audioImg;
	private Integer likesCount;
	
	
	public fuzzyPodcastReturnArchitecture() {
		
	}
	
	public fuzzyPodcastReturnArchitecture(Integer podcastId, String title, String categoryName, String podcasterName, String podcastInfo,
			Integer openPayment, Date uploadTime, Integer clickAmount, String audioPath,String audioImg,Integer likesCount) {
		this.podcastId = podcastId;
		this.title = title;
		this.categoryName = categoryName;
		this.podcasterName = podcasterName;
		this.podcastInfo = podcastInfo;
		this.openPayment = openPayment;
		this.uploadTime = uploadTime;
		this.clickAmount = clickAmount;
		this.audioPath = audioPath;
		this.audioImg = audioImg;
		this.setLikesCount(likesCount);
	}
	
	
	public Integer getPodcastId() {
		return podcastId;
	}
	public void setPodcastId(Integer podcastId) {
		this.podcastId = podcastId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getPodcasterName() {
		return podcasterName;
	}
	public void setPodcasterName(String podcasterName) {
		this.podcasterName = podcasterName;
	}
	public String getPodcastInfo() {
		return podcastInfo;
	}
	public void setPodcastInfo(String podcastInfo) {
		this.podcastInfo = podcastInfo;
	}

	public Integer getOpenPayment() {
		return openPayment;
	}

	public void setOpenPayment(Integer openPayment) {
		this.openPayment = openPayment;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Integer getClickAmount() {
		return clickAmount;
	}

	public void setClickAmount(Integer clickAmount) {
		this.clickAmount = clickAmount;
	}

	public String getAudioPath() {
		return audioPath;
	}

	public void setAudioPath(String audioPath) {
		this.audioPath = audioPath;
	}

	public String getAudioImg() {
		return audioImg;
	}

	public void setAudioImg(String audioImg) {
		this.audioImg = audioImg;
	}

	public Integer getLikesCount() {
		return likesCount;
	}

	public void setLikesCount(Integer likesCount) {
		this.likesCount = likesCount;
	}


}
