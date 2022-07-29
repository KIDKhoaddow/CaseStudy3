package model;


public class Tag {
    private int tagId;
    private String tagTitle;
    private String tagContent;

    public Tag(int tagId, String tagTitle, String tagContent) {
        this.tagId = tagId;
        this.tagTitle = tagTitle;
        this.tagContent = tagContent;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public String getTagTitle() {
        return tagTitle;
    }

    public void setTagTitle(String tagTitle) {
        this.tagTitle = tagTitle;
    }

    public String getTagContent() {
        return tagContent;
    }

    public void setTagContent(String tagContent) {
        this.tagContent = tagContent;
    }
}
