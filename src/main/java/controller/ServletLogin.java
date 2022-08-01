package controller;

import model.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletLogin", value = "/ServletLogin")
public class ServletLogin extends HttpServlet {
    private final UserService userService = new UserService();
    public static User user = new User();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "login":
                UserLogin(request,response);
                break;
            case "register":
                UserReister(request,response);
        }
    }

    private void UserReister(HttpServletRequest request, HttpServletResponse response) {

    }

    public void UserLogin(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String userEmail = request.getParameter("user-login");
        String userPassword = request.getParameter("password");
        user = userService.checkUserLogin(userEmail);
        boolean checkUser = true;
        boolean pass = false;
        if (user==null){
            checkUser = false;
        }else {
            if (userPassword.equals(user.getUserPassword())) {
                pass = true;
            }
        }
        request.setAttribute("userEmail",checkUser);
        request.setAttribute("checkPass",pass);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/userView.jsp");
        requestDispatcher.forward(request,response);

    }
}
