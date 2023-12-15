/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import business.Invoice;
import business.LineItem;
import business.PromotionCode;
import business.User;
import data.InvoiceDB;
import data.ShirtDB;
import data.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import util.EmailUtil;

/**
 *
 * @author admin
 */
@WebServlet(name = "LoadDetailInvoice", urlPatterns = {"/loaddetailinvoice","/buyShirt", "/reviewInvoice"})
public class LoadDetailInvoice extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String action = (String) request.getParameter("action");

        if (action.equals("buy")) {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            PromotionCode promotion = (PromotionCode) session.getAttribute("promotion");
            
            String firstName = (String) request.getParameter("firstName");
            String lastName = (String) request.getParameter("lastName");
            String email = (String) request.getParameter("email");
            String address = (String) request.getParameter("address");
            String city = (String) request.getParameter("city");
            String district = (String) request.getParameter("district");
            String paymentMethod = (String) request.getParameter("paymentMethod");

            String subTotalString = (String) request.getParameter("subTotal");
            Double subTotal = Double.valueOf(subTotalString);

            String discountString = (String) request.getParameter("discount");
            Double discount = Double.valueOf(discountString);

            String totalString = (String) request.getParameter("total");
            Double total = Double.valueOf(totalString);

            // Lấy thời gian hiện tại dưới dạng LocalDateTime
            LocalDateTime currentTime = LocalDateTime.now();
            // Ép kiểu LocalDateTime sang Date
            Date invoiceDate = Date.from(currentTime.atZone(ZoneId.systemDefault()).toInstant());

            List<LineItem> empty = new ArrayList<>();
            List<LineItem> productList = new ArrayList<>();
            productList = user.getCart().getProductList();
            user.getCart().setProductList(empty);
            for (LineItem i : user.getCart().getProductList()) {
                ShirtDB.deleteLiShirt(i);
            }
            UserDB.update(user);
            Invoice invoice = new Invoice();
            if (promotion == null) {
                invoice = new Invoice(user, productList, address, district, city, paymentMethod, invoiceDate, subTotal, discount, total);
            } else {
                invoice = new Invoice(user, productList, address, district, city, promotion, paymentMethod, invoiceDate, subTotal, discount, total);
            }

            InvoiceDB.insert(invoice);

            EmailUtil.sendEmail(email, "SOCKCOL INVOICE ",
                    "Hóa đơn cho " + firstName + " " + lastName + "<br>"
                    + "Địa chỉ: " + address + ", " + district + ", " + city + "<br>"
                    + "Phương thức thanh toán: " + paymentMethod + "<br>"
                    + "Tổng tiền trước giảm giá: " + subTotal + "$<br>"
                    + "Giảm giá: " + discount + "%<br>"
                    + "Tổng tiền sau giảm giá: " + total + "$");

            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("email", email);
            request.setAttribute("invoice", invoice);
            request.getRequestDispatcher("DetailedInvoice.jsp").forward(request, response);
        }
        else if (action.equals("review"))
        {
            String iidString = request.getParameter("iid");
            long invoiceID = Long.parseLong(iidString);

            Invoice invoice = new Invoice();
            invoice = InvoiceDB.getInvoiceById(invoiceID);
            
            request.setAttribute("firstName", invoice.getUser().getFirstName());
            request.setAttribute("lastName", invoice.getUser().getLastName());
            request.setAttribute("email", invoice.getUser().getEmail());
            request.setAttribute("invoice", invoice);
            request.getRequestDispatcher("DetailedInvoice.jsp").forward(request, response);
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
