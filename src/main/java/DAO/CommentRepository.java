package DAO;

import connect.ConnectionMySQL;
import model.Comment;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentRepository {
    private final String SELECT_ALL_COMMENT = "select * from comment_user";
     private final  ConnectionMySQL connectionMySQL = new ConnectionMySQL();


    private Comment getComment(int id , ResultSet resultSet) throws SQLException {
        int postId = resultSet.getInt("post_id");
        String commentContent = resultSet.getString("comment_content");
        String creatAt = resultSet.getString("comment_create_at");
        return new Comment(id,postId,commentContent,creatAt);
    }


    public List<Comment> findAllCommon(HttpServletRequest request , HttpServletResponse response){
        List<Comment> blogList = new ArrayList<>();
        try {
            Connection connection = connectionMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COMMENT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("comment_id");
                Comment comment = getComment(id , resultSet);
                blogList.add(comment);
            }

        } catch (Exception e){
            System.err.println(e.getMessage());
        }
        return blogList;
    }
}
