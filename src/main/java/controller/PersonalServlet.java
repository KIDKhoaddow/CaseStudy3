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
public class PersonalServlet extends HttpServlet {
    PostService postService = PostService.getInstance();
    UserService userService=UserService.Instance();
    private int id;
    private String action;
    String page = "personal.jsp";
    int authorId;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getParameter("action");
        authorId = FilterUser.userLogin.getUserId();

        try {
            switch (action) {
                case "openFormEdit":
                    id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("confirmEdit", true);

                    break;
                case "openFormDelete":
                    id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("confirmDelete", true);
                    break;
                case "edit":
                    getUser(request);

                    break;
            }
            request.setAttribute("post", postService.findPostById(id));
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
            user.setUserAvatar(req.getParameter("user-avatar-input"));
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
