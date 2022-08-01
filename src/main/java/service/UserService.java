package service;

import DAO.LoginRepository;
import model.User;

public class UserService {
    LoginRepository loginRepository = new LoginRepository();
    public User checkUserLogin(String user_email){
        return loginRepository.findIdUserByUsermail(user_email);
    }
    public User checkUserRegister(String user_email){
        return loginRepository.findIdUserByUsermail(user_email);
    }
}
