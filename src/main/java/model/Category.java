package model;



public class Category {
    private int categoryId;
    private String title;
    private String categoryContent;

    public Category(int categoryId, String title, String categoryContent) {
        this.categoryId = categoryId;
        this.title = title;
        this.categoryContent = categoryContent;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getTitle() {
        return title;
    }

    public String getCategoryContent() {
        return categoryContent;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setCategoryContent(String categoryContent) {
        this.categoryContent = categoryContent;
    }

}
