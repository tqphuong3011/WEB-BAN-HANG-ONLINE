/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import controller.*;
import data.CategoryDB;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import business.Category;
import business.Shirt;
import business.User;
import data.ShirtDB;
import data.UserDB;

@WebServlet(name = "LoadProductDetail", urlPatterns = {"/loadProductDetail"})
public class LoadProductDetail extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String productID = request.getParameter("productID");
        Shirt detailShirt = ShirtDB.selectShirtById(Integer.parseInt(productID));
        List<Shirt> listShirt = ShirtDB.selectShirtByCategory(detailShirt.getCategory());
        request.setAttribute("detailShirt", detailShirt);
        request.setAttribute("listShirt", listShirt);
        request.getRequestDispatcher("/DetailProduct.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
