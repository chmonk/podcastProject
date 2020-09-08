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
@Table(name = "orderTicket")
public class OrderTicketBean {
	private int ticketOrderId;
	private Date orderDate;
	private int orderPrice;
	private int memberId;
	private String creditCardNumber;
	private int activityId;

	public OrderTicketBean() {
	}

	public OrderTicketBean(int ticketOrderId, Date orderDate, int orderPrice, int memberId, String creditCardNumber,
			int activityId) {
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
	public int getTicketOrderId() {
		return ticketOrderId;
	}

	public void setTicketOrderId(int ticketOrderId) {
		this.ticketOrderId = ticketOrderId;
	}

	@Column(name = "ORDERDATE")
	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Column(name = "ORDERPRICE")
	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	@Column(name = "MEMBERID")
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
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
	public int getActivityId() {
		return activityId;
	}

	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}

}
