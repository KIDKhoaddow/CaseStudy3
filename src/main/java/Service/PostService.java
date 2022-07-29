package Service;

import DAO.CommentRepository;
import model.Comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class PostService {

    CommentRepository commonRepository = new CommentRepository();

    public List<Comment> findAll(HttpServletRequest request , HttpServletResponse response){
        List<Comment> blogList;
        blogList = commonRepository.findAllCommon(request,response);
        return blogList;

    }
}
