package Service;

import DAO.CategoryRepository;
import model.Category;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class CategoryService {

    private final CategoryRepository categoryRepository = new CategoryRepository();

    public List<Category> findAllCategory(HttpServletRequest request , HttpServletResponse response){
        List<Category> categoryList;
        categoryList = categoryRepository.findAll(request , response);
        return categoryList;
    }
}
