/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dto;

/**
 *
 * @author ASUS
 */
public class CartItemDTO {

    public int cartItemId;
    public CartDTO cart;
    public ProductDTO product;
    public int Quantity;

    public CartItemDTO() {
    }

    public CartItemDTO(int cartItemId, CartDTO cart, ProductDTO product, int Quantity) {
        this.cartItemId = cartItemId;
        this.cart = cart;
        this.product = product;
        this.Quantity = Quantity;
    }

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public CartDTO getCart() {
        return cart;
    }

    public void setCart(CartDTO cart) {
        this.cart = cart;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    @Override
    public String toString() {
        return "CartItemDTO{" + "cartItemId=" + cartItemId + ", cart=" + cart + ", product=" + product + ", Quantity=" + Quantity + '}';
    }

}
