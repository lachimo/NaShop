/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import google.GoogleDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import sample.dto.AccountDTO;
import sample.dto.RoleDTO;
import sample.utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class AccountDAO {

    private static final String LOGIN = "{CALL CheckLogin(?, ?)}";
    private static final String LOGIN_WITH_GOOGLE = "{CALL SaveGoogleData(?, ?, ?, ?, ?, ?, ?)}";
    private static final String DUPLICATE_USERNAME = "{CALL CheckDuplicateUsername(?, ?)}";
    private static final String DUPLICATE_EMAIL = "{CALL CheckDuplicateEmail(?, ?)}";
    private static final String REGISTER = "{CALL RegisterAccount(?, ?, ?)}";

    public AccountDTO checkLogin(String username, String password) throws SQLException {
//        AccountDTO account = new AccountDTO();
//        Lúc nãy ở đây account tạo ngay trên này nên giá trị k thể là null
//        nên khang mới tạo giá trị mặc định cho nó là null
        AccountDTO account = null;
        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();

            if (con != null) {
                cs = con.prepareCall(LOGIN);
                cs.setString(1, username);
                cs.setString(2, password);
                rs = cs.executeQuery();

                if (rs.next()) {
                    int accountId = rs.getInt("account_id");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("role_ID");

                    RoleDTO role = new RoleDTO();
                    role.setRoleId(roleID);
                    
//                    Và ở đây khi cần thì khởi tạo lại

                    account = new AccountDTO();
                    
                    account.setAccountId(accountId);
                    account.setRole(role);
                    account.setFullname(fullName);
                    account.setPassword(password);
                    account.setUsername(username);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (cs != null) {
                cs.close();
            }

            if (con != null) {
                con.close();
            }
        }
        return account;

    }

    public boolean loginWithGoogle(GoogleDTO gdto) throws SQLException {
        Connection con = null;
        CallableStatement cs = null;
        boolean check = false;

        try {
            con = DBUtils.getConnection();

            if (con != null) {
                cs = con.prepareCall(LOGIN_WITH_GOOGLE);
                cs.setString(1, gdto.getId());
                cs.setString(2, gdto.getEmail());
                cs.setString(3, gdto.getName());
                cs.setString(4, gdto.getGiven_name());
                cs.setString(5, gdto.getFamily_name());
                cs.setString(6, gdto.getPicture());
                cs.registerOutParameter(7, Types.BIT);
                cs.execute();
                check = cs.getBoolean(7);
            }
        } catch (Exception e) {
        } finally {
            if (cs != null) {
                cs.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return check;
    }

    public boolean checkDuplicate(String parameter, String type) throws SQLException {
        Connection con = null;
        CallableStatement cs = null;
        boolean check = false;

        try {
            con = DBUtils.getConnection();

            if (con != null) {
                switch (type) {
//                    case "EMAIL":
//                        cs = c.prepareCall(DUPLICATE_EMAIL);
//                        break;
                    case "USERNAME":
                        cs = con.prepareCall(DUPLICATE_USERNAME);
                        break;
                    case "EMAIL":
                        cs = con.prepareCall(DUPLICATE_EMAIL);
                        break;
                    default:
                        return check;
                }
                cs.setString(1, parameter);
                cs.registerOutParameter(2, Types.BIT);
                cs.execute();
                check = cs.getBoolean(2);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cs != null) {
                cs.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return check;
    }

    public boolean registerAccount(String username, String email, String password) throws SQLException {
 Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareStatement(REGISTER);
                ps.setString(1, email);
                ps.setString(2, username);
                ps.setString(3, password);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return check;
    }
}
