package controller;

import service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CategoryServlet", value = "/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    CategoryService categoryService = new CategoryService();
    private int id;
    private String action;
    private String title;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            action = request.getParameter("action");


            switch (action) {
                case "openFormEdit":
                    id = Integer.parseInt(request.getParameter("id"));
                    title=request.getParameter("title");
                    request.setAttribute("confirm", true);
                    request.setAttribute("title_input",title);
                    break;
                case  "edit":
                   String title_input = request.getParameter("title_input");
                   if(!title.equals(title_input)){
                       categoryService.updateTitleCategoryById(id,title_input);
                   }else {
                       categoryService.updateTitleCategoryById(id,title);
                   }
                    break;
            }
            request.setAttribute("categoryList", categoryService.findAllCategory(request, response));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        doPost(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/category.jsp");
        requestDispatcher.forward(request, response);
    }


}
