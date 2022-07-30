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
    public Post findPostById(int postID){
        return postRepo.findPostById(postID);
    }

//    public int findIdByUser(String name) {
//        return postRepo.findIdByUser(name);
//    }
}