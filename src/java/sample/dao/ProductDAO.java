/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import sample.dto.CategoryDTO;
import sample.dto.ProductDTO;
import sample.utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class ProductDAO {

    private static String GET_PRODUCT = "{Call GetProductList(?, ?, ?, ?)}";
    private static String ADD_TO_CART_ITEM = "{Call AddProductToCart(?, ?)}";
    public int totalProducts = 0;

    public List<ProductDTO> getListProduct(int pageNumber, int pageSize, String search) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        List<ProductDTO> productList = new ArrayList<>();

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                cs = conn.prepareCall(GET_PRODUCT);
                cs.setInt(1, pageNumber); // Số trang yêu cầu
                cs.setInt(2, pageSize); // Số sản phẩm trên mỗi trang
                cs.setString(3, search); // Số sản phẩm trên mỗi trang
                cs.registerOutParameter(4, Types.INTEGER); // Số sản phẩm trên mỗi trang

                rs = cs.executeQuery();

                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    String productName = rs.getString("product_name");
                    int categoryId = rs.getInt("category_id");
                    String categoryName = rs.getString("category_name");
                    double price = rs.getDouble("price");
                    String imageURL = rs.getString("imageURL");

                    CategoryDTO cate = new CategoryDTO();
                    cate.setCategoryId(categoryId);
                    cate.setCategoryName(categoryName);
                    
                    ProductDTO product = new ProductDTO();
                    product.setProductId(productId);
                    product.setProductName(productName);
                    product.setPrice(price);
                    product.setImageURL(imageURL);
                    product.setCategory(cate);

                    productList.add(product);
                }

                totalProducts = cs.getInt(4);

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (cs != null) {
                cs.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return productList;
    }
    
     public boolean addToCartItem(int accountId, int productId) throws SQLException{
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareStatement(ADD_TO_CART_ITEM);               
                ps.setInt(1, accountId);
                ps.setInt(2, productId);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return check;
    }
}
