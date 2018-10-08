package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import vo.CategoryVO;
import vo.ProductVO;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CategoryServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		//obtain **flag** value
		if(request.getParameter("flag") != null) {
			String flag = request.getParameter("flag");
			System.out.println("Captured Flag:- "+flag);

			if(flag.equals("search_catSpecificProd")) {
				int catID = Integer.parseInt(request.getParameter("catID"));
				String catName = request.getParameter("catName");

				List<ProductVO> catSpecificProd_list = searchCatSpecificProd(catID);
				session.setAttribute("catSpecificProd_list", catSpecificProd_list);
				session.setAttribute("catName", catName);
			}
			else if(flag.equals("")) {
			}
			else {
				System.err.println("Wrong flag was captured: "+flag);
			}
		}
		response.sendRedirect("category.jsp");	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

	private List<ProductVO> searchCatSpecificProd(int catID) {
		//Set catVO to query into ProductDAO

		CategoryVO categoryVO = new CategoryVO();
		categoryVO.setCatID(catID);

		ProductDAO productDAO = new ProductDAO();
		List<ProductVO> catSpecificProd_list = productDAO.searchCatSpecificProd(categoryVO);

		return catSpecificProd_list;
	}
}
