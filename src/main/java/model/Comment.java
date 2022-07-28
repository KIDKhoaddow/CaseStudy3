package model;

import javax.xml.soap.Text;

public class Comment {
    private int commentId;
    private int postId;
    private Text commentContent;
    private String createAt;

    public Comment(int commentId, int postId, Text commentContent, String createAt) {
        this.commentId = commentId;
        this.postId = postId;
        this.commentContent = commentContent;
        this.createAt = createAt;
    }

    public int getCommentId() {
        return commentId;
    }

    public int getPostId() {
        return postId;
    }

    public Text getCommentContent() {
        return commentContent;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public void setCommentContent(Text commentContent) {
        this.commentContent = commentContent;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }
}
