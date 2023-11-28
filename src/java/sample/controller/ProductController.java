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
import sample.dao.AccountDAO;
import sample.dao.ProductDAO;
import sample.dto.ProductDTO;

/**
 *
 * @author ASUS
 */
public class ProductController extends HttpServlet {

    private static final String ERROR = "product.jsp";
    private static final String SUCCESS = "product.jsp";
    private static final int PRODUCTS_PER_PAGE = 6;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String search = request.getParameter("search");
        String page = request.getParameter("page");
        try {
            if (page == null) {
                page = "1";
            }

            ProductDAO dao = new ProductDAO();
            List<ProductDTO> productList = dao.getListProduct(Integer.parseInt(page), PRODUCTS_PER_PAGE, search);
            int totalProducts = dao.totalProducts;

            if (!productList.isEmpty()) {

                request.setAttribute("PRODUCT_LIST", productList);
                request.setAttribute("PRODUCTS_PER_PAGE", PRODUCTS_PER_PAGE);
                request.setAttribute("TOTAL_PRODUCT", totalProducts);
                url = SUCCESS;
            } else {
                request.setAttribute("MESSAGE", "No products found.");
            }
            request.setAttribute("page", page);
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
