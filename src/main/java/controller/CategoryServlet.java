package controller;

import service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CategoryServlet", value = "/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    CategoryService categoryService=new CategoryService();
    private int id;
    private  String action;
    private  String confirm;
    private String title;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action=request.getParameter("action");
        confirm=request.getParameter("confirm");
        if(confirm==null && action!=null){
            id=Integer.parseInt(request.getParameter("id"));
            request.setAttribute("categoryList", categoryService.findAllCategory(request, response));
            request.setAttribute("confirm",true);
            doPost(request,response);
        }else{
            title=request.getParameter("title-input");

            doPost(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/category.jsp");
        requestDispatcher.forward(request,response);
    }


}
