package podcast.model.javabean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "myFavProgram")
public class MyFavProgramBean {
	private Integer memberId;
	private Integer favId;
	private Integer podcastId;
	private Integer subPermission;
	private Integer podcastOpen;
	

	@Id
	@Column(name = "FAVID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getFavId() {
		return favId;
	}

	public void setFavId(Integer favId) {
		this.favId = favId;
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

	@Column(name = "SUBPERMISSION")
	public Integer getSubPermission() {
		return subPermission;
	}

	public void setSubPermission(Integer subPermission) {
		this.subPermission = subPermission;
	}

	@Column(name = "PODCASTOPEN")
	public Integer getPodcastOpen() {
		return podcastOpen;
	}

	public void setPodcastOpen(Integer podcastOpen) {
		this.podcastOpen = podcastOpen;
	}


	
	
}
