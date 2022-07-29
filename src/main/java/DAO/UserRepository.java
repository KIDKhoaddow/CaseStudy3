package DAO;

import connect.ConnectionMySQL;
import model.User;

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
    private final String INSERT_USER = "insert into blogs.user (user_email,user_password) values (? , ?);";

    private final ConnectionMySQL connectionMySQL = new ConnectionMySQL();


    public User getUser(int id, ResultSet resultSet) throws SQLException {
        String userEmail = resultSet.getString("user_email");
        String userName = resultSet.getString("user_name");
        String userPassword = resultSet.getString("user_password");
        String userAddress = resultSet.getString("user_address");
        String userPhone = resultSet.getString("user_phone");
        String userDOB = resultSet.getString("user_birthday");
        String userRegisDate = resultSet.getString("regis_date");
        String userLastLogin = resultSet.getString("last_login");
        String userAvatar=resultSet.getString("user_avatar");
        String userStatus = resultSet.getString("user_status");
        String userVerify=resultSet.getString("user_verify");
        boolean status = userStatus.equals("online");
        boolean verify= userVerify.equals("Active");
        return new User(id, userEmail, userName, userPassword, userAddress, userPhone, userDOB, userRegisDate, userLastLogin,userAvatar, status,verify);

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
        int id = 0;
        try {
            if(!checkUserExist(userEmail)){
                Connection connection = connectionMySQL.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER);
                preparedStatement.setString(1, userEmail);
                preparedStatement.setString(2, userPassword);
                preparedStatement.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return false;
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

}
