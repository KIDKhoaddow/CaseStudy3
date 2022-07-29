package service;

import DAO.PostRepo;
import model.Post;

import java.util.ArrayList;

public class PostService {
    private final PostRepo postRepo = new PostRepo();
    public void creatPost(Post post){
        postRepo.insertPost(post);
    }

    public ArrayList<Post> findAllBYUser(int authorId) {
        return postRepo.findAllByUser(authorId);
    }

//    public int findIdByUser(String name) {
//        return postRepo.findIdByUser(name);
//    }
}
