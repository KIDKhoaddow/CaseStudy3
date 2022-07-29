package model;



public class Category {
    private int categoryId;
    private String categoryTitle;
    private String categoryContent;

    public Category(int categoryId, String categoryTitle, String categoryContent) {
        this.categoryId = categoryId;
        this.categoryTitle = categoryTitle;
        this.categoryContent = categoryContent;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getCategoryTitle() {
        return categoryTitle;
    }

    public String getCategoryContent() {
        return categoryContent;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setCategoryTitle(String categoryTitle) {
        this.categoryTitle = categoryTitle;
    }

    public void setCategoryContent(String categoryContent) {
        this.categoryContent = categoryContent;
    }

}
