/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import business.Invoice;
import business.LineItem;
import business.Shirt;
import java.util.ArrayList;

import javax.persistence.EntityTransaction;

/**
 *
 * @author phuqu
 */
public class InvoiceDB {

    public static void insert(Invoice invoice) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(invoice);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
    }

    public static List<Invoice> selectsInvoices() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT i from Invoice i";
        TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);
        List<Invoice> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null; //
        } finally {
            em.close();
        }

        return results;
    }

    public static Invoice getInvoiceById(long invoiceID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            String qString = "SELECT i FROM Invoice i WHERE i.invoiceID = :invoiceID";
            TypedQuery<Invoice> query = em.createQuery(qString, Invoice.class);
            query.setParameter("invoiceID", invoiceID);

            return query.getSingleResult();
        } catch (NoResultException ex) {
            return null;
        } finally {
            em.close();
        }
    }

    public static void main(String[] args) {
//        EntityManager em = DBUtil.getEmFactory().createEntityManager();
//        List<LineItem> productList = new ArrayList<>();
//        productList = user.getCart().getProductList();
//        Invoice invoice = new Invoice();
//        invoice.setUser(user);
//        invoice.setAddress("123abc");
//        invoice.setDiscount(30);
//        invoice.setProductList(selectedLineItem);
//        invoice.setSubTotal(subTotal);
//        invoice.setTotal(total);
//        invoice.setPaymentMethod(paymentMethod);
//        invoice.setPromotion(promotion);
//        invoice.setInvoiceDate(currentDate);
//        try {
//            String qString = "SELECT s FROM Shirt s WHERE s.productID IN (SELECT MIN(s2.productID) FROM Shirt s2 GROUP BY s2.productName)";
//            TypedQuery<Shirt> query = em.createQuery(qString, Shirt.class);
//            List<Shirt> shirts = query.getResultList();
//            shirts.forEach(shirt -> System.out.println(shirt.getProductName() + ", " + shirt.getProductID()));
//        } finally {
//            em.close();
//        }
    }

}
