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
@Table(name = "subscription")
public class SubscriptionBean {
	private Integer subOrderId;
	private Date subdateStart;
	private Date subdateEnd;
	private Integer monthlyPayment;
	private Integer memberId;
	private Integer podcasterId;
	private String creditCardNumber;
	private String receipt;

	public SubscriptionBean() {
	}

	public SubscriptionBean(Integer subOrderId, Date subdateStart, Date subdateEnd, Integer monthlyPayment, Integer memberId,
			Integer podcasterId, String creditCardNumber, String receipt) {
		this.subOrderId = subOrderId;
		this.subdateStart = subdateStart;
		this.subdateEnd = subdateEnd;
		this.monthlyPayment = monthlyPayment;
		this.memberId = memberId;
		this.podcasterId = podcasterId;
		this.creditCardNumber = creditCardNumber;
		this.receipt = receipt;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SUBORDERID")
	public Integer getSubOrderId() {
		return subOrderId;
	}

	public void setSubOrderId(Integer subOrderId) {
		this.subOrderId = subOrderId;
	}

	@Column(name = "SUBDATESTART")
	public Date getSubdateStart() {
		return subdateStart;
	}

	public void setSubdateStart(Date subdateStart) {
		this.subdateStart = subdateStart;
	}

	@Column(name = "SUBDATEEND")
	public Date getSubdateEnd() {
		return subdateEnd;
	}

	public void setSubdateEnd(Date subdateEnd) {
		this.subdateEnd = subdateEnd;
	}

	@Column(name = "MONTHLYPAYMENT")
	public Integer getMonthlyPayment() {
		return monthlyPayment;
	}

	public void setMonthlyPayment(Integer monthlyPayment) {
		this.monthlyPayment = monthlyPayment;
	}

	@Column(name = "MEMBERID")
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "PODCASTERID")
	public Integer getPodcasterId() {
		return podcasterId;
	}

	public void setPodcasterId(Integer podcasterId) {
		this.podcasterId = podcasterId;
	}

	@Column(name = "CREDITCARDNUMBER")
	public String getCreditCardNumber() {
		return creditCardNumber;
	}

	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}

	@Column(name = "RECEIPT")
	public String getReceipt() {
		return receipt;
	}

	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}

}