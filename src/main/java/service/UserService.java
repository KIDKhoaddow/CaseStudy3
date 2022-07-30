package service;

import DAO.UserRepository;
import model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

public class UserService {
    UserRepository userRepository = new UserRepository();
    private  static  UserService instance = new UserService();

    public static UserService Instance(){
        return instance;
    }
    private UserService() {

    }

    public List<User> findAllUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        List<User> userList;
        userList = userRepository.findAll(request, response);
        return userList;
    }
    public User findUserByEmailAndPassword(String email,String password)throws SQLException{
        return  userRepository.findUserByEmailAndPassword(email,password);
    }
    public boolean addUser(User user){
        return userRepository.addUser(user);
    }
    public boolean changeStatusUserOnline(User user){
        return userRepository.changeStatusUserOnline(user);
    }
    public boolean changeStatusUserOffline(User user){
        return userRepository.changeStatusUserOffline(user);
    }
    public int getUserOnline(){
        return userRepository.getUserOnline();
    }
    public int getPosts(){
        return userRepository.getNumberPost();
    }
    public  int getPostsThisYear(){
        return userRepository.getPostsThisYear();
    }
    public int getUsers(){
        return userRepository.getUsers();
    }
}
