package DAO;

import connect.ConnectionMySQL;
import model.User;
import org.omg.CORBA.PUBLIC_MEMBER;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {
    private final String SELECT_ALL_USER = "select * from user";
    private final String SElECT_USER = "select * from user where user_email=? and user_password =? ;";
    private final String SELECT_USER_BY_EMAIL = "select user_id from user where user_email=?;";
    private final String INSERT_USER = "insert into blogs.user (user_email,user_password,regis_date) values (? , ? , ?);";
    private final String CHANGE_STATUS_USER = "UPDATE blogs.user SET user_status = ? WHERE (user_id = ?);";
    private final String CHANGE_VERIFY_USER = "update user set user_verify=? where user_id=? ;";
    private final String SELECT_USER_ONLINE = "SELECT * FROM blogs.user_online;";
    private final String SELECT_POSTS = "SELECT * FROM blogs.count_post;";
    private final String SELECT_POST_THIS_YEAR = "SELECT * FROM blogs.count_post_year;";
    private final String SELECT_USERS = "SELECT * FROM blogs.count_user;";
    private final String UPDATE_LAST_LOGIN = "update blogs.user set last_login=? where(user_id = ?);";
    private final String UPDATE_USER = "update user set  user_name=?, user_address=?, user_birthday=?,user_phone=?,user_avatar=?, last_login=? where user_id=?;";
    private  final  String UPDATE_PASSWORD = "update blogs.user set user_password =? where (user_id = ?)";
    private final ConnectionMySQL connectionMySQL = new ConnectionMySQL();


    public boolean updateUser(User user) {
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER);
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getUserAddress());
            preparedStatement.setString(3, user.getUserDOB());
            preparedStatement.setString(4, user.getUserPhone());
            preparedStatement.setString(5, user.getUserAvatar());
            preparedStatement.setString(6, user.getUserLastLogin());
            preparedStatement.setInt(7,user.getUserId());
            preparedStatement.executeUpdate();
            return true;

        }catch (Exception e ){
            System.out.println(e.getMessage());
            return false;
        }
    }

    public int getUsers() {
        int count = 0;
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            count = resultSet.getInt("count(user_id)");
            return count;
        } catch (Exception e) {
            return count;
        }
    }

    public int getPostsThisYear() {
        int count = 0;
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POST_THIS_YEAR);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            count = resultSet.getInt("count(post_id)");
            return count;
        } catch (Exception e) {
            return count;
        }
    }

    public int getNumberPost() {
        int count = 0;
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POSTS);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            count = resultSet.getInt("count(post_id)");
            return count;
        } catch (Exception e) {
            return count;
        }
    }

    public User getUser(int id, ResultSet resultSet) throws SQLException {
        String userEmail = resultSet.getString("user_email");
        String userName = resultSet.getString("user_name");
        String userPassword = resultSet.getString("user_password");
        String userAddress = resultSet.getString("user_address");
        String userPhone = resultSet.getString("user_phone");
        String userDOB = resultSet.getString("user_birthday");
        String userRegisDate = resultSet.getString("regis_date");
        String userLastLogin = resultSet.getString("last_login");
        String userAvatar = resultSet.getString("user_avatar");
        String userStatus = resultSet.getString("user_status");
        String userVerify = resultSet.getString("user_verify");
        boolean status = userStatus.equals("online");
        boolean verify = userVerify.equals("active");
        return new User(id, userEmail, userName, userPassword, userAddress, userPhone, userDOB, userRegisDate, userLastLogin, userAvatar, status, verify);

    }

    public User findUserByEmailAndPassword(String email, String password) {
        User user;
        int id;
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SElECT_USER);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt("user_id");
                if (id != 0) {
                    user = getUser(id, resultSet);
                    return user;
                }
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public List<User> findAll(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        List<User> userList = new ArrayList<>();
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("user_id");
                User user = getUser(id, resultSet);
                userList.add(user);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return userList;
    }

    public boolean addUser(User user) {
        String userEmail = user.getUserEmail();
        String userPassword = user.getUserPassword();
        String userRegisDate=user.getUserRegisDate();
        int id = 0;
        try {
            if(!checkUserExist(userEmail)){
                Connection connection = connectionMySQL.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER);
                preparedStatement.setString(1, userEmail);
                preparedStatement.setString(2, userPassword);
                preparedStatement.setString(3,userRegisDate);
                preparedStatement.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return false;
    }
    public int getUserOnline(){
        int count=0;
        try {

            Connection connection= connectionMySQL.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_USER_ONLINE);
            ResultSet resultSet= preparedStatement.executeQuery();
            resultSet.next();
            count= resultSet.getInt("count(user_id)");
            return count;
        }catch (Exception e){
            return count;
        }
    }

    public boolean checkUserExist(String userEmail) {
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL);
            preparedStatement.setString(1, userEmail);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            int id = resultSet.getInt("user_id");
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean changeStatusUserOnline(User user){
       String status="online";
        try {
            Connection connection= connectionMySQL.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(CHANGE_STATUS_USER);
            preparedStatement.setString(1,status);
            preparedStatement.setInt(2,user.getUserId());
            preparedStatement.executeUpdate();
            user.setStatus(true);
            return true;
        }catch (Exception e){
            System.err.println(e.getMessage());
            return false;
        }

    }
    public boolean changeStatusUserOffline(User user){
        String status="offline";
        try {
            Connection connection= connectionMySQL.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(CHANGE_STATUS_USER);
            preparedStatement.setString(1,status);
            preparedStatement.setInt(2,user.getUserId());
            preparedStatement.executeUpdate();
            user.setStatus(false);
            return true;
        }catch (Exception e){
            System.err.println(e.getMessage());
            return false;
        }
    }
    public boolean updateLastLogin(User user){
        try{
            Connection connection= connectionMySQL.getConnection();
            PreparedStatement preparedStatement= connection.prepareStatement(UPDATE_LAST_LOGIN);
            preparedStatement.setString(1, user.getUserLastLogin());
            preparedStatement.setInt(2,user.getUserId());
            preparedStatement.executeUpdate();
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean updateVerify(int id, String verify) {
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CHANGE_VERIFY_USER);
            preparedStatement.setString(1, verify);
            preparedStatement.setInt(2,id);
            preparedStatement.executeUpdate();
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean editPassword(int id ,String password){
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PASSWORD);
            preparedStatement.setString(1,password);
            preparedStatement.setInt(2,id);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return false;
        }

    }

}
