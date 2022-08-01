package controller;

//import Controller.Filter.FilterAdmin;
//import Controller.Filter.FilterUser;
//import Dao.VeDao;
//import Service.AccountService;
//import Service.FilmService;
//import Service.VeService;

import model.Post;
import service.PostService;
import service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(urlPatterns = "/viewAdmin")
public class ViewAdmin extends HttpServlet {
    UserService userService=UserService.Instance();
    PostService postService=PostService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //lấy một số thông tin để load trang ban đầu
        req.setAttribute("memberOnline", userService.getUserOnline());
        req.setAttribute("numberPost",userService.getPosts());
        req.setAttribute("postsThisYear",userService.getPostsThisYear());
        req.setAttribute("numberUser",userService.getUsers());
        req.setAttribute("postLikeList", postService.findTablePostLike());
        req.setAttribute("topTenAuthor", postService.findTableTopTenAuthor());
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("adminView.jsp");
        requestDispatcher.forward(req, resp);
    }
}
