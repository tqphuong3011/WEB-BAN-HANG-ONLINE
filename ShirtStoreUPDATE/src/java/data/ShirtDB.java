/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import business.Category;
import business.LineItem;
import business.Shirt;

/**
 *
 * @author phuqu
 */
public class ShirtDB {

    public static void insertShirt(Shirt shirt) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(shirt);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
    }

    public static void updateShirt(Shirt shirt) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(shirt);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void deleteShirt(Shirt shirt) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            shirt = em.merge(shirt); // Ensure the object is in the managed state before removing
            em.remove(shirt);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void deleteLiShirt(LineItem li) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            li = em.merge(li); // Ensure the object is in the managed state before removing
            em.remove(li);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static List<Shirt> selectShirt() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT s from Shirt s";
        TypedQuery<Shirt> q = em.createQuery(qString, Shirt.class);
        List<Shirt> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null; //
        } finally {
            em.close();
        }

        return results;
    }

    public static List<Shirt> selectShirtByCategory(Category category) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            String qString = "SELECT s FROM Shirt s WHERE s.category = :category";
            TypedQuery<Shirt> query = em.createQuery(qString, Shirt.class);
            query.setParameter("category", category);
            return query.getResultList();
        } catch (NoResultException ex) {
            return null;
        } finally {
            em.close();
        }
    }

    public static void deleteShirtById(int shirtId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();

        try {
            // Find the Shirt object by ID
            Shirt shirt = em.find(Shirt.class, shirtId);

            if (shirt != null) {
                em.remove(shirt); // Remove the found Shirt object
            }

            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static Shirt selectShirtById(int shirtId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            String qString = "SELECT s FROM Shirt s WHERE s.productID = :shirtId";
            TypedQuery<Shirt> query = em.createQuery(qString, Shirt.class);
            query.setParameter("shirtId", shirtId);

            return query.getSingleResult();
        } catch (NoResultException ex) {
            return null;
        } finally {
            em.close();
        }
    }

    public static List<Shirt> getShirtByPageCategory(Category category, int pageNumber, int pageSize) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        int offset = (pageNumber - 1) * pageSize;
        String qString = "SELECT s FROM Shirt s WHERE s.category = :category ORDER BY s.productID";
        TypedQuery<Shirt> q = em.createQuery(qString, Shirt.class);
        q.setFirstResult(offset);
        q.setMaxResults(pageSize);
        q.setParameter("category", category);
        List<Shirt> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null; //
        } finally {
            em.close();
        }
        return results;
    }

    public static List<Shirt> getShirtByPageSize(String size, int pageNumber, int pageSize) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        int offset = (pageNumber - 1) * pageSize;
        String qString = "SELECT s FROM Shirt s WHERE s.productSize = :size ORDER BY s.productID";
        TypedQuery<Shirt> q = em.createQuery(qString, Shirt.class);
        q.setFirstResult(offset);
        q.setMaxResults(pageSize);
        q.setParameter("size", size);
        List<Shirt> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null; //
        } finally {
            em.close();
        }
        return results;
    }

    public static List<Shirt> getShirtByPage(int pageNumber, int pageSize) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        int offset = (pageNumber - 1) * pageSize;
        String qString = "SELECT s FROM Shirt s ORDER BY s.productID";
        TypedQuery<Shirt> q = em.createQuery(qString, Shirt.class);
        q.setFirstResult(offset);
        q.setMaxResults(pageSize);
        List<Shirt> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null; //
        } finally {
            em.close();
        }
        return results;
    }

    public static long getProductCount() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            String qString = "SELECT COUNT(s) FROM Shirt s";
            TypedQuery<Long> q = em.createQuery(qString, Long.class);
            return q.getSingleResult();
        } finally {
            em.close();
        }
    }

    public static List<Shirt> searchShirtByName(String shirtName) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < shirtName.length(); i++) {
                sb.append(shirtName.charAt(i));
                if (i < shirtName.length() - 1) {
                    sb.append("%");
                }
            }

            String output = sb.toString();
            String qString = "SELECT s FROM Shirt s WHERE LOWER(s.productName) LIKE :shirtName";
            TypedQuery<Shirt> query = em.createQuery(qString, Shirt.class);
            query.setParameter("shirtName", "%" + output.toLowerCase() + "%");

            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public static List<Shirt> searchShirtBySize(String size) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            String qString = "SELECT s FROM Shirt s WHERE s.productSize = :size";
            TypedQuery<Shirt> query = em.createQuery(qString, Shirt.class);
            query.setParameter("size", size); // Sử dụng toán tử LIKE và thêm % để tìm kiếm theo phần của tên giày

            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public static List<Shirt> getTopProducts(int top) {
        if (top <= 0) {
            // Xử lý trường hợp top không hợp lệ (ví dụ: âm hoặc bằng 0)
            return null;
        }

        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            String qString = "SELECT s FROM Shirt s ORDER BY s.productID DESC";
            TypedQuery<Shirt> query = em.createQuery(qString, Shirt.class);
            query.setMaxResults(top); // Số lượng kết quả trả về là top

            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public static List<Shirt> getTopNewProductNext(int top, int offset) {
        if (top <= 0 || offset < 0) {
            return null;
        }

        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            String qString = "SELECT s FROM Shirt s ORDER BY s.productID DESC";
            TypedQuery<Shirt> query = em.createQuery(qString, Shirt.class);
            query.setFirstResult(offset); // Đặt vị trí bắt đầu từ offset
            query.setMaxResults(top);     // Số lượng kết quả trả về là top

            return query.getResultList();
        } finally {
            em.close();
        }
    }

    // New method to get the top n best-selling shirt
    public static List<Shirt> getTopBestSellingShirt(int top) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT li.product, SUM(li.quantity) AS totalSold "
                + "FROM Invoice i "
                + "JOIN i.productList li "
                + "GROUP BY li.product "
                + "ORDER BY totalSold DESC";
        TypedQuery<Object[]> q = em.createQuery(qString, Object[].class).setMaxResults(top);
        List<Object[]> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null;
        } finally {
            em.close();
        }

        List<Shirt> topShirt = new ArrayList<>();
        for (Object[] row : results) {
            Shirt shirt = (Shirt) row[0];
            topShirt.add(shirt);
        }

        return topShirt;
    }

    public static List<Shirt> getTopBestSellingShirtNext(int top, int offset) {
        if (top <= 0 || offset < 0) {
            return null;
        }

        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT li.product, SUM(li.quantity) AS totalSold "
                + "FROM Invoice i "
                + "JOIN i.productList li "
                + "GROUP BY li.product "
                + "ORDER BY totalSold DESC";
        TypedQuery<Object[]> q = em.createQuery(qString, Object[].class);
        q.setFirstResult(offset); // Đặt vị trí bắt đầu từ offset
        q.setMaxResults(top);     // Số lượng kết quả trả về là top
        List<Object[]> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null;
        } finally {
            em.close();
        }

        List<Shirt> topShirt = new ArrayList<>();
        for (Object[] row : results) {
            Shirt shirt = (Shirt) row[0];
            topShirt.add(shirt);
        }

        return topShirt;
    }

    public static List<Shirt> getTopNewBrand(int top, int categoryID) {
        if (top <= 0) {
            // Xử lý trường hợp top không hợp lệ (ví dụ: âm hoặc bằng 0)
            return null;
        }

        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            String qString = "SELECT s FROM Shirt s WHERE s.category.categoryID = :categoryID ORDER BY s.productID DESC";
            TypedQuery<Shirt> query = em.createQuery(qString, Shirt.class);
            query.setParameter("categoryID", categoryID);
            query.setMaxResults(top); // Số lượng kết quả trả về là top

            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public static List<Shirt> getTopNewBrandNext(int top, int offset, int categoryID) {
        if (top <= 0) {
            // Xử lý trường hợp top không hợp lệ (ví dụ: âm hoặc bằng 0)
            return null;
        }

        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            String qString = "SELECT s FROM Shirt s WHERE s.category.categoryID = :categoryID ORDER BY s.productID DESC";
            TypedQuery<Shirt> query = em.createQuery(qString, Shirt.class);
            query.setParameter("categoryID", categoryID);
            query.setFirstResult(offset); // Đặt vị trí bắt đầu từ offset
            query.setMaxResults(top);     // Số lượng kết quả trả về là top

            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public static List<Shirt> getShirtByPrice(Long minPrice, Long maxPrice) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT s FROM Shirt s WHERE s.productPrice BETWEEN :minPrice AND :maxPrice ORDER BY s.productID";
        TypedQuery<Shirt> q = em.createQuery(qString, Shirt.class);
        q.setParameter("minPrice", minPrice);
        q.setParameter("maxPrice", maxPrice);
        List<Shirt> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null; //
        } finally {
            em.close();
        }
        return results;
    }

    public static List<Shirt> getShirtByPagePrice(Long minPrice, Long maxPrice, int pageNumber, int pageSize) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        int offset = (pageNumber - 1) * pageSize;
        String qString = "SELECT s FROM Shirt s WHERE s.productPrice BETWEEN :minPrice AND :maxPrice ORDER BY s.productID";
        TypedQuery<Shirt> q = em.createQuery(qString, Shirt.class);
        q.setFirstResult(offset);
        q.setMaxResults(pageSize);
        q.setParameter("minPrice", minPrice);
        q.setParameter("maxPrice", maxPrice);
        List<Shirt> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null; //
        } finally {
            em.close();
        }
        return results;
    }
  
    public static void main(String[] args) {

        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            String qString = "SELECT s FROM Shirt s WHERE s.productID IN (SELECT MIN(s2.productID) FROM Shirt s2 GROUP BY s2.productName)";
            TypedQuery<Shirt> query = em.createQuery(qString, Shirt.class);
            List<Shirt> shirts = query.getResultList();
            shirts.forEach(shirt -> System.out.println(shirt.getProductName() + ", " + shirt.getProductID()));
        } finally {
            em.close();
        }
    }
}
