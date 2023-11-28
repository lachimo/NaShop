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
public class ProductDTO {
    private int productId;
    private String productName;
    private CategoryDTO category;
    private String description;
    private double price;
    private int quantity;
    private String imageURL;

    public ProductDTO() {
    }

    public ProductDTO(int productId, String productName, CategoryDTO category, String description, double price, int quantity, String imageURL) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.imageURL = imageURL;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public CategoryDTO getCategory() {
        return category;
    }

    public void setCategory(CategoryDTO category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productId=" + productId + ", productName=" + productName + ", category=" + category + ", description=" + description + ", price=" + price + ", quantity=" + quantity + ", imageURL=" + imageURL + '}';
    }

   
}
