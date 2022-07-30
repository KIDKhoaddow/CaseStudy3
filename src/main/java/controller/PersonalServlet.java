package controller;

import controller.Filter.FilterUser;
import model.Post;
import model.User;
import service.PostService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "PersonalServlet", value = "/PersonalServlet")
public class PersonalServlet extends HttpServlet {
    PostService postService=new PostService();
    private int id;
    private  String action;
    private  String confirm;
    private String title;
    String   page="personal.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action=request.getParameter("action");
        try {
            switch (action) {
                case "openFormEdit":
                    id = Integer.parseInt(request.getParameter("id"));
                    int authorId = FilterUser.userLogin.getUserId();
                    request.setAttribute("confirm",true);
                    request.setAttribute("post" ,postService.findPostById(id));
                    request.setAttribute("posts",postService.findAllBYUser(authorId));
                    setUser(request);
                    break;

            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        doPost(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher= request.getRequestDispatcher(page);
        requestDispatcher.forward(request,response);
    }

    public void creatPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
        LocalDateTime date = LocalDateTime.now();
//        int authorId = findIdByUser(request);
        int authorId = 1;
        String postTitle = request.getParameter("title-input");
        String postContent = request.getParameter("content-input");
        String postPicture = request.getParameter("file-input");
        String postCreateAt = date.toString();
        Post post = new Post(postTitle,postContent,postPicture,postCreateAt);
        postService.creatPost(post);
        response.sendRedirect("/ServletHome?action=findAllPostByUser");
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
