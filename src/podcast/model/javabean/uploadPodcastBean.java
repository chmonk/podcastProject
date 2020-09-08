package podcast.model.javabean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenericGenerator;

@Table(name = "uploadPodcast")
@Entity
public class uploadPodcastBean {
	private int podcastId;
	private String title;
	private int categoryId;
	private int memberId;
	private String podcastInfo;
	private int openPayment;
	private int openComment;
	private Date uploadTime;
	private int clickAmount;
	private String audioPath;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PODCASTID")
	public int getPodcastId() {
		return podcastId;
	}

	public void setPodcastId(int podcastId) {
		this.podcastId = podcastId;
	}

	@Column(name = "TITLE")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "CATEGORYID")
	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "MEMBERID")
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	@Column(name = "PODCASTINFO")
	public String getPodcastInfo() {
		return podcastInfo;
	}

	public void setPodcastInfo(String podcastInfo) {
		this.podcastInfo = podcastInfo;
	}

	@Column(name = "OPENPAYMENT")
	public int getOpenPayment() {
		return openPayment;
	}

	public void setOpenPayment(int openPayment) {
		this.openPayment = openPayment;
	}

	@Column(name = "OPENCOMMENT")
	public int getOpenComment() {
		return openComment;
	}

	public void setOpenComment(int openComment) {
		this.openComment = openComment;
	}

	@Column(name = "UPLOADTIME")
	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	@Column(name = "CLICKAMOUNT")
	public int getClickAmount() {
		return clickAmount;
	}

	public void setClickAmount(int clickAmount) {
		this.clickAmount = clickAmount;
	}

	@Column(name = "AUDIOPATH")
	public String getAudioPath() {
		return audioPath;
	}

	public void setAudioPath(String audioPath) {
		this.audioPath = audioPath;
	}
}
