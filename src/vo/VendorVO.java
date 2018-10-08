package vo;

import java.io.Serializable;

public class VendorVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int vendorID;
	private String vendorName;

	public int getVendorID() {
		return vendorID;
	}
	public void setVendorID(int vendorID) {
		this.vendorID = vendorID;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
}
