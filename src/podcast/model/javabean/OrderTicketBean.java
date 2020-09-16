package podcast.model.javabean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "orderTicket")
public class OrderTicketBean {
	private Integer ticketOrderId;
	private Date orderDate;
	private Integer orderPrice;
	private Integer memberId;
	private String creditCardNumber;
	private Integer activityId;

	public OrderTicketBean() {
	}

	public OrderTicketBean(Integer ticketOrderId, Date orderDate, Integer orderPrice, Integer memberId, String creditCardNumber,
			Integer activityId) {
		this.ticketOrderId = ticketOrderId;
		this.orderDate = orderDate;
		this.orderPrice = orderPrice;
		this.memberId = memberId;
		this.creditCardNumber = creditCardNumber;
		this.activityId = activityId;
	}

	@Id
	@Column(name = "TICKETORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getTicketOrderId() {
		return ticketOrderId;
	}

	public void setTicketOrderId(Integer ticketOrderId) {
		this.ticketOrderId = ticketOrderId;
	}

	@Column(name = "ORDERDATE")
	@Transient
	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Column(name = "ORDERPRICE")
	public Integer getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}

	@Column(name = "MEMBERID")
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "CREDITCARDNUMBER")
	public String getCreditCardNumber() {
		return creditCardNumber;
	}

	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}

	@Column(name = "ACTIVITYID")
	public Integer getActivityId() {
		return activityId;
	}

	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}

}
