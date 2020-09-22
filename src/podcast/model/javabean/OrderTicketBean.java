package podcast.model.javabean;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
	private Double totalAmount;
	private String shippingAddress;
	private Integer memberId;
	private Integer activityId;
	private String bno;
	private String invoiceTitle;



	Set<OrderItemBean> items = new LinkedHashSet<>();
	
	public OrderTicketBean() {
	}
	
	
	public OrderTicketBean(Integer memberId,Double totalAmount,String shippingAddress,
			String bno,String invoiceTitle,Date orderDate) {
		this.memberId = memberId;
		this.totalAmount = totalAmount;
		this.shippingAddress = shippingAddress;
		this.bno = bno;
		this.invoiceTitle = invoiceTitle;
		this.orderDate = orderDate;
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

	public void Double(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	@Column(name = "MEMBERID")
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}


	@Column(name = "ACTIVITYID")
	public Integer getActivityId() {
		return activityId;
	}

	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}

	@Column(name = "totalAmount")
	public Double getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}


	public String getShippingAddress() {
		return shippingAddress;
	}


	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}


	public String getBno() {
		return bno;
	}


	public void setBno(String bno) {
		this.bno = bno;
	}


	public String getInvoiceTitle() {
		return invoiceTitle;
	}


	public void setInvoiceTitle(String invoiceTitle) {
		this.invoiceTitle = invoiceTitle;
	}


	public Integer getOrderPrice() {
		return orderPrice;
	}


	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}


	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@OneToMany(mappedBy="orderTicketBean", cascade=CascadeType.ALL)
	public Set<OrderItemBean> getItems() {
		return items;
	}


	public void setItems(Set<OrderItemBean> items) {
		this.items = items;
	}



	
	
}
