package controller;

import model.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SignUpServlet", value = "/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    UserService userService =new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action!=null){
            if(!signup(request, response)){
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");
                requestDispatcher.forward(request, response);
            }
        }
    }
    public boolean signup(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userEmail = req.getParameter("userEmail");
        String userPassword = req.getParameter("userPassword");
        String userRePassword = req.getParameter("userRePassword");
        if (!userRePassword.equals(userPassword)) {

            return false;
        }
        try {

            if(!userService.addUser(new User(userEmail,userPassword))) {
                return false;
            }
//            userDao.insertAccount(new Account(userName, birthdayUser, numberUser, mailUser, passwordUser, addressUser));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
        requestDispatcher.forward(req, resp);
        return true;
    }
}
