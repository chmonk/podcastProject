package podcast.model.javabean;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;


//json test
@Entity
@Component
public class HouseBean {
	private int houseid;
	private String housename;
	
	public HouseBean() {		
	}

	public HouseBean(int houseid, String housename) {
		this.houseid = houseid;
		this.housename = housename;
	}
	@Id
	public int getHouseid() {
		return houseid;
	}

	public void setHouseid(int houseid) {
		this.houseid = houseid;
	}

	public String getHousename() {
		return housename;
	}

	public void setHousename(String housename) {
		this.housename = housename;
	}

}
