/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.dao.CartDAO;
import sample.dao.ProductDAO;
import sample.dto.CartItemDTO;
import sample.dto.ProductDTO;

/**
 *
 * @author Kle
 */
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "product.jsp";
    private static final String SUCCESS = "product.jsp";
    private static final int PRODUCTS_PER_PAGE = 6;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            int accountId = (int) session.getAttribute("ACCOUNT_ID");
            String productId = request.getParameter("productId");
            String page = request.getParameter("page");
            String search = request.getParameter("search");

            ProductDAO product = new ProductDAO();
            boolean addToCartItem = product.addToCartItem(accountId, Integer.parseInt(productId));

            if (addToCartItem) {
                List<ProductDTO> productList = product.getListProduct(Integer.parseInt(page), PRODUCTS_PER_PAGE, search);
                int totalProducts = product.totalProducts;
                
                CartDAO cart = new CartDAO();
                List<CartItemDTO> cartItem = cart.getCartItem(accountId);
                int totalItems = cartItem.size();

                session.setAttribute("TOTAL_ITEMS", totalItems);
                request.setAttribute("search", search);
                request.setAttribute("page", page);
                request.setAttribute("PRODUCT_LIST", productList);
                request.setAttribute("PRODUCTS_PER_PAGE", PRODUCTS_PER_PAGE);
                request.setAttribute("TOTAL_PRODUCT", totalProducts);
                
                
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("Error at ProductController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
