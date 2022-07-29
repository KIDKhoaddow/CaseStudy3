package Service;

import DAO.UserRepository;
import model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    UserRepository userRepository = new UserRepository();

    ArrayList<User> users = new ArrayList<>();


    public List<User> findAllUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        List<User> userList;
        userList = userRepository.findAll(request, response);
        return userList;
    }
}
