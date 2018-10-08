package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import vo.ProductVO;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartServlet() {
        super();
    }
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		
 		HttpSession session = request.getSession();

		//obtain **flag** value
		if(request.getParameter("flag") != null) {
			String flag = request.getParameter("flag");
			System.out.println("Captured Flag:- "+flag);

			if(flag.equals("addToCart")) {
				String sku = request.getParameter("sku");
				System.out.println("Captured SKU:- "+sku);
	
				//APPEND sku to the Cart All Products session list
				ProductVO productVO = new ProductVO();
				productVO.setSku(sku);
				
				ProductDAO productDAO = new ProductDAO();

				List<ProductVO> cartAllProduct_list = (List<ProductVO>) session.getAttribute("cartAllProduct_list");
				if(cartAllProduct_list == null) {
					cartAllProduct_list = new ArrayList<ProductVO>();
					System.out.println("Previously Total Products in cart: '0'");
				}
				else {
					System.out.println("Previously Total Products in cart: "+cartAllProduct_list.size());
				}
				
				List<ProductVO> cartProduct_list = productDAO.searchSkuSpecificProd(productVO);
				System.out.println("cartProduct_list.size: "+cartProduct_list.size());

				if(cartProduct_list.size()>0) {
					cartAllProduct_list.add(cartProduct_list.get(0));
					
					session.setAttribute("cartAllProduct_list", cartAllProduct_list);
					System.out.println("Total Products in cart: "+cartAllProduct_list.size());
				}
				else {
					System.out.println("Some error occured! cartProduct size = 0");
				}

				if(request.getParameter("redirect") !=null) {
					response.sendRedirect("cart.jsp");	
				}
				else {
					//No redirection (AJAX call) 
				}
			}
			
			else if(flag.equals("cart_displayAll")) {
				//No need as the session is set already!
			}
			
			else if(flag.equals("removeCart")) {
				System.out.println("Removing Cart from session");
				request.getSession().removeAttribute("cartAllProduct_list");
			}
			
			else if(flag.equals("delete_cartProduct")) {
				String sku = request.getParameter("sku");

				//delete Product having sku from list.
				List<ProductVO> cartAllProduct_list = (List<ProductVO>) session.getAttribute("cartAllProduct_list");
				
				for(ProductVO vo : cartAllProduct_list) {
					if(sku.equals(vo.getSku())) {
						cartAllProduct_list.remove(vo);
						break;
					}
				}
				session.setAttribute("cartAllProduct_list", cartAllProduct_list);
				response.sendRedirect("cart.jsp");
			}
			else {
				System.err.println("Wrong flag was captured: "+flag);
			}
		}
/*		response.sendRedirect("cart.jsp");	*/
 		
 	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
