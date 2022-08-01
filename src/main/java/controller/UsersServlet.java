package controller;

import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UsersServlet", value = "/UsersServlet")
public class UsersServlet extends HttpServlet {
    UserService userService = UserService.Instance();
    private String action = "";
    private int id = 0;

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            action = request.getParameter("action");
            switch (action) {
                case "openFormActive":
                    id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("formOpen",true);
                    request.setAttribute("confirm", true);
                    request.setAttribute("idAction", id);
                    request.setAttribute("formOpen",true);
                    break;
                case "openFormDisable":
                    id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("formOpen",false);
                    request.setAttribute("confirm", true);
                    request.setAttribute("idAction", id);
                    request.setAttribute("formOpen",false);
                    break;
                case  "ban":
                    userService.updateVerifyBan(id);
                    break;
                case "active":
                    userService.updateVerifyActive(id);
                    break;
            }
            request.setAttribute("userList", userService.findAllUser(request, response));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("users.jsp");
        dispatcher.forward(request, response);
    }




}
