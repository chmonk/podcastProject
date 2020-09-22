package podcast.model.javabean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

@Table(name = "uploadPodcast")
@Entity
@Component
public class uploadPodcastBean {
	private Integer podcastId;
	private String title;
	private Integer categoryId;
	private Integer memberId;
	private String podcastInfo;
	private Integer openPayment;
	private Integer openComment;
	private Date uploadTime;
	private Integer clickAmount;
	private String audioPath;
	private String audioimg;
	private Integer likesCount;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PODCASTID")
	public Integer getPodcastId() {
		return podcastId;
	}

	public void setPodcastId(Integer podcastId) {
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
	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "MEMBERID")
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
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
	public Integer getOpenPayment() {
		return openPayment;
	}

	public void setOpenPayment(Integer openPayment) {
		this.openPayment = openPayment;
	}

	@Column(name = "OPENCOMMENT")
	public Integer getOpenComment() {
		return openComment;
	}

	public void setOpenComment(Integer openComment) {
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
	public Integer getClickAmount() {
		return clickAmount;
	}

	public void setClickAmount(Integer clickAmount) {
		this.clickAmount = clickAmount;
	}

	@Column(name = "AUDIOPATH")
	public String getAudioPath() {
		return audioPath;
	}

	public void setAudioPath(String audioPath) {
		this.audioPath = audioPath;
	}

	@Column(name = "AUDIOIMG")
	public String getAudioimg() {
		return audioimg;
	}

	public void setAudioimg(String audioimg) {
		this.audioimg = audioimg;
	}

	@Column(name = "LIKESCOUNT")
	public Integer getLikesCount() {
		return likesCount;
	}

	public void setLikesCount(Integer likesCount) {
		this.likesCount = likesCount;
	}
	
	
}
