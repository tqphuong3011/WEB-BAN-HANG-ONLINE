/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import controller.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import business.Category;
import business.Shirt;
import business.User;
import data.CategoryDB;
import data.ShirtDB;
import data.UserDB;

/**
 *
 * @author phuqu
 */
@WebServlet(name = "SearchingAdmin", urlPatterns = {"/search"})
public class SearchingAdmin extends HttpServlet {

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
        String action = request.getParameter("action");
        if (action.equals("searchProduct")) {
            String keyword = request.getParameter("keyword");
            List<Shirt> listShirtAll = ShirtDB.searchShirtByName(keyword);

            // List Category for Add product
            List<Category> listCategories = CategoryDB.selectCategories();
            request.setAttribute("listCategories", listCategories);

            //for the first page
            String pageNumberString = request.getParameter("pageNumber");
            if (pageNumberString == null) {
                pageNumberString = "1";
            }

            //get pageNumber
            int pageNumber = Integer.parseInt(pageNumberString);
            int size = 5;   //default

            //get productCount of keyword
            int productCount = (int) listShirtAll.size();
            int endPage = productCount / size;
            if (productCount % size != 0) {
                endPage++;
            }

            //get offset
            int startIndex = (pageNumber - 1) * size;  //size product per page
            int endIndex = Math.min(startIndex + size, productCount);

            //get listShirt by pageNumber
            List<Shirt> listShirt;
            if (startIndex >= productCount || endIndex > productCount) {
                listShirt = null;
            } else {
                listShirt = listShirtAll.subList(startIndex, endIndex);
            }

            request.setAttribute("listShirt", listShirt);
            request.setAttribute("endPage", endPage);
            request.setAttribute("index", pageNumber);
            request.setAttribute("productCount", productCount);
            request.setAttribute("keyword", keyword);
            request.setAttribute("search", "search");
            request.getRequestDispatcher("/ManagerProduct.jsp").forward(request, response);
        } else if (action.equals("searchUser")) {
            String keyword = request.getParameter("keyword");
            List<User> listUserAll = UserDB.searchUserByEmail(keyword);

            // List Category for Add product
//            List<Category> listCategories = CategoryDB.selectCategories();
//            request.setAttribute("listCategories", listCategories);
            //for the first page
            String pageNumberString = request.getParameter("pageNumber");
            if (pageNumberString == null) {
                pageNumberString = "1";
            }

            //get pageNumber
            int pageNumber = Integer.parseInt(pageNumberString);
            int size = 10;   //default

            //get productCount of keyword
            int userCount = (int) listUserAll.size();
            int endPage = userCount / size;
            if (userCount % size != 0) {
                endPage++;
            }

            //get offset
            int startIndex = (pageNumber - 1) * size;  //size product per page
            int endIndex = Math.min(startIndex + size, userCount);

            //get listShirt by pageNumber
            List<User> listUser;
            if (startIndex >= userCount || endIndex > userCount) {
                listUser = null;
            } else {
                listUser = listUserAll.subList(startIndex, endIndex);
            }

            request.setAttribute("listUser", listUser);
            request.setAttribute("endPage", endPage);
            request.setAttribute("index", pageNumber);
            request.setAttribute("userCount", userCount);
            request.setAttribute("keyword", keyword);
            request.setAttribute("search", "search");
            request.getRequestDispatcher("/ManagerAccount.jsp").forward(request, response);
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
