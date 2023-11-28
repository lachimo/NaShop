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
public class OrderDetailsDTO {

    private int orderDetailId;
    private ProductDTO product;
    private OrderDTO order;
    private int quantity;
    private double totalPrice;

    public OrderDetailsDTO() {
    }

    public OrderDetailsDTO(int orderDetailId, ProductDTO product, OrderDTO order, int quantity, double totalPrice) {
        this.orderDetailId = orderDetailId;
        this.product = product;
        this.order = order;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public OrderDTO getOrder() {
        return order;
    }

    public void setOrder(OrderDTO order) {
        this.order = order;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "OrderDetailsDTO{" + "orderDetailId=" + orderDetailId + ", product=" + product + ", order=" + order + ", quantity=" + quantity + ", totalPrice=" + totalPrice + '}';
    }

}
