package model;

public class Product {
	private int productId;
    private String productName;
    private String productDescription;
    private double price;
    private String image;
    private int quantity;
    private int sold;
    
    public Product() {
    
    }
    
    public Product(int productId, String productName, String productDescription, double price, String image, int quantity, int sold) {
    	this.productId = productId;
    	this.productName = productName;
    	this.productDescription = productDescription;
    	this.price = price;
    	this.image = image;
    	this.quantity = quantity;
    	this.sold = sold;
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

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public int getQuantity() {
    	return quantity;
    }
    
    public void setQuantity(int quantity) {
    	this.quantity = quantity;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

}


