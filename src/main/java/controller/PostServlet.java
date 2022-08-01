package controller;

import controller.Filter.FilterUser;
import service.PostService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PostServlet", value = "/PostServlet")
public class PostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "posts":{
                findAll(request,response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public  void findAll(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("blogList",PostService.getInstance().findAllBlogs());
        request.getRequestDispatcher("blogs.jsp").forward(request,response);
    }
}
