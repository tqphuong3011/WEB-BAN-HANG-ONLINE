/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/licenseprivate Stringdefault.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

import business.*;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Entity;
import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import static javax.persistence.FetchType.EAGER;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "shirt")
public class Shirt implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int productID;
    private String productName;

    @ManyToOne
    //@JoinColumn(name = "category_id")
    private Category category;

    private String productSize;
    private String productColor;
    private String productDecription;
    private Long productPrice;

    @OneToMany(fetch=EAGER, cascade=CascadeType.ALL)
    private List<sImage> images;

    public Shirt() {
        
    }

    public Shirt(String productName, Category category, String productSize, String productColor, String productDecription, Long productPrice, List<sImage> images) {
        this.productName = productName;
        this.category = category;
        this.productSize = productSize;
        this.productColor = productColor;
        this.productDecription = productDecription;
        this.productPrice = productPrice;
        this.images = images;
    }

    public Shirt(int productID, String productName, Category category, String productSize, String productColor, String productDecription, Long productPrice, List<sImage> images) {
        this.productID = productID;
        this.productName = productName;
        this.category = category;
        this.productSize = productSize;
        this.productColor = productColor;
        this.productDecription = productDecription;
        this.productPrice = productPrice;
        this.images = images;
    }
    
    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductSize() {
        return productSize;
    }

    public void setProductSize(String productSize) {
        this.productSize = productSize;
    }

    public String getProductColor() {
        return productColor;
    }

    public void setProductColor(String productColor) {
        this.productColor = productColor;
    }

    public String getProductDecription() {
        return productDecription;
    }

    public void setProductDecription(String productDecription) {
        this.productDecription = productDecription;
    }

    public Long getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Long productPrice) {
        this.productPrice = productPrice;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<sImage> getImages() {
        return images;
    }

    public void setImages(List<sImage> images) {
        this.images = images;
    }

}
