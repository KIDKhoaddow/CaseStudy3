package controller;

import controller.Filter.FilterUser;
import model.Post;
import model.User;
import service.PostService;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "PersonalServlet", value = "/PersonalServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class PersonalServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public static final String SAVE_DIRECTORY = "uploadDir";

    PostService postService = PostService.getInstance();
    UserService userService=UserService.Instance();
    private int postId;
    private String action;
    String page = "personal.jsp";
    String avatar;
    int authorId;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getParameter("action");
        authorId = FilterUser.userLogin.getUserId();
        try {

            switch (action) {
                case "openFormEdit":
                    postId = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("post", postService.findPostById(postId));
                    request.setAttribute("confirmEdit", true);
                    page = "personal.jsp";
                    break;
                case "openFormDelete":
                    postId = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("post", postService.findPostById(postId));
                    request.setAttribute("confirmDelete", true);
                    page = "personal.jsp";
                    break;
                case "edit":
                    getUser(request);
                    break;
                case"openSinglePost":
                    postId = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("post", postService.findPostById(postId));
                    page="singlePost.jsp";
                    break;
                case "resetPassword":


            }

            request.setAttribute("posts", postService.findAllBYUser(authorId));
            setUser(request);
        } catch (Exception e) {
            System.out.println(e.getMessage());

        }
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
            requestDispatcher.forward(request, response);
    }

    public void creatPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        LocalDateTime date = LocalDateTime.now();
//        int authorId = findIdByUser(request);
        int authorId = 1;
        String postTitle = request.getParameter("title-input");
        String postContent = request.getParameter("content-input");
        String postPicture = request.getParameter("file-input");
        String postCreateAt = date.toString();
        Post post = new Post(postTitle, postContent, postPicture, postCreateAt);
        postService.creatPost(post);
        response.sendRedirect("/ServletHome?action=findAllPostByUser");
    }

    public void setUser(HttpServletRequest req) throws ServletException {
        User user = FilterUser.userLogin;
        req.setAttribute("userName", user.getUserName());
        req.setAttribute("userAddress", user.getUserAddress());
        req.setAttribute("userPhone", user.getUserPhone());
        req.setAttribute("userAvatar", user.getUserAvatar());
        req.setAttribute("userDOB", user.getUserDOB());
        req.setAttribute("userEmail", user.getUserEmail());
        req.setAttribute("userRegisterDate", user.getUserRegisDate());
        req.setAttribute("userPassword", user.getUserPassword());
    }

    public boolean getUser(HttpServletRequest req) {
        User user = FilterUser.userLogin;
        try {
            user.setUserName(req.getParameter("user-name-input"));
            user.setUserAddress(req.getParameter("user-address-input"));
            user.setUserPhone(req.getParameter("user-phone-input"));
            avatar=req.getParameter("user-picture-input");
            if(avatar!=null){
                user.setUserAvatar(req.getParameter("user-picture-input"));
            }
            user.setUserDOB(req.getParameter("user-DOB-input"));
            LocalDate localDate = LocalDate.now();
            DateTimeFormatter fmt1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            localDate.format(fmt1);
            user.setUserLastLogin(String.valueOf(localDate));
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}
