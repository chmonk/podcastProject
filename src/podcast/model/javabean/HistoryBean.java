package podcast.model.javabean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="browsingHistory")
public class HistoryBean {
	
	
	private Integer historyId;
	private Integer podcastId;
	private String podcastName;
	private Integer publisherId;
	private Integer memberId;
	private Date lastListen;

	@Id
	@Column(name="HISTORYID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getHistoryId() {
		return historyId;
	}

	public void setHistoryId(Integer historyId) {
		this.historyId = historyId;
	}

	@Column(name="PODCASTID")
	public Integer getPodcastId() {
		return podcastId;
	}

	public void setPodcastId(Integer podcastId) {
		this.podcastId = podcastId;
	}

	@Column(name="PODCASTNAME")
	public String getPodcastName() {
		return podcastName;
	}

	public void setPodcastName(String podcastName) {
		this.podcastName = podcastName;
	}

	@Column(name="PUBLISHERID")
	public Integer getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(Integer publisherId) {
		this.publisherId = publisherId;
	}

	@Column(name="MEMBERID")
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name="LASTLISTEN")
	public Date getLastListen() {
		return lastListen;
	}

	public void setLastListen(Date lastListen) {
		this.lastListen = lastListen;
	}
	
}
