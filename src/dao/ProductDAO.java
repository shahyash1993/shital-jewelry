package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.CategoryVO;
import vo.ProductVO;

public class ProductDAO extends ParentDAO {

	public List<ProductVO> searchCatSpecificProd(CategoryVO categoryVO) {
		List<ProductVO> catSpecificProd_list = new ArrayList<ProductVO>();
		String query = "select * from "+PRODUCT_TABLE_NAME+" where catID = "+categoryVO.getCatID();
		
		try {
			Connection con = ProductDAO.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				ProductVO productVO = new ProductVO();
				productVO.setSku(rs.getString(1));
				productVO.setDesc(rs.getString(5));
				productVO.setFeatures(rs.getString(6));
				productVO.setImagePath(rs.getString(10));
				
				catSpecificProd_list.add(productVO);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("Product DAO | searchCatSpecificProd | catSpecificProd_list size: "+catSpecificProd_list.size());
		return catSpecificProd_list;
	}
	
	public List<ProductVO> searchSkuSpecificProd(ProductVO productVO) {
		List<ProductVO> skuSpecificProd_list = new ArrayList<ProductVO>();
		String query = "select * from "+PRODUCT_TABLE_NAME+" where sku = '"+productVO.getSku()+"'";
		
		try {
			Connection con = ProductDAO.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				productVO.setSku(rs.getString(1));
				productVO.setVendorModel(rs.getString(4));
				productVO.setDesc(rs.getString(5));
				productVO.setFeatures(rs.getString(6));
				
				productVO.setCost(rs.getDouble("cost"));
				productVO.setRetail(rs.getDouble("retail"));
				productVO.setQty(rs.getInt("qty"));
				
				productVO.setImagePath(rs.getString(10));
				
				skuSpecificProd_list.add(productVO);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("Product DAO | searchSkuSpecificProd | skuSpecificProd_list size: "+skuSpecificProd_list.size()+" |sku:"+skuSpecificProd_list.get(0).getSku());
		return skuSpecificProd_list;
	}

	public List<ProductVO> getQueryProduct(ProductVO productVO) {
		List<ProductVO> userQuery_list = new ArrayList<ProductVO>();
		//

		String query = "select * from "+PRODUCT_TABLE_NAME+" where description = '"+productVO.getDesc()+"'";
		
		try {
			Connection con = ProductDAO.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				productVO.setSku(rs.getString(1));
				productVO.setVendorModel(rs.getString(4));
				productVO.setDesc(rs.getString(5));
				productVO.setFeatures(rs.getString(6));
				
				productVO.setCost(rs.getDouble("cost"));
				productVO.setRetail(rs.getDouble("retail"));
				productVO.setQty(rs.getInt("qty"));
				
				productVO.setImagePath(rs.getString(10));
				
				userQuery_list.add(productVO);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("Query: "+query+"|Product DAO | getQueryProduct | userQuery_list size: "+userQuery_list.size());
		
		return userQuery_list;
	}
}
