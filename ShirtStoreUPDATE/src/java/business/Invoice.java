/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/licenseprivate Stringdefault.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

/**
 *
 * @author admin
 */
import business.*;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Entity;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import java.util.List;

@Entity
public class Invoice implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long invoiceID;
    
    @ManyToOne
    private User user;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<LineItem> productList;

    
    private String address;
    private String district;
    private String city;
    
    @OneToOne
    private PromotionCode promotion;
    private String paymentMethod;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date invoiceDate;
    
    private double subTotal;
    private double discount;
    private double total;

    public Invoice() {
    }

    public Invoice(User user, List<LineItem> productList, String address, String district, String city, PromotionCode promotion, String paymentMethod, Date invoiceDate, double subTotal, double discount, double total) {
        this.user = user;
        this.productList = productList;
        this.address = address;
        this.district = district;
        this.city = city;
        this.promotion = promotion;
        this.paymentMethod = paymentMethod;
        this.invoiceDate = invoiceDate;
        this.subTotal = subTotal;
        this.discount = discount;
        this.total = total;
    }

    public Invoice(User user, List<LineItem> productList, String address, String district, String city, String paymentMethod, Date invoiceDate, double subTotal, double discount, double total) {
        this.user = user;
        this.productList = productList;
        this.address = address;
        this.district = district;
        this.city = city;
        this.paymentMethod = paymentMethod;
        this.invoiceDate = invoiceDate;
        this.subTotal = subTotal;
        this.discount = discount;
        this.total = total;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getInvoiceID() {
        return invoiceID;
    }
    
    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public List<LineItem> getProductList() {
        return productList;
    }

    public void setProductList(List<LineItem> productList) {
        this.productList = productList;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public PromotionCode getPromotion() {
        return promotion;
    }

    public void setPromotion(PromotionCode promotion) {
        this.promotion = promotion;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
        public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
}
