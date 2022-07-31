package model;

import javax.print.DocFlavor;

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
    private String userAvatar;
    private boolean status;
    private boolean verify = true;

    public User() {
    }

    public User(String userEmail, String userPassword) {
        this.userEmail = userEmail;
        this.userPassword = userPassword;
    }

    public User(String userEmail, String userPassword, String userRegisDate) {
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userRegisDate = userRegisDate;
    }

    public User(int userId, String userEmail, String userName, String userPassword,
                String userAddress, String userPhone, String userDOB, String userRegisDate,
                String userLastLogin, String userAvatar, boolean status, boolean verify) {
        this.userId = userId;
        this.userEmail = userEmail;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.userDOB = userDOB;
        this.userRegisDate = userRegisDate;
        this.userLastLogin = userLastLogin;
        this.userAvatar = userAvatar;
        this.status = status;
        this.verify = verify;
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

    public String getUserEmail() {
        return userEmail;
    }

    public String getUserName() {
        return userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public String getUserDOB() {
        return userDOB;
    }

    public String getUserRegisDate() {
        return userRegisDate;
    }

    public String getUserLastLogin() {
        return userLastLogin;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public void setUserName(String userName) {
        if(userName!=null){
            this.userName = userName;
        }else {
            this.userName="";
        }
    }

    public void setUserPassword(String userPassword) {
        if (userPassword != null) {
            this.userPassword = userPassword;
        }
    }

    public void setUserAddress(String userAddress) {
        if(userAddress!=null){
            this.userAddress = userAddress;
        }else {
            this.userAddress="";
        }
    }

    public void setUserPhone(String userPhone) {
        if(userPhone!=null){
            this.userPhone = userPhone;
        }else {
            this.userPhone="";
        }
    }

    public void setUserDOB(String userDOB) {
        if(userDOB!=null){
            this.userDOB = userDOB;
        }else {
            this.userDOB="";
        }
    }

    public void setUserRegisDate(String userRegisDate) {
        if(userRegisDate!=null){
            this.userRegisDate = userRegisDate;
        }else {
            this.userRegisDate="";
        }
    }

    public void setUserLastLogin(String userLastLogin) {
        this.userLastLogin = userLastLogin;
    }

    public boolean isStatus() {
        return status;
    }

    public Status getStatus() {
        if (isStatus()) {
            return Status.ONLINE;
        }
        return Status.OFFLINE;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }

    public boolean isVerify() {
        return verify;
    }

    public void setVerify(boolean verify) {
        this.verify = verify;
    }
}

