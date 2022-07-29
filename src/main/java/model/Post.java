package model;

import javax.xml.soap.Text;

public class Post {
    private   int postId;
    private int authorId;
    private String postTitle;
    private String postSummary;
    private  String postContent;
    private String postPicture;
    private String postCreateAt;
    private String postUpdateAt;
    private  Status postStatus;

    public Post(int postId, int authorId, String postTitle, String postSummary, String postContent,
                String postPicture, String postCreateAt, String postUpdateAt) {
        this.postId = postId;
        this.authorId = authorId;
        this.postTitle = postTitle;
        this.postSummary = postSummary;
        this.postContent = postContent;
        this.postPicture = postPicture;
        this.postCreateAt = postCreateAt;
        this.postUpdateAt = postUpdateAt;
        this.postStatus=Status.PENDING;
    }

    public int getPostId() {
        return postId;
    }

    public int getAuthorId() {
        return authorId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public String getPostSummary() {
        return postSummary;
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

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public void setPostSummary(String postSummary) {
        this.postSummary = postSummary;
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
}