package DAO;

import connect.ConnectionMySQL;
import model.Post;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class PostRepo {
    private final ConnectionMySQL connectionMySQL = new ConnectionMySQL();
    private final String SELECT_ALL_BY_USER = "select * from post where id=?";
    private final String INSERT_POST = "insert into post (author_id,post_create_at,post_title,post_content,post_picture) value (?,?,?,?,?); ";
    public void insertPost(Post post){
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_POST);
            preparedStatement.setInt(1,post.getAuthorId());
            preparedStatement.setDate(2, Date.valueOf(post.getPostCreateAt()));
            preparedStatement.setString(3,post.getPostTitle());
            preparedStatement.setString(4,post.getPostContent());
            preparedStatement.setString(5,post.getPostPicture());
            preparedStatement.executeUpdate();
        }catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }
    public ArrayList<Post> findAllByUser(int authorId){
        ArrayList<Post> posts = new ArrayList<>();
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BY_USER);
            preparedStatement.setInt(1,authorId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int post_id = resultSet.getInt("post_id");
                int author_id = resultSet.getInt("author_id");
                String post_title = resultSet.getString("post_title");
                String post_content = resultSet.getString("post_content");
                String post_picture = resultSet.getString("post_picture");
                String post_create_at =resultSet.getString("post_create_at");
                Post post = new Post(post_id,authorId,post_title,post_content,post_picture,post_create_at);
                posts.add(post);
            }
        }catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return posts;

    }

    public int findIdByUser(String name) {
        return 1;
    }
}
