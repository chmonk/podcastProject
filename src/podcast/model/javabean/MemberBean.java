package podcast.model.javabean;

import java.io.Serializable;
import java.sql.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "members")
@Component
public class MemberBean implements Serializable  {
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "MEMBERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberId;

	@Column(name = "ACCOUNT")
	private String account;

	@Column(name = "PASSWORD")
	private String password;

	@Column(name = "NAME")
	private String name;

	@Column(name = "NICKNAME")
	private String nickname;

	@Column(name = "BIRTHDAY")
	private Date birthday;

	@Column(name = "REGISTERDATE")
	private Date registerDate;

	@Column(name = "INFO")
	private String info;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "CELLPHONE")
	private String cellphone;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "SEX")
	private String sex;

	@Column(name = "IMAGE")
	private String image;

	@Column(name = "ROLE")
	private Integer role;

	@Column(name = "CREDITCARDNUMBER")
	private String creditCardNumber;

	@Column(name = "BANKACCOUNT")
	private String bankAccount;

	@Column(name = "MONTHLYPAYMENT")
	private Integer monthlyPayment;
	
	@Column(name = "PODCASTORWEBPAGE")
	private String podcastorWebPage;

	public MemberBean() {
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	public Date getBirthday() {
		return birthday;
	}

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	public Date getRegisterDate() {
		return registerDate;
	}

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public String getCreditCardNumber() {
		return creditCardNumber;
	}

	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public Integer getMonthlyPayment() {
		return monthlyPayment;
	}

	public void setMonthlyPayment(Integer monthlyPayment) {
		this.monthlyPayment = monthlyPayment;
	}

	public String getPodcastorWebPage() {
		return podcastorWebPage;
	}

	public void setPodcastorWebPage(String podcastorWebPage) {
		this.podcastorWebPage = podcastorWebPage;
	}

//	public List<friendsList> getFriendsList() {
//		return friendsList;
//	}
//
//	public void setFriendsList(List<friendsList> friendsList) {
//		this.friendsList = friendsList;
//	}

	
	
}
