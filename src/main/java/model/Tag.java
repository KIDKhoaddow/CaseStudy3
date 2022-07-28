package model;

import javax.xml.soap.Text;

public class Tag {
    private int tagId;
    private String tagTitle;
    private Text tagContent;

    public Tag(int tagId, String tagTitle, Text tagContent) {
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

    public Text getTagContent() {
        return tagContent;
    }

    public void setTagContent(Text tagContent) {
        this.tagContent = tagContent;
    }
}
