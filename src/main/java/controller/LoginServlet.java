package controller;


import DAO.UserRepository;
import controller.Filter.FilterAdmin;
import controller.Filter.FilterUser;
import model.User;
import service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;


@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    UserService userService = UserService.Instance();




    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        RequestDispatcher requestDispatcher;
        switch (action) {
            case "logout":
                try{
                   boolean resultChange= userService.changeStatusUserOffline(FilterUser.userLogin);
                   boolean resultUpdate=userService.updateLastLogin();
                   if(!resultChange||!resultUpdate){
                       System.out.println("log out fail");
                       break;
                   }
                }catch (Exception e){
                    System.out.println(e.getMessage());
                }
                FilterUser.userLogin = null;
                FilterAdmin.user=null;
                requestDispatcher = req.getRequestDispatcher("login.jsp");
                requestDispatcher.forward(req, resp);
                break;
        }
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        String userEmail = req.getParameter("userEmail");
        String userPassword = req.getParameter("userPassword");
        if (userEmail.equals("admin") && userPassword.equals("admin")) {
            FilterAdmin.userAdmin=new User(userEmail,userPassword);
            resp.sendRedirect("viewAdmin");
        } else {
            if (checkAccountExit(userEmail,userPassword)) {
                resp.sendRedirect("viewUser");
            } else {
                String message = "Check password again !";
                req.setAttribute("message", message);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
                requestDispatcher.forward(req, resp);
            }
        }
    }


    public boolean checkAccountExit(String userEmail,String userPassword)  {
       try {
           User user = userService.findUserByEmailAndPassword(userEmail, userPassword);
           if (user != null) {
               FilterUser.userLogin = user;
               return true;
           }
       }catch (Exception e){
           System.err.println(e.getMessage());
       }
        return false;
    }

}
