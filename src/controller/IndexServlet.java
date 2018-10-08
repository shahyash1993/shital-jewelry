package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDAO;
import dao.ProductDAO;
import vo.CategoryVO;
import vo.ProductVO;

@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	CategoryDAO categoryDAO = new CategoryDAO();
	ProductDAO productDAO = new ProductDAO();

	private static final long serialVersionUID = 1L;

	public IndexServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("skuSpecificProd_list");

		//obtain **flag** value
		if(request.getParameter("flag") != null) {
			String flag = request.getParameter("flag");
			System.out.println("Captured Flag:- "+flag);

			if(flag.equals("search_userQuery")) {
				String search_query = request.getParameter("search_query");
				System.out.println("search_query: "+search_query);

				ProductVO productVO = new ProductVO();
				productVO.setDesc(search_query);

				List<ProductVO> userQuery_list = search_userQuery(productVO);
				session.setAttribute("userQuery_list", userQuery_list);

				response.sendRedirect("product.jsp");	
			}
			else if(flag.equals("search_allCat")) {
				List<CategoryVO> allCat_list = search_allCat();
				session.setAttribute("allCat_list", allCat_list);

				//find best two
				List<List<ProductVO>> bestTwoList_list = search_bestTwoProducts();
				System.out.println("IndexServlet | bestTwoProduct size:"+bestTwoList_list.size());
				session.setAttribute("bestTwoList_list", bestTwoList_list);

				response.sendRedirect("index.jsp");	
			}
		}
		else {
			System.out.println("Null Flag is found!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		//obtain **flag** value
		if(request.getParameter("flag") != null) {
			String flag = request.getParameter("flag");
			System.out.println("Captured Flag:- "+flag);

			if(flag.equals("search_allCat")) {
				List<CategoryVO> allCat_list = search_allCat();
				session.setAttribute("allCat_list", allCat_list);

				//find best two
				List<List<ProductVO>> bestTwoList_list = search_bestTwoProducts();
				System.out.println("IndexServlet | bestTwoProduct size:"+bestTwoList_list.size());
				session.setAttribute("bestTwoList_list", bestTwoList_list);

				response.sendRedirect("index.jsp");	
			}
			else if(flag.equals("")) {
					
			}
			else {
				System.err.println("Wrong flag was captured: "+flag);
			}
		}

	}//end doPost()

	protected List<CategoryVO> search_allCat() {
		List<CategoryVO> allCat_list = categoryDAO.getAllCategories();
		return allCat_list;
	}

	protected List<List<ProductVO>> search_bestTwoProducts(){
		List<List<ProductVO>> bestTwoList_list = categoryDAO.getBestTwoProducts();
		return bestTwoList_list;
	}

	protected List<ProductVO> search_userQuery(ProductVO productVO) {
		List<ProductVO> userQuery_list = productDAO.getQueryProduct(productVO);
		return userQuery_list;
	}

}//end Servlet
