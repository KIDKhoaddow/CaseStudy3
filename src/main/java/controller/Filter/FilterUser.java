package controller.Filter;


import model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
@WebFilter(urlPatterns = "/viewUser")
public class FilterUser implements Filter {

    static  public  User userLogin;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
           if(userLogin ==null){
               RequestDispatcher requestDispatcher = request.getRequestDispatcher("userView.jsp");
               requestDispatcher.forward(request,response);
           }else {
               if(userLogin.isVerify()){
                   chain.doFilter(request,response);
               }else {
                   String message = "Your account hac been banned by admin!";
                   request.setAttribute("message", message);
                   RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
                   requestDispatcher.forward(request, response);
               }
           }

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
