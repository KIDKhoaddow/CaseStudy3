package controller;

//import Controller.Filter.FilterAdmin;
//import Controller.Filter.FilterUser;
//import Dao.VeDao;
//import Service.AccountService;
//import Service.FilmService;
//import Service.VeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(urlPatterns = "/viewAdmin")
public class ViewAdmin extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //lấy một số thông tin để load trang ban đầu
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("adminView.jsp");
        requestDispatcher.forward(req, resp);
    }
}
