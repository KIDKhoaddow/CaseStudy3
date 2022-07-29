package controller;

import model.Post;
import service.PostService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "ServletHome", value = "/ServletHome")
public class ServletHome extends HttpServlet {
    private final PostService postService = new PostService();
    private final int authorId = 0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
        creatPost(request,response);
//        switch (action){
////            case "login":
////                findIdByUser(request);
////                break;
//            case "findAllPostByUser":
//                findAllPostByUser(request,response);
//                break;
//            case "creatPost":
//                creatPost(request,response);
//                break;
//            default:
//                break;
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "creatPost":
                creatPost(request,response);
                break;
        }
    }
    public void creatPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
        LocalDateTime date = LocalDateTime.now();
//        int authorId = findIdByUser(request);
        int authorId = 1;
        String postTitle = request.getParameter("a");
        String postContent = request.getParameter("b");
        String postPicture = request.getParameter("file-input");
        String postCreateAt = date.toString();
        Post post = new Post(authorId,postTitle,postContent,postPicture,postCreateAt);
        postService.creatPost(post);
        response.sendRedirect("/ServletHome?action=findAllPostByUser");
    }
    public void findAllPostByUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
//        int authorId = findIdByUser(request);
        int authorId = 1;
        postService.findAllBYUser(authorId);
        request.setAttribute("posts",postService.findAllBYUser(authorId));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/personal.jsp");
        requestDispatcher.forward(request,response);

    }

//    private  findIdByUser(HttpServletRequest request) {
//        String name = request.getParameter("username");
//        authorId = postService.findIdByUser(name);
//    }
}
