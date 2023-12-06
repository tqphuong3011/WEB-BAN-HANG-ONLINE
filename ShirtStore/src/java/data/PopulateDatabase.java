/* If the Products table in the music_jpa database doesn't contain any records,
 * you can use this class to populate the Product table.
 *
 * To do this in NetBeans, press SHIFT+F6
 * while in this window, or right click and select Run File. It is normal for
 * it to take a few minutes to run.
 *
 * After you have done this, you will want to change the
 * javax.persistence.schema-generation.database.action value in the
 * persistence.xml file to "none". Otherwise, the application will pause for
 * two or three minutes each time you start it when it first makes a database
 * call.
 */
package data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.spi.PersistenceUnitTransactionType;
import static org.eclipse.persistence.config.EntityManagerProperties.JDBC_DRIVER;
import static org.eclipse.persistence.config.EntityManagerProperties.JDBC_PASSWORD;
import static org.eclipse.persistence.config.EntityManagerProperties.JDBC_URL;
import static org.eclipse.persistence.config.EntityManagerProperties.JDBC_USER;
import static org.eclipse.persistence.config.PersistenceUnitProperties.TARGET_SERVER;
import static org.eclipse.persistence.config.PersistenceUnitProperties.TRANSACTION_TYPE;
import org.eclipse.persistence.config.TargetServer;
import business.Cart;
import business.Category;
import business.Invoice;
import business.LineItem;
import business.PromotionCode;
import business.Shirt;
import business.User;
import business.sImage;

public class PopulateDatabase {

    private static EntityManagerFactory emf;

    public static void insertShirt(Shirt shirt) {
        EntityManager em = emf.createEntityManager();
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

    public static void insertCategory(Category category) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(category);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
    }

    public static void insert(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(user);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
    }

