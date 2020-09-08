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
	
	
	private int historyId;
	private int podcastId;
	private String podcastName;
	private int publisherId;
	private int memberId;
	private Date lastListen;

	@Id
	@Column(name="HISTORYID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getHistoryId() {
		return historyId;
	}

	public void setHistoryId(int historyId) {
		this.historyId = historyId;
	}

	@Column(name="PODCASTID")
	public int getPodcastId() {
		return podcastId;
	}

	public void setPodcastId(int podcastId) {
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
	public int getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(int publisherId) {
		this.publisherId = publisherId;
	}

	@Column(name="MEMBERID")
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
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
