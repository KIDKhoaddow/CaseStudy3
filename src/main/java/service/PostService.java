package service;

import DAO.PostRepo;
import model.Post;

import java.util.ArrayList;
import java.util.List;

public class PostService {
    private static   PostService instance=new PostService();
    private PostService() {
    }
    public  static PostService getInstance(){
        return instance;
    }
    private final PostRepo postRepo = new PostRepo();
    public void creatPost(Post post){
        postRepo.insertPost(post);
    }
    public List<Post> findAllBYUser(int authorId) {
        return postRepo.findAllByUser(authorId);
    }
    public ArrayList<Post> findAllBlogs(){
        return postRepo.finAllBlogs();
    }
    public Post findPostById(int postID){
        return postRepo.findPostById(postID);
    }

    public ArrayList<ArrayList<String>> findTablePostLike(){
        return  postRepo.findPostLike();
    }
    public   ArrayList<ArrayList<String>> findTableTopTenAuthor(){
        return  postRepo.findTopTenAuthor();}

}