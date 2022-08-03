package service;

import DAO.UserRepository;
import Validation.MyValidation;
import controller.Filter.FilterUser;
import model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    public boolean updateLastLogin(){
        User user = FilterUser.userLogin;
        LocalDateTime localDateTime= LocalDateTime.now();
        DateTimeFormatter fmt1 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String userLastLogin= localDateTime.format(fmt1);
        user.setUserLastLogin(userLastLogin);
        return userRepository.updateLastLogin(user);
    }
    public boolean updateVerifyActive(int id){
        return userRepository.updateVerify(id,"active");
    }
    public  boolean updateVerifyBan(int id){
        return userRepository.updateVerify(id,"banned");
    }
    public  boolean updateUser(User user){
        return userRepository.updateUser(user);
    }
    public boolean changePassword(String oldPassword , String newPassword , String rePassword){
        MyValidation myValidation = new MyValidation();
        int id  = FilterUser.userLogin.getUserId();
        String password = FilterUser.userLogin.getUserPassword();
        if (myValidation.validatePassword(newPassword)){
            if (oldPassword.equals(password) && !newPassword.equals(oldPassword) && newPassword.equals(rePassword)){
                return userRepository.editPassword(id ,newPassword);
        } return  false;
        } else {
            

        }
        return  true;

    }

}
