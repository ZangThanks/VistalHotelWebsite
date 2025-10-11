package iuh.fit.vistalhotelwebsite.service;

import iuh.fit.vistalhotelwebsite.model.User;

public interface NotifierService {
    void sendWelcome(User user);              // đăng ký mới
    void sendWelcomeBack(User user);          // đăng nhập
    String sendOtp(User user, String to);     // quên mật khẩu (trả về mã)
    boolean verifyEmailExists(String email);  // kiểm tra MX/SMTP
    void notifyPasswordChanged(User user);
}
