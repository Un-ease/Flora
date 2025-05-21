package model;

import java.util.Date;

public class WishListItem {
    private int wishlistId;
    private int userId;
    private int productId;
    private Date dateAdded;
    private Product product; // Optional, for full product info

    public WishListItem() {}

    public WishListItem(int userId, int productId) {
        this.userId = userId;
        this.productId = productId;
        this.dateAdded = new Date();
    }

    // Getters and Setters
    public int getWishlistId() {
        return wishlistId;
    }

    public void setWishlistId(int wishlistId) {
        this.wishlistId = wishlistId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Date getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(Date dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
