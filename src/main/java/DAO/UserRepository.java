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
    private final User user = new User();

    private final String SELECT_ALL_USER = "select * from user";

    private final ConnectionMySQL connectionMySQL = new ConnectionMySQL();


    public User getUser(int id , ResultSet resultSet) throws SQLException{
        String userEmail = resultSet.getString("user_email");
        String userName = resultSet.getString("user_name");
        String userPassword = resultSet.getString("user_password");
        String userAddress = resultSet.getString("user_address");
        String userPhone = resultSet.getString("user_phone");
        String userDOB = resultSet.getString("user_birthday");
        String userRegisDate = resultSet.getString("regis_date");
        String userLastLogin = resultSet.getString("last_login");
        String userStatus = resultSet.getString("user_status");
        boolean status=true;
        if(!userStatus.equals("online")){
            status=false;
        }
        return  new User(id,userEmail , userName , userPassword ,userAddress ,userPhone ,userDOB ,userRegisDate ,userLastLogin ,status);

    }

    public List<User> findAll(HttpServletRequest request , HttpServletResponse response) throws SQLException {
        List<User> userList = new ArrayList<>();
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("user_id");
                User user = getUser(id , resultSet);
                userList.add(user);
            }
        } catch (Exception e){
            System.err.println(e.getMessage());
        }
        return userList;

    }






}
