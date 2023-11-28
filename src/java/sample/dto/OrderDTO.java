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
public class OrderDTO {
    private int orderId;
    private AccountDTO account;
    private int quantity;
    private String orderStatus;
    private String paymentMethod;
    private double totalAmount;

    public OrderDTO() {
    }

    public OrderDTO(int orderId, AccountDTO account, int quantity, String orderStatus, String paymentMethod, double totalAmount) {
        this.orderId = orderId;
        this.account = account;
        this.quantity = quantity;
        this.orderStatus = orderStatus;
        this.paymentMethod = paymentMethod;
        this.totalAmount = totalAmount;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public AccountDTO getAccount() {
        return account;
    }

    public void setAccount(AccountDTO account) {
        this.account = account;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderId=" + orderId + ", account=" + account + ", quantity=" + quantity + ", orderStatus=" + orderStatus + ", paymentMethod=" + paymentMethod + ", totalAmount=" + totalAmount + '}';
    }
    
}
