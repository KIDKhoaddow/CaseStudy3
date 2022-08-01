package model;

public class User {
   private int userId;
    private String userEmail;
    private String userName;
    private String userPassword;
    private String userAddress;
    private String userPhone;
    private String userDOB;
    private String userRegisDate;
    private String userLastLogin;
    private  boolean status;

    public User() {
    }

    public User(String userName) {
        this.userName = userName;
    }

    public User(int userId, String userEmail, String userPassword) {
        this.userId = userId;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
    }

    public User(String userEmail, String userName, String userPassword) {
        this.userEmail = userEmail;
        this.userName = userName;
        this.userPassword = userPassword;
    }

    public User(int userId, String userEmail, String userName, String userPassword, String userAddress, String userPhone, String userDOB, String userRegisDate, String userLastLogin, boolean status) {
        this.userId = userId;
        this.userEmail = userEmail;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.userDOB = userDOB;
        this.userRegisDate = userRegisDate;
        this.userLastLogin = userLastLogin;
        this.status = status;
    }

    public User(String userEmail, String userName, String userPassword, String userAddress, String userPhone,
                String userDOB, String userRegisDate, String userLastLogin, boolean status) {
        this.userEmail = userEmail;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.userDOB = userDOB;
        this.userRegisDate = userRegisDate;
        this.userLastLogin = userLastLogin;
        this.status = status;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserDOB() {
        return userDOB;
    }

    public void setUserDOB(String userDOB) {
        this.userDOB = userDOB;
    }

    public String getUserRegisDate() {
        return userRegisDate;
    }

    public void setUserRegisDate(String userRegisDate) {
        this.userRegisDate = userRegisDate;
    }

    public String getUserLastLogin() {
        return userLastLogin;
    }

    public void setUserLastLogin(String userLastLogin) {
        this.userLastLogin = userLastLogin;
    }

    public boolean isStatus() {
        return status;
    }

    public Status getStatus(){
        if(isStatus()){
            return Status.ONLINE;
        }
        return Status.OFFLINE;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}

