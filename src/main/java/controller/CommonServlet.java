package controller;

import model.Category;
import model.Post;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CommonServlet", value = "/CommonServlet")
public class CommonServlet extends HttpServlet {
    static public List<User> userList=createDemo();
    static  public  List<Category> categoryList=createCategory();
    static  public  List<Post> postList=createPost();
    private String page="/adminView.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "dashboard":
                page = "/adminView.jsp";
                break;
            case "users":
                request.setAttribute("userList",userList);
                page ="/users.jsp";
                break;
            case "category":
                request.setAttribute("categoryList",categoryList);
                page= "/category.jsp";
                break;
            case "posts":
                request.setAttribute("blogList",postList);
                page="/blogs.jsp";
                break;
            default:
                page= "/adminView.jsp";
                break;
        }
      doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);

    }

    private  static  List<Category> createCategory(){
        List<Category> categoryList=new ArrayList<>();
        categoryList.add(new Category(1,"một","hahahahaha"));
        categoryList.add(new Category(2,"hai","hahahahaha"));
        categoryList.add(new Category(3,"ba","hahahahaha"));
        categoryList.add(new Category(4,"bốn","hahahahaha"));
        categoryList.add(new Category(5,"năm","hahahahaha"));
        categoryList.add(new Category(6,"sáu","hahahahaha"));
        categoryList.add(new Category(7,"bảy","hahahahaha"));
        categoryList.add(new Category(8,"tám","hahahahaha"));
        categoryList.add(new Category(9,"chín","hahahahaha"));
        return categoryList;

    }
    public  static List<Post> createPost(){
        List<Post> list=new ArrayList<>();
        list.add(new Post(1,1,"gà","hahahahahhaha","savbahdbvasdvuiasdiuva",
                "aaaaaaaaaaaaaaa","07/22/2007","07/22/2027"));

        list.add(new Post(2,2,"gà","hahahahahhaha","savbahdbvasdvuiasdiuva",
                "aaaaaaaaaaaaaaa","07/22/2007","07/22/2027"));
        list.add(new Post(3,3,"gà","hahahahahhaha","savbahdbvasdvuiasdiuva",
                "aaaaaaaaaaaaaaa","07/22/2007","07/22/2027"));
        list.add(new Post(4,4,"gà","hahahahahhaha","savbahdbvasdvuiasdiuva",
                "aaaaaaaaaaaaaaa","07/22/2007","07/22/2027"));
        list.add(new Post(5,5,"gà","hahahahahhaha","savbahdbvasdvuiasdiuva",
                "aaaaaaaaaaaaaaa","07/22/2007","07/22/2027"));
        list.add(new Post(6,5,"gà","hahahahahhaha","savbahdbvasdvuiasdiuva",
                "aaaaaaaaaaaaaaa","07/22/2007","07/22/2027"));
        return list;
    }


    private static List<User> createDemo(){
        List<User> userList=new ArrayList<>();

        userList.add(new User(1,"khoa1@gmail.com","khoa1","12345678",
                "hanoi","0978264830","07/26/1997",
                "26-07-2022","12-05-2022",false));
        userList.add(new User(2,"khoa1@gmail.com","khoa2","12345678",
                "hanoi","0978264830","07/26/1997",
                "26-07-2022","12-05-2022",true));
        userList.add(new User(3,"khoa1@gmail.com","khoa3","12345678",
                "hanoi","0978264830","07/26/1997",
                "26-07-2022","12-05-2022",false));
        userList.add(new User(4,"khoa1@gmail.com","khoa4","12345678",
                "hanoi","0978264830","07/26/1997",
                "26-07-2022","12-05-2022",true));
        userList.add(new User(5,"khoa1@gmail.com","khoa5","12345678",
                "hanoi","0978264830","07/26/1997",
                "26-07-2022","12-05-2022",false));
        userList.add(new User(6,"khoa1@gmail.com","khoa6",
                "12345678",
                "hanoi","0978264830","07/26/1997","26-07-2022","12-05-2022",true));
        userList.add(new User(7,"khoa1@gmail.com","khoa7","12345678",
                "hanoi","0978264830","07/26/1997","26-07-2022","12-05-2022",true));
        userList.add(new User(8,"khoa1@gmail.com","khoa8","12345678",
                "hanoi","0978264830","07/26/1997","26-07-2022","12-05-2022",true));
        userList.add(new User(9,"khoa1@gmail.com","khoa9","12345678",
                "hanoi","0978264830","07/26/1997","26-07-2022","12-05-2022",true));
        userList.add(new User(10,"khoa1@gmail.com","khoa10","12345678",
                "hanoi","0978264830","07/26/1997","26-07-2022","12-05-2022",true));
        userList.add(new User(11,"khoa1@gmail.com","khoa11","12345678",
                "hanoi","0978264830","07/26/1997","26-07-2022","12-05-2022",true));
        userList.add(new User(12,"khoa1@gmail.com","khoa12","12345678",
                "hanoi","0978264830","07/26/1997","26-07-2022","12-05-2022",true));
        userList.add(new User(13,"khoa1@gmail.com","khoa13","12345678",
                "hanoi","0978264830","07/26/1997","26-07-2022","12-05-2022",true));
        userList.add(new User(14,"khoa1@gmail.com","khoa14","12345678",
                "hanoi","0978264830","07/26/1997","26-07-2022","12-05-2022",true));
        userList.add(new User(15,"khoa1@gmail.com","khoa15","12345678",
                "hanoi","0978264830","07/26/1997","26-07-2022","12-05-2022",true));
        userList.add(new User(16,"khoa1@gmail.com","khoa16","12345678",
                "hanoi","0978264830","07/26/1997","26-07-2022","12-05-2022",true));
        return userList;
    }
}
