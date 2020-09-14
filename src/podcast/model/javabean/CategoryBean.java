package podcast.model.javabean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name = "Category")
public class CategoryBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer categoryId;
	private String categoryName;

	// 無參數建構子
	public CategoryBean() {
	}

	// 帶參數建構子
	public CategoryBean(Integer categoryId, String categoryName) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}

	@Id
	@Column(name = "CATEGORYID")
<<<<<<< HEAD
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getCategoryId() {
=======
	public Integer getCategoryId() {
>>>>>>> c2b05bb51eb55e4f231fec1fceb624e2cc6b161c
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "CATEGORYNAME")
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


}
