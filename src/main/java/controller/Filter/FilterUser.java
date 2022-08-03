package controller.Filter;


import controller.LoginServlet;
import model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
@WebFilter(urlPatterns = "/viewUser")
public class FilterUser implements Filter {

    static public  User userLogin;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
           if(userLogin ==null){
               RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
               requestDispatcher.forward(request,response);
           }else {
               chain.doFilter(request,response);

           }

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
