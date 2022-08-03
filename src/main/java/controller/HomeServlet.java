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

@WebServlet(name = "ServletHome", value = "/ServletHome")
public class

HomeServlet extends HttpServlet {
    private final PostService postService =PostService.getInstance();
    String action="";
    String page="personal.jsp";

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action=request.getParameter("action");
        switch (action){
            case "home" :
                setUser(request);
                page="userView.jsp";
                break;
            case "personal":
                int authorId = FilterUser.userLogin.getUserId();
                request.setAttribute("posts",postService.findAllBYUser(authorId));
                setUser(request);
                page="personal.jsp";
                break;
            case "category" :
                setUser(request);
                page = "category.jsp";
            default:page="personal.jsp";
        }
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher= request.getRequestDispatcher(page);
        requestDispatcher.forward(request,response);
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



