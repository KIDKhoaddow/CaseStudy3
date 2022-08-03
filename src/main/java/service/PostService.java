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
//    public  boolean createNewPost(String title, String content , String picture){
//        String location="picture/";
//        Post post=new Post();
//
//    }
    public List<Post> findAllBYUser(int authorId) {
        return postRepo.findAllByUser(authorId);
    }
    public ArrayList<Post> findAllBlogs(){
        return postRepo.finAllBlogs();
    }
    public Post findPostById(int postID){
        return postRepo.findPostById(postID);
    }
    public  boolean updatePost(Post post){
        return postRepo.updatePost(post);
    }

    public ArrayList<ArrayList<String>> findTablePostLike(){
        return  postRepo.findPostLike();
    }
    public   ArrayList<ArrayList<String>> findTableTopTenAuthor(){
        return  postRepo.findTopTenAuthor();}

    public boolean setPost(int id , String title , String content , String picture ){
        String location="picture/";
        Post post= findPostById(id);
        post.setPostTitle(title);
        post.setPostContent(content);
        if (picture != null) {
            picture=location.concat(picture);
            post.setPostPicture(picture);
        }
        post.setPostPicture(picture);
        return postRepo.updatePost(post);
    }

}