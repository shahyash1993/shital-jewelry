package vo;

import java.io.Serializable;

public class CategoryVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int catID;
	private String catName;
	
	public int getCatID() {
		return catID;
	}
	public void setCatID(int catID) {
		this.catID = catID;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
}
