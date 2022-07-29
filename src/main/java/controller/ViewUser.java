package controller;


import controller.Filter.FilterUser;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/ViewUser")
public class ViewUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setAttribute("films", FilmService.films);
//        req.setAttribute("idUser",  AccountService.findIdAccountByName(FilterUser.account.getUserName()));
//        req.setAttribute("username", FilterUser.account1.getUserName());
//        req.setAttribute("img", FilterUser.account1.getImg());
//        req.setAttribute("idname", FilterUser.account.getId());
//        int idUser = AccountService.findIdAccountByName(FilterUser.account.getUserName());
//        ArrayList<Ve> listVeByIdUser = VeService.listVeByIdUser(idUser);
//        req.setAttribute("quantity",listVeByIdUser.size());
        //đẩy data lên vào trang chủ
        User user= FilterUser.userLogin;
        req.setAttribute("userName",user.getUserName());
        req.setAttribute("userAddress",user.getUserAddress());
        req.setAttribute("userPhone",user.getUserPhone());
        req.setAttribute("userAvatar",user.getUserAvatar());
        req.setAttribute("userDOB",user.getUserDOB());
        req.setAttribute("userEmail",user.getUserEmail());
        req.setAttribute("userRegisterDate",user.getUserRegisDate());
        req.setAttribute("userPassword",user.getUserPassword());
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/personal.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String ten = req.getParameter("search");
//        List<Film> filmList = SearchDao.getSearch(ten);
//        req.setAttribute("films", filmList);
//        req.setAttribute("idUser",  AccountService.findIdAccountByName(FilterUser.account.getUserName()));
//        req.setAttribute("username", FilterUser.account.getUserName());
//        int idUser = AccountService.findIdAccountByName(FilterUser.account.getUserName());
//        ArrayList<Ve> listVeByIdUser = VeService.listVeByIdUser(idUser);
//        req.setAttribute("quantity",listVeByIdUser.size());
        //đẩy data lên trên


        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/ViewUser.jsp");
        requestDispatcher.forward(req,resp);
    }
}
