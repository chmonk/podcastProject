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
	private int memberId;
	private int favId;
	private int podcastId;
	private int subPermission;
	private int podcastOpen;

	@Id
	@Column(name = "FAVID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getFavId() {
		return favId;
	}

	public void setFavId(int favId) {
		this.favId = favId;
	}

	@Column(name = "MEMBERID")
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	@Column(name = "PODCASTID")
	public int getPodcastId() {
		return podcastId;
	}

	public void setPodcastId(int podcastId) {
		this.podcastId = podcastId;
	}

	@Column(name = "SUBPERMISSION")
	public int getSubPermission() {
		return subPermission;
	}

	public void setSubPermission(int subPermission) {
		this.subPermission = subPermission;
	}

	@Column(name = "PODCASTOPEN")
	public int getPodcastOpen() {
		return podcastOpen;
	}

	public void setPodcastOpen(int podcastOpen) {
		this.podcastOpen = podcastOpen;
	}

}
