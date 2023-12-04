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
import javax.persistence.Id;
import javax.persistence.OneToOne;
    
@Entity
public class LineItem implements Serializable{
    
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private Long lineItemID;
    
    @OneToOne
    private Shirt product;
    private int quantity;
    private double priceUnit;

    public LineItem() {
    }

    public LineItem(Shirt product, int quantity, double priceUnit) {
        this.product = product;
        this.quantity = quantity;
        this.priceUnit = priceUnit;
    }

    public LineItem(Long lineItemID, Shirt product, int quantity, double priceUnit) {
        this.lineItemID = lineItemID;
        this.product = product;
        this.quantity = quantity;
        this.priceUnit = priceUnit;
    }
    
//    public double getTotal(){
//        return 0;
//    }
//    public String getTotalCurrencyFormat(){
//        return null;
//    }
    
    public Long getLineItemID() {
        return lineItemID;
    }

    public Shirt getProduct() {
        return product;
    }

    public void setProduct(Shirt product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPriceUnit() {
        return priceUnit;
    }

    public void setPriceUnit(double priceUnit) {
        this.priceUnit = priceUnit;
    }
    
    public double getAmount(){
        return priceUnit * quantity;
    }
}
