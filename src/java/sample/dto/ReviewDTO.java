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
public class ReviewDTO {

    private int reviewId;
    private AccountDTO account;
    private ProductDTO product;
    private String feedback;
    private int rating;

    public ReviewDTO() {
    }

    public ReviewDTO(int reviewId, AccountDTO account, ProductDTO product, String feedback, int rating) {
        this.reviewId = reviewId;
        this.account = account;
        this.product = product;
        this.feedback = feedback;
        this.rating = rating;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public AccountDTO getAccount() {
        return account;
    }

    public void setAccount(AccountDTO account) {
        this.account = account;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "ReviewDTO{" + "reviewId=" + reviewId + ", account=" + account + ", product=" + product + ", feedback=" + feedback + ", rating=" + rating + '}';
    }

}
