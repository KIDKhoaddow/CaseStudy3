package DAO;

import connect.ConnectionMySQL;
import model.Category;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryRepository {

    private  final  String UPDATE_TITLE_CATEGORY_BY_ID="UPDATE category SET category_title = ? WHERE category_id = ?;";
    private final String SELECT_ALL_CATEGORY = "select * from category";
    private final ConnectionMySQL connectionMySQL = new ConnectionMySQL();


    public  boolean updateTitleCategoryById(int categoryId,String title){
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TITLE_CATEGORY_BY_ID);
            preparedStatement.setString(1,title);
            preparedStatement.setInt(2,categoryId);
            preparedStatement.executeUpdate();
            return true;

        }catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    public  Category getCategory(int id , ResultSet resultSet ) throws SQLException {
        String categoryTitle = resultSet.getString("category_title");
        String categoryContent = resultSet.getString("category_content");
        return new Category(id , categoryTitle ,categoryContent );
    }

    public ArrayList<Category> findAll(HttpServletRequest request , HttpServletResponse response){
        ArrayList<Category> categories = new ArrayList<>();
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("category_id");
                Category category = getCategory(id , resultSet);
                categories.add(category);
            }


        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
return categories;

    }
}
