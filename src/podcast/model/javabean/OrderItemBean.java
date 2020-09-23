package podcast.model.javabean;

import java.sql.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//本類別封裝單筆訂單資料
@Entity
@Table(name="orderItems")
public class OrderItemBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer seqno;
	
	Integer activityId;
	
	Integer amount; //庫存量
	
	String description;
	
	Integer unitPrice; //單價
	
	Integer quantity;
	
	Double discount;	
	
	Date activityDate;
	
	String activityName;
	
	String activityLocation;



	@ManyToOne
	@JoinColumn(name = "orderNo")
	OrderTicketBean orderTicketBean;
	

	public OrderItemBean(Integer activityId,String activityName,
			Integer unitPrice,Integer quantity,Date activityDate,String activityLocation,Integer amount) {
		this.activityId = activityId;
		this.unitPrice = unitPrice;
		this.amount = amount;
		this.quantity = quantity;
		this.activityName = activityName;
		this.activityDate = activityDate;
		this.activityLocation = activityLocation;
	}
	
	public OrderItemBean() {
		
	}
	public Integer getSeqno() {
		return seqno;
	}

	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}



	public Integer getactivityId() {
		return activityId;
	}

	public void setactivityId(Integer activityId) {
		this.activityId = activityId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public String getactivityName() {
		return activityName;
	}
	public void setactivityName(String activityName) {
		this.activityName = activityName;
	}

	public Integer getActivityId() {
		return activityId;
	}

	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public Date getActivityDate() {
		return activityDate;
	}

	public void setActivityDate(Date activityDate) {
		this.activityDate = activityDate;
	}

	public String getActivityLocation() {
		return activityLocation;
	}

	public void setActivityLocation(String activityLocation) {
		this.activityLocation = activityLocation;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public OrderTicketBean getOrderTicketBean() {
		return orderTicketBean;
	}

	public void setOrderTicketBean(OrderTicketBean orderTicketBean) {
		this.orderTicketBean = orderTicketBean;
	}
	
	
}