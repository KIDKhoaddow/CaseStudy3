package service;

import DAO.UserRepository;
import controller.Filter.FilterUser;
import model.User;
import sun.security.util.Password;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

    public boolean changePassword(String oldPassword , String newPassword , String rePassword){
        int id  = FilterUser.userLogin.getUserId();
        String password = FilterUser.userLogin.getUserPassword();
        if (oldPassword.equals(password) && !newPassword.equals(oldPassword) && newPassword.equals(rePassword)){
            return userRepository.editPassword(id ,newPassword);
        }
        return  false;
    }

}
