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
public class CartDTO {

    public int cartId;
    public AccountDTO account;

    public CartDTO() {
    }

    public CartDTO(int cartId, AccountDTO account) {
        this.cartId = cartId;
        this.account = account;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public AccountDTO getAccount() {
        return account;
    }

    public void setAccount(AccountDTO account) {
        this.account = account;
    }

    @Override
    public String toString() {
        return "CartDTO{" + "cartId=" + cartId + ", account=" + account + '}';
    }

    

}
