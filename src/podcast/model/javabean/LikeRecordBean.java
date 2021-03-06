package podcast.model.javabean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="likeRecord")
@Component
public class LikeRecordBean {
	private Integer likeRecordId;
	private Integer memberId;
	private Integer podcastId;
	private Integer likeStatus;
	private Integer showInListOrNot;
	
	public LikeRecordBean() {
		
	}

	public LikeRecordBean(Integer likeRecordId, Integer memberId, Integer podcastId, Integer likeStatus,
			Integer showInListOrNot) {
		super();
		this.likeRecordId = likeRecordId;
		this.memberId = memberId;
		this.podcastId = podcastId;
		this.likeStatus = likeStatus;
		this.showInListOrNot = showInListOrNot;
	}



	@Id
	@Column(name="LIKERECORDID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getLikeRecordId() {
		return likeRecordId;
	}
	public void setLikeRecordId(Integer likeRecordId) {
		this.likeRecordId = likeRecordId;
	}
	
	@Column(name = "MEMBERID")
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	
	@Column(name = "PODCASTID")
	public Integer getPodcastId() {
		return podcastId;
	}
	public void setPodcastId(Integer podcastId) {
		this.podcastId = podcastId;
	}
	
	@Column(name = "LIKESTATUS")
	public Integer getLikeStatus() {
		return likeStatus;
	}
	public void setLikeStatus(Integer likeStatus) {
		this.likeStatus = likeStatus;
	}

	@Column(name = "SHOWINLISTORNOT")
	public Integer getShowInListOrNot() {
		return showInListOrNot;
	}

	public void setShowInListOrNot(Integer showInListOrNot) {
		this.showInListOrNot = showInListOrNot;
	}
	
	

}
