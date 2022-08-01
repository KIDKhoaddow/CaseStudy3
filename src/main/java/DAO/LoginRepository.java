package DAO;

import connect.ConnectionMySQL;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginRepository {

    ConnectionMySQL connectionMySQL = new ConnectionMySQL();
    private final String SELECT_USER_BY_USERMAIL ="select * from user where user_email=?" ;
    private final String INSERT_USER = "insert into user(user_name,user_email,)";
    public User findIdUserByUsermail(String user_email){
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERMAIL);
            preparedStatement.setString(1,user_email);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int user_id = resultSet.getInt("user_id");
                String user_email1 = resultSet.getString("user_email");
                String pass = resultSet.getString("user_password");
                User user = new User(user_id,user_email1,pass);
                if (user_email1 != null){
                    return user;
                }
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }




}


