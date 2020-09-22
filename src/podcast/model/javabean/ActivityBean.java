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
@Table(name="ACTIVITY")
@Component
public class ActivityBean {
	private Integer activityId;
	private String activityName;
	private Date activityDate;
	private String activityTime;
	private String activityContent;
	private String activityLocation;
	private Integer podcasterId;
	private Integer activityPrice;
	private Integer activityMaxPeople;
	private Integer stock;
	private Integer activityStatus;
	private String activityImg;
	
	
	@Id
	@Column(name="ACTIVITYID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getActivityId() {
		return activityId;
	}
	public void setActivityId(Integer activityId) {
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
	public Integer getPodcasterId() {
		return podcasterId;
	}
	public void setPodcasterId(Integer podcasterId) {
		this.podcasterId = podcasterId;
	}
	
	@Column(name="ACTIVITYPRICE")
	public Integer getActivityPrice() {
		return activityPrice;
	}
	public void setActivityPrice(Integer activityPrice) {
		this.activityPrice = activityPrice;
	}
	
	@Column(name="ACTIVITYMAXPEOPLE")
	public Integer getActivityMaxPeople() {
		return activityMaxPeople;
	}
	public void setActivityMaxPeople(Integer activityMaxPeople) {
		this.activityMaxPeople = activityMaxPeople;
	}
	
	
	@Column(name="ACTIVITYSTATUS")
	public Integer getActivityStatus() {
		return activityStatus;
	}
	public void setActivityStatus(Integer activityStatus) {
		this.activityStatus = activityStatus;
	}

	@Column(name="STOCK")
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	@Column(name="ACTIVITYIMG")
	public String getActivityImg() {
		return activityImg;
	}
	public void setActivityImg(String activityImg) {
		this.activityImg = activityImg;
	}
	
	@Column(name="ACTIVITYTIME")
	public String getActivityTime() {
		return activityTime;
	}
	public void setActivityTime(String activityTime) {
		this.activityTime = activityTime;
	}
	
	
}
