package podcast.model.javabean;

public class PopularPodcasterBean {
	Integer memberId;
	Integer total;
	String nickname;
	String info;
	String image;
	
	public PopularPodcasterBean() {
		
	}
	
	public PopularPodcasterBean(Integer memberId,Integer total,String nickname,String info,String image) {
		this.memberId=memberId;
		this.total=total;
		this.nickname=nickname;
		this.info=info;
		this.image=image;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
