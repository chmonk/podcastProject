package podcast.model.javabean;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name="activity")
@Component
public class ActivityBean {
	private int activityId;
	private String activityName;
	private Date activityDate;
	private String activityContent;
	private String activityLocation;
	private int podcasterId;
	private int activityPrice;
	private int activityMaxPeople;
	private int activityMinPeople;
	private int activityStatus;
	private String activityImg;
	
	@Id
	@Column(name="ACTIVITYID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getActivityId() {
		return activityId;
	}
	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}
	
	@Column(name="ACTIVITYNAME")
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	
	@Column(name="ACTIVITYDATE")
	public Date getActivityDate() {
		return activityDate;
	}
	public void setActivityDate(Date activityDate) {
		this.activityDate = activityDate;
	}
	
	@Column(name="ACTIVITYCONTENT")
	public String getActivityContent() {
		return activityContent;
	}
	public void setActivityContent(String activityContent) {
		this.activityContent = activityContent;
	}
	
	@Column(name="ACTIVITYLOCATION")
	public String getActivityLocation() {
		return activityLocation;
	}
	public void setActivityLocation(String activityLocation) {
		this.activityLocation = activityLocation;
	}
	
	@Column(name="PODCASTERID")
	public int getPodcasterId() {
		return podcasterId;
	}
	public void setPodcasterId(int podcasterId) {
		this.podcasterId = podcasterId;
	}
	
	@Column(name="ACTIVITYPRICE")
	public int getActivityPrice() {
		return activityPrice;
	}
	public void setActivityPrice(int activityPrice) {
		this.activityPrice = activityPrice;
	}
	
	@Column(name="ACTIVITYMAXPEOPLE")
	public int getActivityMaxPeople() {
		return activityMaxPeople;
	}
	public void setActivityMaxPeople(int activityMaxPeople) {
		this.activityMaxPeople = activityMaxPeople;
	}
	
	@Column(name="ACTIVITYMINPEOPLE")
	public int getActivityMinPeople() {
		return activityMinPeople;
	}
	public void setActivityMinPeople(int activityMinPeople) {
		this.activityMinPeople = activityMinPeople;
	}
	
	@Column(name="ACTIVITYSTATUS")
	public int getActivityStatus() {
		return activityStatus;
	}
	public void setActivityStatus(int activityStatus) {
		this.activityStatus = activityStatus;
	}

	@Column(name="ACTIVITYIMG")
	public String getActivityImg() {
		return activityImg;
	}
	public void setActivityImg(String activityImg) {
		this.activityImg = activityImg;
	}
}
