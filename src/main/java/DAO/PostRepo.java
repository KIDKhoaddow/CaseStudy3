package DAO;

import connect.ConnectionMySQL;
import model.Post;
import model.Status;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class PostRepo {
    private final ConnectionMySQL connectionMySQL = new ConnectionMySQL();
    private final String SELECT_ALL_BY_USER = "select * from post where author_id=?";
    private final String INSERT_POST = "insert into post (post_create_at,post_title,post_content,post_picture) value (?,?,?,?); ";
    private final String SELECT_POST_BY_ID = "select * from post where post_id=?;";

    public void insertPost(Post post) {
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_POST);
            preparedStatement.setDate(1, Date.valueOf(post.getPostCreateAt()));
            preparedStatement.setString(2, post.getPostTitle());
            preparedStatement.setString(3, post.getPostContent());
            preparedStatement.setString(4, post.getPostPicture());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public List<Post> findAllByUser(int authorId) {
        List<Post> posts = new ArrayList<>();
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BY_USER);
            preparedStatement.setInt(1, authorId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int post_id = resultSet.getInt("post_id");
                String post_title = resultSet.getString("post_title");
                String post_content = resultSet.getString("post_content");
                String post_picture = resultSet.getString("post_picture");
                String post_create_at = resultSet.getString("post_create_at");
                Post post = new Post(post_id, post_title, post_content, post_picture, post_create_at);
                posts.add(post);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return posts;

    }

    public Post getPost(int id, ResultSet resultSet) {
        Status status =Status.PENDING;
        try {
            int post_id = resultSet.getInt("post_id");
            int category_id=resultSet.getInt("category_post_id");
            String post_title = resultSet.getString("post_title");
            String post_content = resultSet.getString("post_content");
            String post_picture = resultSet.getString("post_picture");
            String post_create_at = resultSet.getString("post_create_at");
            String post_update_at=resultSet.getString("post_update_at");
            String  post_status= resultSet.getString("post_status");
            switch (post_status){
                case "PENDING":
                   break;
                case "ADMITTED":
                    status=Status.ADMITTED; break;
                case   "BANNED":
                    status=Status.BANNED; break;
            }

            return new Post(post_id,category_id,post_title,post_content,
                    post_picture,post_create_at,post_update_at,status);

        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Post findPostById(int id) {
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POST_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            return getPost(id,resultSet);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null ;
        }
    }

    public int findIdByUser(String name) {
        return 1;
    }
}
