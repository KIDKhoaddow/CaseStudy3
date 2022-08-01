package controller;


import controller.Filter.FilterUser;
import model.User;
import service.PostService;
import service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/viewUser")
public class ViewUser extends HttpServlet {
    UserService userService=UserService.Instance();
    PostService postService=PostService.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //đẩy data lên vào trang chủ
        try{
            userService.changeStatusUserOnline(FilterUser.userLogin);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        int authorId = FilterUser.userLogin.getUserId();
        req.setAttribute("posts",postService.findAllBYUser(authorId));
        setUser(req);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/personal.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //đẩy data lên trên
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/ViewUser.jsp");
        requestDispatcher.forward(req,resp);
    }
    public void setUser(HttpServletRequest req)throws  ServletException{
        User user= FilterUser.userLogin;
        req.setAttribute("userName",user.getUserName());
        req.setAttribute("userAddress",user.getUserAddress());
        req.setAttribute("userPhone",user.getUserPhone());
        req.setAttribute("userAvatar",user.getUserAvatar());
        req.setAttribute("userDOB",user.getUserDOB());
        req.setAttribute("userEmail",user.getUserEmail());
        req.setAttribute("userRegisterDate",user.getUserRegisDate());
        req.setAttribute("userPassword",user.getUserPassword());
    }
}
