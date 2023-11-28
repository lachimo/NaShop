/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dto;

/**
 *
 * @author ASUS
 */
public class AccountDTO {
    private int accountId;
    private String fullname;
    private String firstName;
    private String lastName;
    private String phone;
    private String email;
    private String password;
    private String address;
    private String googleId;
    private String avatarURL;
    private String username;
    private RoleDTO role;

    public AccountDTO() {
    }

    public AccountDTO(int accountId, String fullname, String firstName, String lastName, String phone, String email, String password, String address, String googleId, String avatarURL, String username, RoleDTO role) {
        this.accountId = accountId;
        this.fullname = fullname;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.address = address;
        this.googleId = googleId;
        this.avatarURL = avatarURL;
        this.username = username;
        this.role = role;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGoogleId() {
        return googleId;
    }

    public void setGoogleId(String googleId) {
        this.googleId = googleId;
    }

    public String getAvatarURL() {
        return avatarURL;
    }

    public void setAvatarURL(String avatarURL) {
        this.avatarURL = avatarURL;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public RoleDTO getRole() {
        return role;
    }

    public void setRole(RoleDTO role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "AccountDTO{" + "accountId=" + accountId + ", fullname=" + fullname + ", firstName=" + firstName + ", lastName=" + lastName + ", phone=" + phone + ", email=" + email + ", password=" + password + ", address=" + address + ", googleId=" + googleId + ", avatarURL=" + avatarURL + ", username=" + username + ", role=" + role + '}';
    }
    
}
