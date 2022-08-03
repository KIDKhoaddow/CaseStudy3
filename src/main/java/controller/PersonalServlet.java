package controller;

import controller.Filter.FilterUser;
import model.Post;
import model.User;
import service.PostService;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "PersonalServlet", value = "/PersonalServlet")
@MultipartConfig(location = "O:\\Khóa học\\Java Code Gym\\Case Study\\CaseStudy3\\picture",
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class PersonalServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public static final String SAVE_DIRECTORY = "uploadDir";

    PostService postService = PostService.getInstance();
    UserService userService=UserService.Instance();
    private int id;
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
                    id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("post", postService.findPostById(id));
                    request.setAttribute("confirmEdit", true);
                    page = "personal.jsp";
                    break;
                case "openFormDelete":
                    id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("post", postService.findPostById(id));
                    request.setAttribute("confirmDelete", true);
                    page = "personal.jsp";
                    break;
                case "edit":
                    if(  getUser(request, response)){
                        userService.updateUser(FilterUser.userLogin);
                    }
                    break;
                case "openSinglePost":
                    id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("post", postService.findPostById(id));
                    page = "singlePost.jsp";
                    break;
                case"editPost":
                    id=Integer.parseInt(request.getParameter("id"));
                    String title =request.getParameter("post-title-input-edit");
                    String content=request.getParameter("post-content-input-edit");
                    String picture=request.getParameter("file-picture-input-edit");
                    postService.setPost(id,title,content,picture);
                    break;
                case "createPost":
                    String newPostTitle = request.getParameter("title-input");
                    String newPostContent=request.getParameter("textarea-input");
                    String newPostPicture=request.getParameter("file-input");
                case "resetPassword":
                    String oldPassword = request.getParameter("old-password-input");
                    String newPassword = request.getParameter("new-password-input");
                    String rePassword = request.getParameter("re-password-input");
                    if (userService.changePassword(oldPassword ,newPassword ,rePassword)){
                        request.setAttribute("message" , 1);
                        page="login.jsp";
                        break;
                    }else {
                        request.setAttribute("message" , 0);
                        System.err.println("change password not success");
                    }


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

    public boolean getUser(HttpServletRequest req, HttpServletResponse resp) {
        User user = FilterUser.userLogin;
        String location="picture/";
        try {
            user.setUserName(req.getParameter("user-name-input"));
            user.setUserAddress(req.getParameter("user-address-input"));
            user.setUserPhone(req.getParameter("user-phone-input"));
            avatar = req.getParameter("user-picture-input");

            if (avatar != null) {
                avatar=location.concat(avatar);
                user.setUserAvatar(avatar);
            }
            user.setUserDOB(req.getParameter("user-DOB-input"));
            LocalDate localDate = LocalDate.now();
            DateTimeFormatter fmt1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            localDate.format(fmt1);
            user.setUserLastLogin(String.valueOf(localDate));
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    public File getFolderUpload() {
        File folderUpload = new File(System.getProperty("user.home") + "/Uploads");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }


}
