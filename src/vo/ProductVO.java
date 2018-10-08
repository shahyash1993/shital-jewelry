package vo;

import java.io.Serializable;

public class ProductVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String sku;

	private CategoryVO catID_fk;
	private VendorVO vendorID_fk;
	private String vendorModel;
	private String desc;
	private String features;
	private double cost;
	private double retail;
	private int qty;
	private String imagePath;
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public CategoryVO getCatID_fk() {
		return catID_fk;
	}
	public void setCatID_fk(CategoryVO catID_fk) {
		this.catID_fk = catID_fk;
	}
	public VendorVO getVendorID_fk() {
		return vendorID_fk;
	}
	public void setVendorID_fk(VendorVO vendorID_fk) {
		this.vendorID_fk = vendorID_fk;
	}
	public String getVendorModel() {
		return vendorModel;
	}
	public void setVendorModel(String vendorModel) {
		this.vendorModel = vendorModel;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getFeatures() {
		return features;
	}
	public void setFeatures(String features) {
		this.features = features;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public double getRetail() {
		return retail;
	}
	public void setRetail(double retail) {
		this.retail = retail;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
		
}
