package controller;

import service.CategoryService;
import service.PostService;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminViewServlet", value = "/AdminViewServlet")
public class AdminViewServlet extends HttpServlet {

    private final UserService userService = UserService.Instance() ;

    private final CategoryService categoryService = new CategoryService();
    private  final PostService postService=PostService.getInstance();
    private String page="/adminView.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try{
            switch (action){
                case "dashboard":
                    request.setAttribute("memberOnline", userService.getUserOnline());
                    request.setAttribute("numberPost",userService.getPosts());
                    request.setAttribute("postsThisYear",userService.getPostsThisYear());
                    request.setAttribute("numberUser",userService.getUsers());
                    request.setAttribute("postLikeList",postService.findTablePostLike());
                    request.setAttribute("topTenAuthor", postService.findTableTopTenAuthor());
                    page = "/adminView.jsp";
                    break;
                case "users":
                    request.setAttribute("userList",userService.findAllUser(request,response));
                    page ="/users.jsp";
                    break;
                case "category":
                    request.setAttribute("categoryList", categoryService.findAllCategory(request,response));
                    page= "/category.jsp";
                    break;
                case "posts":
                    request.setAttribute("blogList",PostService.getInstance().findAllBlogs());
                    page="/blogs.jsp";
                    break;
                default:
                    page= "/adminView.jsp";
                    break;
            }
        }
        catch (SQLException e){
            System.out.println(e.getMessage());
        }
        doPost(request,response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }

//    private void displayAllUser(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("users.jsp");
//        ArrayList<User> users = userService.findAllUser(request,response);
//        request.setAttribute("users" , users);
//        requestDispatcher.forward(request , response);
//
//
//    }
}
