/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ASUS
 */
public class Email {
    // Email: namdhse172173@fpt.edu.vn
    // Password: kqjxoixgtcdvywld

    private static final String EMAIL = "lachimolalasii1410@gmail.com";
    private static final String PASSWORD = "mmkwclnabfwtfpub";

    public static boolean sendEmail(String to, String title, String content) {
        String from = EMAIL;
        String password = PASSWORD;
        // Properties : khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
        props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
//        String host = "smtp.elasticemail.com";
//        String username = "lachimolalasii1410@gmail.com";
//        String passwordHost = "E7449E3537867709E2A0954D3CBC32190107";
//        int smtpPort = 2525;
//
//        Properties properties = System.getProperties();
//
//        properties.setProperty("mail.smtp.host", host);
//        properties.setProperty("mail.smtp.port", String.valueOf(smtpPort));
//
//        properties.setProperty("mail.smtp.auth", "true");
//        properties.setProperty("mail.smtp.auth", username);
//        properties.setProperty("mail.smtp.auth", passwordHost);
// create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // TODO Auto-generated method stub
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi
            msg.setFrom(from);

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject(title);

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Quy định email nhận phản hồi
            // msg.setReplyTo(InternetAddress.parse(from, false))
            // Nội dung
            msg.setContent(content, "text/HTML; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");
            return true;
        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
            return false;
        }
    }

    public static String templateEmail(String rootPath, String username, String code) {
        return "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "    <head>\n"
                + "        <meta charset=\"UTF-8\" />\n"
                + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n"
                + "        <title>Pursuit</title>\n"
                + "    </head>\n"
                + "    <body>\n"
                + "        <a href=" + rootPath + "/MainController?action=Verify&username=" + username + "&code=" + code + ">\n"
                + "            Click here to verify your account!\n"
                + "        </a>\n"
                + "    </body>\n"
                + "</html>";
    }

    public static String createEmailContent(String username, String email) {
        String content = "<!DOCTYPE html>\n"
                + "<html>\n"
                + "<head>\n"
                + "<title>Thông báo đăng ký thành công - NaneShop</title>\n"
                + "<style>\n"
                + "/* Thiết lập kiểu cho các phần tử */\n"
                + "body {\n"
                + "    margin: 0;\n"
                + "    padding: 0;\n"
                + "    font-family: Arial, sans-serif;\n"
                + "    background-color: #f7f7f7;\n"
                + "}\n"
                + ".container {\n"
                + "    width: 600px;\n"
                + "    margin: 0 auto;\n"
                + "    padding: 20px;\n"
                + "    background-color: #ffffff;\n"
                + "    border-radius: 5px;\n"
                + "    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);\n"
                + "}\n"
                + ".header {\n"
                + "    text-align: center;\n"
                + "    background-color: #0066cc;\n"
                + // Màu nền đầu tiên (#0066cc)
                "    padding: 20px;\n"
                + "}\n"
                + ".header h1 {\n"
                + "    color: #ffffff;\n"
                + // Màu chữ đầu tiên (#ffffff)
                "    font-size: 36px;\n"
                + "    margin-bottom: 10px;\n"
                + "}\n"
                + ".content {\n"
                + "    padding: 20px;\n"
                + "    background-color: #ffffff;\n"
                + "}\n"
                + ".content p {\n"
                + "    color: #333333;\n"
                + "    font-size: 16px;\n"
                + "    margin-bottom: 10px;\n"
                + "}\n"
                + ".footer {\n"
                + "    text-align: center;\n"
                + "    background-color: #f2f2f2;\n"
                + "    padding: 20px;\n"
                + "}\n"
                + ".footer p {\n"
                + "    color: #666666;\n"
                + "    font-size: 14px;\n"
                + "    margin-bottom: 10px;\n"
                + "}\n"
                + "/* Thiết lập kiểu cho liên kết */\n"
                + ".button {\n"
                + "    display: inline-block;\n"
                + "    padding: 10px 20px;\n"
                + "    background-color: #0066cc;\n"
                + // Màu nút (#0066cc)
                "    color: #ffffff;\n"
                + "    text-decoration: none;\n"
                + "    border-radius: 5px;\n"
                + "}\n"
                + ".button:hover {\n"
                + "    background-color: #0077ff;\n"
                + // Màu khi di chuột vào nút (#0077ff)
                "}\n"
                + "</style>\n"
                + "</head>\n"
                + "<body>\n"
                + "<div class=\"container\">\n"
                + "<div class=\"header\">\n"
                + "<h1>Thông báo đăng ký thành công</h1>\n"
                + "</div>\n"
                + "<div class=\"content\">\n"
                + "<p>Xin chào " + username + ",</p>\n"
                + "<p>Cảm ơn bạn đã đăng ký tài khoản với email: " + email + ".</p>\n"
                + "<p>Bạn đã trở thành thành viên của trang web NaneShop.</p>\n"
                + "<p>Hãy khám phá trang web để lựa chọn sản phẩm mà bạn yêu thích.</p>\n"
                + "<p>Cảm ơn bạn đã lựa chọn tham gia cùng chúng tôi.</p>\n"
                + "<p>Chúc bạn có một buổi mua sắm vui vẻ.</p>\n"
                + "<p>Trân trọng,</p>\n"
                + "<p>Đội ngũ Nane</p>\n"
                + "<p>\n"
                + "<a href=\"https://nane.com\" class=\"button\">Truy cập Nane</a>\n"
                + "</p>\n"
                + "</div>\n"
                + "<div class=\"footer\">\n"
                + "<p>Email này được gửi tự động, vui lòng không trả lời.</p>\n"
                + "</div>\n"
                + "</div>\n"
                + "</body>\n"
                + "</html>";

        return content;
    }

}