    public static void insert(PromotionCode promotion) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(promotion);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
    }

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

    public static void main(String[] args) {
        Map props = new HashMap();
        props.put(TRANSACTION_TYPE,PersistenceUnitTransactionType.RESOURCE_LOCAL.name());
        props.put(JDBC_DRIVER, "com.mysql.cj.jdbc.Driver");
        props.put(JDBC_URL,"jdbc:mysql://localhost:3306/shirt_jpa");
        props.put(JDBC_USER, "root");
        props.put(JDBC_PASSWORD, "root");
        props.put(TARGET_SERVER, TargetServer.None);
        
//        org.postgresql.Driver
//        com.mysql.cj.jdbc.Driver
//        jdbc:postgresql://dpg-clkvflcjtl8s73f3u9l0-a.singapore-postgres.render.com/shirt_jpa
//        jdbc:mysql://localhost:3306/shirt_jpa
//        dfFkTLaFbXylyqVfmhes3Iiyoyb3j7Md
//        abc123
        

        emf = Persistence.createEntityManagerFactory("shirtStorePU", props);

        // Thêm admin
        User user1 = new User((long) 1, "admin@gmail.com", "123456", "admin", "", "0342609928", 1, new Cart());
        insert(user1);
        // Nhân bản user2 thành 20 đối tượng mới
        for (int i = 2; i <= 21; i++) {
            User newUser;
            newUser = new User((long) i, "abc" + i + "@gmail.com","123456","Van A","Nguyen","0342609928",0,new Cart());
            insert(newUser);
        }
        Category airJordanCategory = new Category();
        airJordanCategory.setCategoryName("T-Shirt");
        airJordanCategory.setCategoryID(51);

        Category adidasCategory = new Category();
        adidasCategory.setCategoryName("Trousers");
        adidasCategory.setCategoryID(52);

        Category asicsCategory = new Category();
        asicsCategory.setCategoryName("Long T-shirt");
        asicsCategory.setCategoryID(53);

        Category converseCategory = new Category();
        converseCategory.setCategoryName("Polo");
        converseCategory.setCategoryID(54);

        Category newBalanceCategory = new Category();
        newBalanceCategory.setCategoryName("Shorts");
        newBalanceCategory.setCategoryID(55);

        insertCategory(airJordanCategory);
        insertCategory(adidasCategory);
        insertCategory(asicsCategory);
        insertCategory(converseCategory);
        insertCategory(newBalanceCategory);
        
        Shirt shirt1 = new Shirt();
        shirt1.setProductName("Áo Thun Cổ Tròn Tay Ngắn Vải Cotton");
        shirt1.setCategory(airJordanCategory);
        shirt1.setProductSize("L");
        shirt1.setProductColor("Black/White");
        shirt1.setProductDecription("The Jordan 11 Retro Gratitude / Defining Moments (2023) is a nod to the illustrious heritage encapsulated in the Jordan brand. This iconic Jordan 11 model resurfaces with a touch of the famous Defining Moments colorway.");
        shirt1.setProductPrice(271L);
        sImage image1 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Low-Wolf-Grey-W/Images/Air-Jordan-1-Low-Wolf-Grey-W/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1635258914&h=384&q=57");
        sImage image2 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Low-Wolf-Grey-W/Images/Air-Jordan-1-Low-Wolf-Grey-W/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1635258914&h=384&q=57");
        sImage image3 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Low-Wolf-Grey-W/Images/Air-Jordan-1-Low-Wolf-Grey-W/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1635258914&h=384&q=57");
        List<sImage> images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt1.setImages(images);
        insertShirt(shirt1);

        Shirt shirt2 = new Shirt();
        shirt2.setProductName("Jordan 4 Retro SE Craft Medium Olive");
        shirt2.setCategory(airJordanCategory);
        shirt2.setProductSize("L");
        shirt2.setProductColor("MEDIUM OLIVE/PALE VANILLA/KHAKI/BLACK/SAIL");
        shirt2.setProductDecription("Step into the season with the Jordan 4 Retro SE Craft in Medium Olive. This fresh take on a classic silhouette combines modern craftsmanship with a timeless design.");
        shirt2.setProductPrice(210L);
        image1 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Low-Wolf-Grey-W/Images/Air-Jordan-1-Low-Wolf-Grey-W/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1635258914&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/Air-Jordan-4-Retro-SE-Craft-Medium-Olive/Images/Air-Jordan-4-Retro-SE-Craft-Medium-Olive/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1700036889&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/Air-Jordan-4-Retro-SE-Craft-Medium-Olive/Images/Air-Jordan-4-Retro-SE-Craft-Medium-Olive/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1700036889&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt2.setImages(images);
        insertShirt(shirt2);

        Shirt shirt3 = new Shirt();
        shirt3.setProductName("Jordan 1 Low Wolf Grey (Women's)");
        shirt3.setCategory(airJordanCategory);
        shirt3.setProductSize("L");
        shirt3.setProductColor("WHITE/WOLF GREY-ALUMINIUM");
        shirt3.setProductDecription("The women's Jordan 1 Low Wolf Grey (W) features a white leather upper with Wolf Grey Durabuck overlays and Swooshes.");
        shirt3.setProductPrice(129L);
        image1 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Low-Wolf-Grey-W/Images/Air-Jordan-1-Low-Wolf-Grey-W/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1635258914&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Low-Wolf-Grey-W/Images/Air-Jordan-1-Low-Wolf-Grey-W/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1635258914&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Low-Wolf-Grey-W/Images/Air-Jordan-1-Low-Wolf-Grey-W/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1635258914&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt3.setImages(images);
        insertShirt(shirt3);

        Shirt shirt4 = new Shirt();
        shirt4.setProductName("Jordan 1 Retro High OG UNC Toe");
        shirt4.setCategory(airJordanCategory);
        shirt4.setProductSize("L");
        shirt4.setProductColor("UNIVERSITY BLUE/BLACK/WHITE");
        shirt4.setProductDecription("The Jordan 1 High OG UNC Toe is taking the sneaker game by storm. Jordan Brand masterfully integrates a unique colorway combo of University Blue, Black, and White on this iconic silhouette.");
        shirt4.setProductPrice(157L);
        image1 = new sImage("https://images.stockx.com/360/Air-Jordan-1-High-OG-UNC-Toe/Images/Air-Jordan-1-High-OG-UNC-Toe/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1688674754&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/Air-Jordan-1-High-OG-UNC-Toe/Images/Air-Jordan-1-High-OG-UNC-Toe/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1688674754&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/Air-Jordan-1-High-OG-UNC-Toe/Images/Air-Jordan-1-High-OG-UNC-Toe/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1688674754&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt4.setImages(images);
        insertShirt(shirt4);

        Shirt shirt5 = new Shirt();
        shirt5.setProductName("Jordan 4 Retro Thunder (2023)");
        shirt5.setCategory(airJordanCategory);
        shirt5.setProductSize("L");
        shirt5.setProductColor("BLACK/TOUR YELLOW");
        shirt5.setProductDecription("For the first time in over a decade, the Air Jordan 4 Retro Thunder is returning and is being featured as part of the Jordan Brand Spring/Summer 2023 campaign.");
        shirt5.setProductPrice(186L);
        image1 = new sImage("https://images.stockx.com/360/Air-Jordan-4-Retro-Thunder-2023/Images/Air-Jordan-4-Retro-Thunder-2023/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1680207753&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/Air-Jordan-4-Retro-Thunder-2023/Images/Air-Jordan-4-Retro-Thunder-2023/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1680207753&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/Air-Jordan-4-Retro-Thunder-2023/Images/Air-Jordan-4-Retro-Thunder-2023/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1680207753&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt5.setImages(images);
        insertShirt(shirt5);

        Shirt shirt6 = new Shirt();
        shirt6.setProductName("Jordan 5 Retro A Ma Maniére Dawn");
        shirt6.setCategory(airJordanCategory);
        shirt6.setProductSize("L");
        shirt6.setProductColor("PHOTON DUST/BLACK/DIFFUSED BLUE/PALE IVORY");
        shirt6.setProductDecription("Step into the dawn of a new era with the exclusive A Ma Maniére x Air Jordan 5 \"Dawn\". This collaboration infuses classic elegance with a street-ready edge.");
        shirt6.setProductPrice(171L);
        image1 = new sImage("https://images.stockx.com/360/Air-Jordan-5-Retro-A-Ma-Maniere-Diffused-Blue-Womens/Images/Air-Jordan-5-Retro-A-Ma-Maniere-Diffused-Blue-Womens/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1700083206&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/Air-Jordan-5-Retro-A-Ma-Maniere-Diffused-Blue-Womens/Images/Air-Jordan-5-Retro-A-Ma-Maniere-Diffused-Blue-Womens/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1700083206&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/Air-Jordan-5-Retro-A-Ma-Maniere-Diffused-Blue-Womens/Images/Air-Jordan-5-Retro-A-Ma-Maniere-Diffused-Blue-Womens/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1700083206&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt6.setImages(images);
        insertShirt(shirt6);

        Shirt shirt7 = new Shirt();
        shirt7.setProductName("Jordan 1 Retro High OG Royal Reimagined");
        shirt7.setCategory(airJordanCategory);
        shirt7.setProductSize("L");
        shirt7.setProductColor("BLACK/ROYAL BLUE/WHITE");
        shirt7.setProductDecription("Old meets the new with the Jordan 1 Retro High OG 'Royal Reimagined'.");
        shirt7.setProductPrice(106L);
        image1 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Retro-High-OG-Royal-Reimagined/Images/Air-Jordan-1-Retro-High-OG-Royal-Reimagined/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1697743198&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Retro-High-OG-Royal-Reimagined/Images/Air-Jordan-1-Retro-High-OG-Royal-Reimagined/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1697743198&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Retro-High-OG-Royal-Reimagined/Images/Air-Jordan-1-Retro-High-OG-Royal-Reimagined/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1697743198&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt7.setImages(images);
        insertShirt(shirt7);

        Shirt shirt8 = new Shirt();
        shirt8.setProductName("Jordan 4 Retro Frozen Moments (Women's)");
        shirt8.setCategory(airJordanCategory);
        shirt8.setProductSize("L");
        shirt8.setProductColor("LIGHT IRON ORE/SAIL-NEUTRAL GREY-BLACK-METALLIC SILVER");
        shirt8.setProductDecription("The Jordan 4 Retro Frozen Moments made its debut on August 26, 2023. Cementing itself as a must-have, this iteration of the Jordan legacy showcased a balanced new design palette.");
        shirt8.setProductPrice(221L);
        image1 = new sImage("https://images.stockx.com/360/Air-Jordan-4-Retro-Frozen-Moments-Womens/Images/Air-Jordan-4-Retro-Frozen-Moments-Womens/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1692624367&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/Air-Jordan-4-Retro-Frozen-Moments-Womens/Images/Air-Jordan-4-Retro-Frozen-Moments-Womens/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1692624367&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/Air-Jordan-4-Retro-Frozen-Moments-Womens/Images/Air-Jordan-4-Retro-Frozen-Moments-Womens/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1692624367&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt8.setImages(images);
        insertShirt(shirt8);

        Shirt shirt9 = new Shirt();
        shirt9.setProductName("Jordan 4 Retro Red Cement (GS)");
        shirt9.setCategory(airJordanCategory);
        shirt9.setProductSize("L");
        shirt9.setProductColor("WHITE/FIRE RED/BLACK/NEUTRAL GREY");
        shirt9.setProductDecription("The Jordan 4 Retro Red Cement (GS) presents a fusion of colors, textures, shapes, and materials that will make any grade school kid wearing this sneaker the talk of the playground.");
        shirt9.setProductPrice(127L);
        image1 = new sImage("https://images.stockx.com/360/Air-Jordan-4-Retro-Red-Cement-GS/Images/Air-Jordan-4-Retro-Red-Cement-GS/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1692987915&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/Air-Jordan-4-Retro-Red-Cement-GS/Images/Air-Jordan-4-Retro-Red-Cement-GS/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1692987915&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/Air-Jordan-4-Retro-Red-Cement-GS/Images/Air-Jordan-4-Retro-Red-Cement-GS/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1692987915&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt9.setImages(images);
        insertShirt(shirt9);

        Shirt shirt10 = new Shirt();
        shirt10.setProductName("Jordan 8 Retro Playoffs (2023)");
        shirt10.setCategory(airJordanCategory);
        shirt10.setProductSize("L");
        shirt10.setProductColor("BLACK/TRUE RED-WHITE");
        shirt10.setProductDecription("Introducing a legend reborn: the Jordan 8 Retro Playoffs. Cloaked in a sophisticated Black, True Red, and White colorway.");
        shirt10.setProductPrice(192L);
        image1 = new sImage("https://images.stockx.com/360/Air-Jordan-8-Retro-Playoffs-20203/Images/Air-Jordan-8-Retro-Playoffs-20203/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1696577110&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/Air-Jordan-8-Retro-Playoffs-20203/Images/Air-Jordan-8-Retro-Playoffs-20203/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1696577110&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/Air-Jordan-8-Retro-Playoffs-20203/Images/Air-Jordan-8-Retro-Playoffs-20203/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1696577110&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt10.setImages(images);
        insertShirt(shirt10);

        Shirt shirt11 = new Shirt();
        shirt11.setProductName("Jordan 1 Retro High OG Spider-Man");
        shirt11.setCategory(airJordanCategory);
        shirt11.setProductSize("L");
        shirt11.setProductColor("UNIVERSITY RED/BLACK/WHITE");
        shirt11.setProductDecription("Nike and Jordan Brand are returning back to the Spider-Verse for their second Spider-Man themed Air Jordan 1, with the release of the Air Jordan 1 High OG Spider-Man Across the Spider-Verse.");
        shirt11.setProductPrice(125L);
        image1 = new sImage("https://images.stockx.com/360/Air-Jordan-1-High-OG-Spider-Man-Across-the-Spider-Verse/Images/Air-Jordan-1-High-OG-Spider-Man-Across-the-Spider-Verse/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1683569460&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/Air-Jordan-1-High-OG-Spider-Man-Across-the-Spider-Verse/Images/Air-Jordan-1-High-OG-Spider-Man-Across-the-Spider-Verse/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1683569460&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/Air-Jordan-1-High-OG-Spider-Man-Across-the-Spider-Verse/Images/Air-Jordan-1-High-OG-Spider-Man-Across-the-Spider-Verse/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1683569460&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt11.setImages(images);
        insertShirt(shirt11);

        Shirt shirt12 = new Shirt();
        shirt12.setProductName("Jordan 1 Retro High OG Satin Bred");
        shirt12.setCategory(airJordanCategory);
        shirt12.setProductSize("L");
        shirt12.setProductColor("BLACK/UNIVERSITY RED/WHITE");
        shirt12.setProductDecription("Unveiling the epitome of timeless design with the Jordan 1 Retro High OG Satin Bred (Women's) in the ever-classic Black/University Red/White colorway.");
        shirt12.setProductPrice(85L);
        image1 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Retro-High-OG-Satin-Bred/Images/Air-Jordan-1-Retro-High-OG-Satin-Bred/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1696969279&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Retro-High-OG-Satin-Bred/Images/Air-Jordan-1-Retro-High-OG-Satin-Bred/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1696969279&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/Air-Jordan-1-Retro-High-OG-Satin-Bred/Images/Air-Jordan-1-Retro-High-OG-Satin-Bred/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1696969279&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt12.setImages(images);
        insertShirt(shirt12);

        //Add Adidas Shirt
        Shirt shirt13 = new Shirt();
        shirt13.setProductName("adidas Yeezy Slide Onyx (2022/2023)");
        shirt13.setCategory(adidasCategory);
        shirt13.setProductSize("L");
        shirt13.setProductColor("BLACK/WHITE");
        shirt13.setProductDecription("First revealed in February 2022 at the Donda 2 listening event in Miami, the adidas Yeezy Slide Onyx features an all-black foam construction with a soft footbed for comfort.");
        shirt13.setProductPrice(108L);
        image1 = new sImage("https://images.stockx.com/360/adidas-Yeezy-Slide-Black/Images/adidas-Yeezy-Slide-Black/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1646687558&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/adidas-Yeezy-Slide-Black/Images/adidas-Yeezy-Slide-Black/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1646687558&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/adidas-Yeezy-Slide-Black/Images/adidas-Yeezy-Slide-Black/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1646687558&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt13.setImages(images);
        insertShirt(shirt13);
        
        Shirt shirt14 = new Shirt();
        shirt14.setProductName("adidas Yeezy Slide Bone (2022/2023)");
        shirt14.setCategory(adidasCategory);
        shirt14.setProductSize("L");
        shirt14.setProductColor("BONE/BONE/BONE");
        shirt14.setProductDecription("The adidas Yeezy Slide Bone (Restock Pair) features a slightly different composition than the original adidas Yeezy Slide Bone that debuted in the fall of 2019.");
        shirt14.setProductPrice(150L);
        image1 = new sImage("https://images.stockx.com/360/adidas-Yeezy-Slide-Bone-2022/Images/adidas-Yeezy-Slide-Bone-2022/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1660144762&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/adidas-Yeezy-Slide-Bone-2022/Images/adidas-Yeezy-Slide-Bone-2022/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1660144762&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/adidas-Yeezy-Slide-Bone-2022/Images/adidas-Yeezy-Slide-Bone-2022/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1660144762&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt14.setImages(images);
        insertShirt(shirt14);
        
        Shirt shirt15 = new Shirt();
        shirt15.setProductName("adidas Samba OG Cloud White");
        shirt15.setCategory(adidasCategory);
        shirt15.setProductSize("L");
        shirt15.setProductColor("CLOUD WHITE/CORE BLACK/CLEAR GRANITE");
        shirt15.setProductDecription("Originally designed to protect soccer players’ feet during winter, the adidas Samba OG Cloud White Core Black has transcended its sports function but still maintains its aesthetic appeal.");
        shirt15.setProductPrice(79L);
        image1 = new sImage("https://images.stockx.com/360/adidas-Samba-OG-Cloud-White-Core-Black/Images/adidas-Samba-OG-Cloud-White-Core-Black/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1687245728&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/adidas-Samba-OG-Cloud-White-Core-Black/Images/adidas-Samba-OG-Cloud-White-Core-Black/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1687245728&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/adidas-Samba-OG-Cloud-White-Core-Black/Images/adidas-Samba-OG-Cloud-White-Core-Black/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1687245728&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt15.setImages(images);
        insertShirt(shirt15);
        
        Shirt shirt16 = new Shirt();
        shirt16.setProductName("adidas Yeezy Boost 350 V2 Onyx");
        shirt16.setCategory(adidasCategory);
        shirt16.setProductSize("L");
        shirt16.setProductColor("BLACK");
        shirt16.setProductDecription("With a triple black Primeknit upper, the adidas Yeezy 350 V2 Onyx takes it back to the basics, using its muted palette to emphasize the intricacies of its construction.");
        shirt16.setProductPrice(240L);
        image1 = new sImage("https://images.stockx.com/360/adidas-Yeezy-Boost-350-V2-Onyx/Images/adidas-Yeezy-Boost-350-V2-Onyx/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1656426794&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/adidas-Yeezy-Boost-350-V2-Onyx/Images/adidas-Yeezy-Boost-350-V2-Onyx/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1656426794&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/adidas-Yeezy-Boost-350-V2-Onyx/Images/adidas-Yeezy-Boost-350-V2-Onyx/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1656426794&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt16.setImages(images);
        insertShirt(shirt16);
        
        Shirt shirt17 = new Shirt();
        shirt17.setProductName("adidas Campus 00s Dark Green");
        shirt17.setCategory(adidasCategory);
        shirt17.setProductSize("L");
        shirt17.setProductColor("DARK GREEN/CLOUD WHITE/OFF WHITE");
        shirt17.setProductDecription("The adidas Campus 00s Dark Green Cloud White comes in a dark green, cloud white, and off-white color scheme.");
        shirt17.setProductPrice(84L);
        image1 = new sImage("https://images.stockx.com/360/adidas-Campus-00s-Dark-Green-Cloud-White/Images/adidas-Campus-00s-Dark-Green-Cloud-White/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1683710681&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/adidas-Campus-00s-Dark-Green-Cloud-White/Images/adidas-Campus-00s-Dark-Green-Cloud-White/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1683710681&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/adidas-Campus-00s-Dark-Green-Cloud-White/Images/adidas-Campus-00s-Dark-Green-Cloud-White/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1683710681&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt17.setImages(images);
        insertShirt(shirt17);
        
        Shirt shirt18 = new Shirt();
        shirt18.setProductName("adidas Response CL Bad Bunny");
        shirt18.setCategory(adidasCategory);
        shirt18.setProductSize("L");
        shirt18.setProductColor("ECRU TINT/BRONZE STRATA/EARTH STRATA");
        shirt18.setProductDecription("The adidas Response CL Bad Bunny Paso Fino is part of a collaboration between adidas and the Puerto Rican singer Bad Bunny.");
        shirt18.setProductPrice(113L);
        image1 = new sImage("https://images.stockx.com/360/adidas-Response-CL-Bad-Bunny-Paso-Fino/Images/adidas-Response-CL-Bad-Bunny-Paso-Fino/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1697117224&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/adidas-Response-CL-Bad-Bunny-Paso-Fino/Images/adidas-Response-CL-Bad-Bunny-Paso-Fino/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1697117224&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/adidas-Response-CL-Bad-Bunny-Paso-Fino/Images/adidas-Response-CL-Bad-Bunny-Paso-Fino/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1697117224&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt18.setImages(images);
        insertShirt(shirt18);
        
        Shirt shirt19 = new Shirt();
        shirt19.setProductName("adidas Campus 00s Crystal White");
        shirt19.setCategory(adidasCategory);
        shirt19.setProductSize("L");
        shirt19.setProductColor("CRYSTAL WHITE/CORE BLACK/OFF WHITE");
        shirt19.setProductDecription("The adidas Campus 00s in Crystal White Core Black (Women) is a chunky sneaker with a design inspired by retro skate culture.");
        shirt19.setProductPrice(81L);
        image1 = new sImage("https://images.stockx.com/360/adidas-Campus-00s-Crystal-White-Core-Black/Images/adidas-Campus-00s-Crystal-White-Core-Black/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1690385196&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/adidas-Campus-00s-Crystal-White-Core-Black/Images/adidas-Campus-00s-Crystal-White-Core-Black/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1690385196&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/adidas-Campus-00s-Crystal-White-Core-Black/Images/adidas-Campus-00s-Crystal-White-Core-Black/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1690385196&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt19.setImages(images);
        insertShirt(shirt19);
        
        Shirt shirt20 = new Shirt();
        shirt20.setProductName("adidas Gazelle Bold Magic Beige");
        shirt20.setCategory(adidasCategory);
        shirt20.setProductSize("L");
        shirt20.setProductColor("CREAM WHITE/COLLEGIATE GREEN/MAGIC BEIGE");
        shirt20.setProductDecription("The adidas Gazelle Bold Magic Beige Collegiate Green Women’s combines neutral colors and the brand’s classic Gazelle style.");
        shirt20.setProductPrice(108L);
        image1 = new sImage("https://images.stockx.com/360/adidas-Gazelle-Bold-Magic-Beige-Collegiate-Green-Womens/Images/adidas-Gazelle-Bold-Magic-Beige-Collegiate-Green-Womens/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1694719506&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/adidas-Gazelle-Bold-Magic-Beige-Collegiate-Green-Womens/Images/adidas-Gazelle-Bold-Magic-Beige-Collegiate-Green-Womens/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1694719506&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/adidas-Gazelle-Bold-Magic-Beige-Collegiate-Green-Womens/Images/adidas-Gazelle-Bold-Magic-Beige-Collegiate-Green-Womens/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1694719506&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt20.setImages(images);
        insertShirt(shirt20);
        
        Shirt shirt21 = new Shirt();
        shirt21.setProductName("adidas Forum Low The Simpsons");
        shirt21.setCategory(adidasCategory);
        shirt21.setProductSize("L");
        shirt21.setProductColor("MESA/TACTILE ROSE/CLOUD WHITE");
        shirt21.setProductDecription("The adidas Forum Low The Simpsons Living Room sneaker is a whimsical tribute to the beloved TV series.");
        shirt21.setProductPrice(105L);
        image1 = new sImage("https://images.stockx.com/360/adidas-Forum-Low-The-Simpsons-Living-Room/Images/adidas-Forum-Low-The-Simpsons-Living-Room/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1699291089&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/adidas-Forum-Low-The-Simpsons-Living-Room/Images/adidas-Forum-Low-The-Simpsons-Living-Room/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1699291089&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/adidas-Forum-Low-The-Simpsons-Living-Room/Images/adidas-Forum-Low-The-Simpsons-Living-Room/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1699291089&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt21.setImages(images);
        insertShirt(shirt21);
        
        Shirt shirt22 = new Shirt();
        shirt22.setProductName("adidas Yeezy Boost 350 V2 MX");
        shirt22.setCategory(adidasCategory);
        shirt22.setProductSize("L");
        shirt22.setProductColor("BLACK");
        shirt22.setProductDecription("Released on August 21, 2023, the adidas Yeezy Boost 350 V2 MX Dark Salt is more than just a sneaker; it's a statement in style and comfort.");
        shirt22.setProductPrice(271L);
        image1 = new sImage("https://images.stockx.com/360/adidas-Yeezy-Boost-350-V2-MX-Dark-Salt/Images/adidas-Yeezy-Boost-350-V2-MX-Dark-Salt/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1694442126&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/adidas-Yeezy-Boost-350-V2-MX-Dark-Salt/Images/adidas-Yeezy-Boost-350-V2-MX-Dark-Salt/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1694442126&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/adidas-Yeezy-Boost-350-V2-MX-Dark-Salt/Images/adidas-Yeezy-Boost-350-V2-MX-Dark-Salt/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1694442126&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt22.setImages(images);
        insertShirt(shirt22);
        
        Shirt shirt23 = new Shirt();
        shirt23.setProductName("adidas Samba OG Collegiate Green");
        shirt23.setCategory(adidasCategory);
        shirt23.setProductSize("L");
        shirt23.setProductColor("COLLEGIATE GREEN/FOOTWEAR WHITE/GUM");
        shirt23.setProductDecription("The adidas Samba OG Collegiate Green Gum Grey Toe is a modern take on the adidas Samba sneaker.");
        shirt23.setProductPrice(100L);
        image1 = new sImage("https://images.stockx.com/360/adidas-Samba-OG-Collegiate-Green-Gum-Grey-Toe/Images/adidas-Samba-OG-Collegiate-Green-Gum-Grey-Toe/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1684999471&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/adidas-Samba-OG-Collegiate-Green-Gum-Grey-Toe/Images/adidas-Samba-OG-Collegiate-Green-Gum-Grey-Toe/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1684999471&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/adidas-Samba-OG-Collegiate-Green-Gum-Grey-Toe/Images/adidas-Samba-OG-Collegiate-Green-Gum-Grey-Toe/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1684999471&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt23.setImages(images);
        insertShirt(shirt23);
        
        Shirt shirt24 = new Shirt();
        shirt24.setProductName("adidas adiFOM Superstar");
        shirt24.setCategory(adidasCategory);
        shirt24.setProductSize("L");
        shirt24.setProductColor("PANTONE/CLOUD WHITE/PANTONE");
        shirt24.setProductDecription("");
        shirt24.setProductPrice(100L);
        image1 = new sImage("https://images.stockx.com/360/adidas-adiFOM-Superstar-The-Simpsons-Clouds/Images/adidas-adiFOM-Superstar-The-Simpsons-Clouds/Lv2/img01.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1700248781&h=384&q=57");
        image2 = new sImage("https://images.stockx.com/360/adidas-adiFOM-Superstar-The-Simpsons-Clouds/Images/adidas-adiFOM-Superstar-The-Simpsons-Clouds/Lv2/img19.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1700248781&h=384&q=57");
        image3 = new sImage("https://images.stockx.com/360/adidas-adiFOM-Superstar-The-Simpsons-Clouds/Images/adidas-adiFOM-Superstar-The-Simpsons-Clouds/Lv2/img28.jpg?fm=webp&auto=compress&w=576&dpr=1&updated_at=1700248781&h=384&q=57");
        images = new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        shirt24.setImages(images);
        insertShirt(shirt24);
        
//        Shoes shirt13 = new Shoes();
//        shirt13.setProductName("");
//        shirt13.setCategory(airJordanCategory);
//        shirt13.setProductSize("L");
//        shirt13.setProductColor("");
//        shirt13.setProductDecription("");
//        shirt13.setProductPrice(271L);
//        image1 = new sImage("");
//        image2 = new sImage("");
//        image3 = new sImage("");
//        images = new ArrayList<>();
//        images.add(image1);
//        images.add(image2);
//        images.add(image3);
//        shirt13.setImages(images);
//        insertShirt(shirt13);
        
        
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        PromotionCode code1 = null;
        try {
            code1 = new PromotionCode("ABC123", 20.0, dateFormat.parse("2023-01-01"), dateFormat.parse("2023-12-31"));
            insert(code1);
            code1 = new PromotionCode("VIP123", 20.0, dateFormat.parse("2023-01-01"), dateFormat.parse("2023-12-31"));
            insert(code1);
            code1 = new PromotionCode("NAP123", 20.0, dateFormat.parse("2023-01-01"), dateFormat.parse("2023-12-31"));
            insert(code1);
            code1 = new PromotionCode("FIRST123", 20.0, dateFormat.parse("2023-01-01"), dateFormat.parse("2023-12-31"));
            insert(code1);
        } catch (ParseException ex) {
            Logger.getLogger(PopulateDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }

//        try {
////            List<LineItem> items = new ArrayList<>();
////            LineItem item = new LineItem(shirt1, 1, shirt1.getProductPrice());
////            items.add(item);
////            item = new LineItem(shirt3, 1, shirt3.getProductPrice());
////            items.add(item);
////            item = new LineItem(shirt5, 2, shirt5.getProductPrice());
////            items.add(item);
////            item = new LineItem(shirt7, 3, shirt7.getProductPrice());
////            items.add(item);
////            AddressInfo address = new AddressInfo("DK02", "Duong so 7", "Thu Duc", "HCM", "VietNam", "3333");
//////            PromotionCode code1 = new PromotionCode("ABC123", 20.0, dateFormat.parse("2023-01-01"), dateFormat.parse("2023-12-31"));
////            Invoice invoice;
////            invoice = new Invoice(user1, items, address, code1, "Card", dateFormat.parse("2023-01-01"), 1090, code1.getPromotionAmount(), 1070);
////            insert(invoice);
//
//        } catch (ParseException ex) {
//            Logger.getLogger(PopulateDatabase.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        try {
////            List<LineItem> items = new ArrayList<>();
////            LineItem item = new LineItem(shirt1, 1, shirt1.getProductPrice());
////            items.add(item);
////            item = new LineItem(shirt21, 1, shirt21.getProductPrice());
////            items.add(item);
////            item = new LineItem(shirt20, 2, shirt20.getProductPrice());
////            items.add(item);
////            item = new LineItem(shirt6, 3, shirt6.getProductPrice());
////            items.add(item);
////            AddressInfo address = new AddressInfo("DK02", "Duong so 7", "Thu Duc", "HCM", "VietNam", "3333");
//////            PromotionCode code1 = new PromotionCode("ABC123", 20.0, dateFormat.parse("2023-01-01"), dateFormat.parse("2023-12-31"));
////            Invoice invoice;
////            invoice = new Invoice(user1, items, address, code1, "Card", dateFormat.parse("2023-01-01"), 1090, code1.getPromotionAmount(), 1070);
////            insert(invoice);
//
//        } catch (ParseException ex) {
//            Logger.getLogger(PopulateDatabase.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }
}
