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
	private int subOrderId;
	private Date subdateStart;
	private Date subdateEnd;
	private int monthlyPayment;
	private int memberId;
	private int podcasterId;
	private String creditCardNumber;
	private String receipt;

	public SubscriptionBean() {
	}

	public SubscriptionBean(int subOrderId, Date subdateStart, Date subdateEnd, int monthlyPayment, int memberId,
			int podcasterId, String creditCardNumber, String receipt) {
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
	public int getSubOrderId() {
		return subOrderId;
	}

	public void setSubOrderId(int subOrderId) {
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
	public int getMonthlyPayment() {
		return monthlyPayment;
	}

	public void setMonthlyPayment(int monthlyPayment) {
		this.monthlyPayment = monthlyPayment;
	}

	@Column(name = "MEMBERID")
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	@Column(name = "PODCASTERID")
	public int getPodcasterId() {
		return podcasterId;
	}

	public void setPodcasterId(int podcasterId) {
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