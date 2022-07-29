package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UsersServlet", value = "/UsersServlet")
public class UsersServlet extends HttpServlet {
   private String action="";
   private  int id=0;

    @Override
    public void init() throws ServletException {
        super.init();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id=Integer.parseInt(request.getParameter("id"));
        action=request.getParameter("action");
        request.setAttribute("userList",CommonServlet.userList);
        if(action.equals("active")){
            request.setAttribute("confirm",true);
        }else {
            request.setAttribute("confirm",true);
        }
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/users.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }




}
