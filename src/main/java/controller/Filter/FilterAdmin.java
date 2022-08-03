package controller.Filter;

import model.User;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
@WebFilter(urlPatterns = "/viewAdmin")
public class FilterAdmin implements Filter{
    static  public User userAdmin;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if(userAdmin==null){
            request.setAttribute("message","đăng nhập lại đê");
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
