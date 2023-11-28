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
import java.util.ArrayList;
import java.util.List;
import sample.dto.CartDTO;
import sample.dto.CartItemDTO;
import sample.dto.ProductDTO;
import sample.utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class CartDAO {

    private static final String GET_CART_ITEM = "SELECT ci.cart_item_id, ci.quantity, ci.cart_id, p.product_id, p.product_name, p.description, p.price, "
            + "p.quantity AS product_quantity, p.imageURL FROM cart_item ci INNER JOIN products p ON ci.product_id = p.product_id INNER JOIN cart c ON ci.cart_id = "
            + "c.cart_id WHERE c.account_id = ?";
    private static final String DELETE_ITEM = "DELETE FROM cart_item WHERE product_id = ? and cart_id = ?";
    private static final String UPDATE_ITEM = "UPDATE cart_item SET quantity = ? WHERE cart_id = ? AND product_id = ?";
    private static final String INSERT_ORDER = "{Call PlaceOrder(?, ?, ?, ?, ?, ?)}";

    public List<CartItemDTO> getCartItem(int accountId) throws SQLException {
        List<CartItemDTO> cartList = new ArrayList<>();
        Connection con = null;
        PreparedStatement cs = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                cs = con.prepareStatement(GET_CART_ITEM);
                cs.setInt(1, accountId);
                rs = cs.executeQuery();

                while (rs.next()) {
//     Đọc dữ liệu từ ResultSet và tạo đối tượng CartItemDTO
                    int quantity = rs.getInt("quantity");
                    int cartItemId = rs.getInt("cart_item_id");
                    int productQuantity = rs.getInt("product_quantity");
                    int productId = rs.getInt("product_id");
                    String productName = rs.getString("product_name");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
                    String imageUrl = rs.getString("imageURL");
                    int cartId = rs.getInt("cart_id");

                    ProductDTO product = new ProductDTO();
                    product.setProductName(productName);
                    product.setProductId(productId);
                    product.setQuantity(productQuantity);
                    product.setDescription(description);
                    product.setPrice(price);
                    product.setImageURL(imageUrl);

                    CartDTO cart = new CartDTO();
                    cart.setCartId(cartId);

                    CartItemDTO cartItem = new CartItemDTO();
                    cartItem.setCart(cart);
                    cartItem.setCartItemId(cartItemId);
                    cartItem.setQuantity(quantity);
                    cartItem.setProduct(product);

                    cartList.add(cartItem);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (cs != null) {
                cs.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return cartList;
    }

    public boolean updateItem(int quantity, int productId, int cartId) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        boolean check = false;
        try {
            con = DBUtils.getConnection();
             if (con != null) {
                ps = con.prepareStatement(UPDATE_ITEM);               
                ps.setInt(1, quantity);
                ps.setInt(2, cartId);
                ps.setInt(3, productId);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public boolean deleteItem(int proId, int cId) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        boolean check = false;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                ps = con.prepareStatement(DELETE_ITEM);
                ps.setInt(1, proId);
                ps.setInt(2, cId);
                check = ps.executeUpdate() > 0;

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return check;

    }
    
    public boolean insertOrder(int accountId, double totalAmount, String firstName, String lastName, String address, String phone) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        boolean check = false;
        try {
            con = DBUtils.getConnection();
             if (con != null) {
                ps = con.prepareStatement(INSERT_ORDER);               
                ps.setInt(1, accountId);
                ps.setDouble(2, totalAmount);
                ps.setString(3, address);
                ps.setString(4, firstName);
                ps.setString(5, lastName);               
                ps.setString(6, phone);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

}
