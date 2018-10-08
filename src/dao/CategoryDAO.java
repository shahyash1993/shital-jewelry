package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.CategoryVO;
import vo.ProductVO;

public class CategoryDAO extends ParentDAO{

	public int getCategoryCount() {
		int count = 0;

		try {
			Connection con = CategoryDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("select count(*) from "+CATEGORY_TABLE_NAME);
			ResultSet rs = ps.executeQuery();
			
			count = rs.getInt(1);
			System.out.println("Category Count: "+count);
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public List<CategoryVO> getAllCategories() {
		List<CategoryVO> catList = new ArrayList<CategoryVO>();

		try {
			Connection con = CategoryDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from "+CATEGORY_TABLE_NAME);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				CategoryVO categoryVO = new CategoryVO();
				categoryVO.setCatID(rs.getInt(1));
				categoryVO.setCatName(rs.getString(2));
				catList.add(categoryVO);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return catList;
	}

	public List<List<ProductVO>> getBestTwoProducts() {
		List<List<ProductVO>> bestTwoList_list = new ArrayList<List<ProductVO>>();
		List<ProductVO> bestTwo_list = null;
		
		List<CategoryVO> catList = getAllCategories();
		
		for(int i=0; i<catList.size(); i++) {
		///for each category
			bestTwo_list = new ArrayList<ProductVO>();
			
			try {
				Connection con = CategoryDAO.getConnection();
				String query = "SELECT * FROM "+PRODUCT_TABLE_NAME+" WHERE catID = "+catList.get(i).getCatID()+" ORDER BY retail DESC LIMIT 2";
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				
				while (rs.next()) {
					ProductVO productVO = new ProductVO();
					
					System.out.println("Image Path: "+rs.getString(10));
					productVO.setSku(rs.getString(1));
					productVO.setDesc(rs.getString(5));
					productVO.setFeatures(rs.getString(6));
					productVO.setImagePath(rs.getString(10));
					bestTwo_list.add(productVO);
				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			bestTwoList_list.add(bestTwo_list);
		}//end for
		
		System.out.println("CategoryDAO | Two Best Products received.");
		return bestTwoList_list;
	}

}
