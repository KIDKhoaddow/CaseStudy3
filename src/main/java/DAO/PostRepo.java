package DAO;

import connect.ConnectionMySQL;
import model.Post;
import model.Status;
import org.omg.CORBA.PUBLIC_MEMBER;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class PostRepo {
    private final ConnectionMySQL connectionMySQL = new ConnectionMySQL();
    private final String SELECT_ALL_BY_USER = "select * from post where author_id=?";
    private final String INSERT_POST = "insert into post (post_create_at,post_title,post_content,post_picture) value (?,?,?,?); ";
    private final String SELECT_POST_BY_ID = "select * from users_blogs where post_id=?;";
    private final  String VIEW_TABLE_LIKE_OF_POST=" select* from table_like_of_post;";
    private  final  String VIEW_TABLE_TOP_TEN_AUTHOR="select* from top_ten_post_user;";
    private  final static String VIEW_POST_LIKE_BY_ID="SELECT count_like FROM blogs.like_of_post where post_id=?;";
    private final  String UPDATE_POST_BY_ID="update post set post_title=?,post_content=?,post_picture=? where post_id=?;";
    private final String SELECT_ALL_BLOGS = "select * from blogs.users_blogs;";

    public  boolean updatePost(Post post){
        try{
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement =connection.prepareStatement(UPDATE_POST_BY_ID);
            preparedStatement.setString(1,post.getPostTitle());
            preparedStatement.setString(2, post.getPostContent());
            preparedStatement.setString(3, post.getPostPicture());
            preparedStatement.setInt(4,post.getPostId());
            preparedStatement.executeUpdate();
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }


    public ArrayList<Post> finAllBlogs(){
        ArrayList<Post> posts = new ArrayList<>();
        try{
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement =  connection.prepareStatement(SELECT_ALL_BLOGS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id_post = resultSet.getInt("post_id");
                String user_name = resultSet.getString("user_name");
                String post_title = resultSet.getString("post_title");
                String post_status = resultSet.getString("post_status");
                String category_title = resultSet.getString("category_title");
                String post_create_at = resultSet.getString("post_create_at");
                String post_update_at = resultSet.getString("post_update_at");
                Post post = new Post(id_post,category_title,user_name,post_title,post_create_at,post_update_at, chooseStatus(post_status));
                posts.add(post);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return posts;
    }
    public static int countLikeOfPostById(int idPost){
        try {
            Connection connection = ConnectionMySQL.getConnectionStatic();
            PreparedStatement preparedStatement = connection.prepareStatement(VIEW_POST_LIKE_BY_ID);
            preparedStatement.setInt(1,idPost);
            ResultSet resultSet= preparedStatement.executeQuery();
            resultSet.next();
            return resultSet.getInt("count_like");

        }catch (Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
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
            String categoryPost =resultSet.getString("category_title");
            String author=resultSet.getString("user_name");
            String post_title = resultSet.getString("post_title");
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
        return new Post(post_id,categoryPost,author,post_title,post_create_at,post_update_at,chooseStatus(post_status));
//            return new Post(post_id,post_title,author,categoryPost,post_picture,post_create_at,post_update_at,status);

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

    public ArrayList<ArrayList<String>>  findPostLike(){
        try {
            ArrayList<ArrayList<String>> postLikeList =new ArrayList<>();
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(VIEW_TABLE_LIKE_OF_POST);
            ResultSet resultSet= preparedStatement.executeQuery();
            while(resultSet.next()){
                ArrayList<String> post=new ArrayList<>();
                post.add(String.valueOf(resultSet.getInt("post_id")));
                post.add(resultSet.getString("post_title"));
                post.add(resultSet.getString("category_title"));
                post.add(resultSet.getString("user_name"));
                post.add(resultSet.getString("post_create_at"));
                post.add(resultSet.getString("count_like"));
                postLikeList.add(post);
            }
            return postLikeList;


        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }

    public ArrayList<ArrayList<String>> findTopTenAuthor(){
        try {
            ArrayList<ArrayList<String>> topTenAuthor =new ArrayList<>();
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(VIEW_TABLE_TOP_TEN_AUTHOR);
            ResultSet resultSet= preparedStatement.executeQuery();
            while(resultSet.next()){
                ArrayList<String> post=new ArrayList<>();
                post.add(String.valueOf(resultSet.getInt("user_id")));
                post.add(resultSet.getString("user_name"));
                post.add(resultSet.getString("count_like"));
                topTenAuthor.add(post);
            }
            return topTenAuthor;


        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }

    public Status chooseStatus(String status){
        switch (status){
            case "pending":
                return Status.PENDING;
            case "admitted":
                return  Status.ADMITTED;
            case "banned":
                return Status.BANNED;
            default:
                return Status.PENDING;
        }
    }
    public int findIdByUser(String name) {
        return 1;
    }
}
