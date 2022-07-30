package model;



public class Post {
    private   int postId;
    private  int postCategoryId;
    private String postTitle;
    private  String postContent;
    private String postPicture;
    private String postCreateAt;
    private String postUpdateAt;
    private  Status postStatus;

    public Post(String postTitle, String postContent, String postPicture, String postCreateAt) {
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postPicture = postPicture;
        this.postCreateAt = postCreateAt;
    }

    public Post(int postId, String postTitle, String postContent, String postPicture, String postCreateAt) {
        this.postId = postId;
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postPicture = postPicture;
        this.postCreateAt = postCreateAt;
        this.postStatus=Status.PENDING;
    }

    public Post(int postId, String postTitle, String postContent,
                String postPicture, String postCreateAt, String postUpdateAt) {
        this.postId = postId;
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postPicture = postPicture;
        this.postCreateAt = postCreateAt;
        this.postUpdateAt = postUpdateAt;
        this.postStatus=Status.PENDING;
    }

    public Post(int postId, int postCategoryId, String postTitle, String postContent, String postPicture, String postCreateAt, String postUpdateAt, Status postStatus) {
        this.postId = postId;
        this.postCategoryId = postCategoryId;
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postPicture = postPicture;
        this.postCreateAt = postCreateAt;
        this.postUpdateAt = postUpdateAt;
        this.postStatus = postStatus;
    }

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
    public int getPostLikes(){
        return 0;
    }
    public int getPostComment(){
        return 0;
    }

}
