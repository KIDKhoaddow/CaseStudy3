package model;


import DAO.PostRepo;

public class Post {
    private int postId;
    private String postCategory;
    private String postAuthor;
    private String postTitle;
    private String postContent;
    private String postPicture;
    private String postCreateAt;
    private String postUpdateAt;
    private Status postStatus;

public Post(){};

    public Post(String postTitle, String postContent, String postPicture, String postCreateAt) {
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postPicture = postPicture;
        this.postCreateAt = postCreateAt;
    }
    public Post(int postId, String postCategory, String postAuthor , String postTitle, String postCreateAt,String postUpdateAt,Status postStatus) {
        this.postId = postId;
        this.postCategory=postCategory;
        this.postAuthor=postAuthor;
        this.postTitle = postTitle;
        this.postCreateAt = postCreateAt;
        this.postUpdateAt=postUpdateAt;
        this.postStatus = postStatus;
    }

    public Post(int postId, String postTitle, String postContent, String postPicture, String postCreateAt) {
        this.postId = postId;
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postPicture = postPicture;
        this.postCreateAt = postCreateAt;
        this.postStatus = Status.PENDING;
    }

//    public Post(int postId, String postTitle, String postContent,
//                String postPicture, String postCreateAt, String postUpdateAt,Status status) {
//        this.postId = postId;
//        this.postTitle = postTitle;
//        this.postContent = postContent;
//        this.postPicture = postPicture;
//        this.postCreateAt = postCreateAt;
//        this.postUpdateAt = postUpdateAt;
//        this.postStatus = status;
//    }



    public int getPostId() {
        return postId;
    }


    public String getPostTitle() {
        return postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public String getPostPicture() {
        return postPicture;
    }

    public String getPostCreateAt() {
        return postCreateAt;
    }


    public String getPostUpdateAt() {
        return postUpdateAt;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }


    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public void setPostPicture(String postPicture) {
        this.postPicture = postPicture;
    }

    public void setPostCreateAt(String postCreateAt) {
        this.postCreateAt = postCreateAt;
    }

    public void setPostUpdateAt(String postUpdateAt) {
        this.postUpdateAt = postUpdateAt;
    }

    public Status getPostStatus() {
        return postStatus;
    }

    public void setPostStatus(Status postStatus) {
        this.postStatus = postStatus;
    }

    public int getPostLikes() {
        return PostRepo.countLikeOfPostById(postId);
    }

    public int getPostComment() {
        return 0;
    }

    public String getPostCategory() {
        return postCategory;
    }

    public void setPostCategory(String postCategory) {
        this.postCategory = postCategory;
    }

    public String getPostAuthor() {
        return postAuthor;
    }

    public void setPostAuthor(String postAuthor) {
        this.postAuthor = postAuthor;
    }
}
