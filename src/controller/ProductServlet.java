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

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("userQuery_list");
		
		//obtain **flag** value
		if(request.getParameter("flag") != null) {
			String flag = request.getParameter("flag");
			System.out.println("Captured Flag:- "+flag);

			if(flag.equals("search_skuSpecificProd")) {
				String sku = request.getParameter("sku");

				List<ProductVO> skuSpecificProd_list = searchSkuSpecificProd(sku);
				
				session.setAttribute("skuSpecificProd_list", skuSpecificProd_list);
			}
			else if(flag.equals("")) {
			}
			else {
				System.err.println("Wrong flag was captured: "+flag);
			}
		}
		response.sendRedirect("product.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private List<ProductVO> searchSkuSpecificProd(String sku) {
		//Set catVO to query into ProductDAO

		ProductVO productVO = new ProductVO();
		productVO.setSku(sku);

		ProductDAO productDAO = new ProductDAO();
		List<ProductVO> skuSpecificProd_list = productDAO.searchSkuSpecificProd(productVO);

		return skuSpecificProd_list;
	}
}
