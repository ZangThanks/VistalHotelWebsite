package iuh.fit.vistalhotelwebsite.service.impl;

import iuh.fit.vistalhotelwebsite.config.OAuthConfig;
import iuh.fit.vistalhotelwebsite.model.User;
import iuh.fit.vistalhotelwebsite.service.NotifierService;
import iuh.fit.vistalhotelwebsite.util.*;

import java.security.SecureRandom;

public class NotifierServiceImpl implements NotifierService {
    private final SecureRandom rnd = new SecureRandom();

    @Override
    public void sendWelcome(User u) {
        if (u == null) return;
        if (StringUtil.has(u.getEmail()))  MailService.sendWelcome(u.getEmail(), u.getFullName());
        else if (StringUtil.has(u.getPhone())) SmsService.sendWelcome(u.getPhone(), u.getFullName());
    }

    @Override
    public void sendWelcomeBack(User u) {
        if (u == null) return;
        if (StringUtil.has(u.getEmail()))  MailService.sendWelcomeBack(u.getEmail(), u.getFullName());
        else if (StringUtil.has(u.getPhone())) SmsService.sendWelcomeBack(u.getPhone(), u.getFullName());
    }

    @Override
    public String sendOtp(User u, String to) {
        String code = String.format("%06d", rnd.nextInt(1_000_000));
        boolean isEmail = ValidationUtil.isValidEmail(to);
        if (isEmail) MailService.sendOTP(to, code);
        else SmsService.sendOtp(to, code);
        return code;
    }

    @Override
    public boolean verifyEmailExists(String email) {
        String mode = OAuthConfig.env("EMAIL_CHECK_MODE", "LENIENT").toUpperCase(); // STRICT|LENIENT|OFF
        if (!ValidationUtil.isValidEmail(email)) return false;
        if ("OFF".equals(mode)) return true;

        EmailVerifierUtil.Result r = EmailVerifierUtil.checkDeliverable(email);
        return switch (mode) {
            case "STRICT"  -> r == EmailVerifierUtil.Result.DELIVERABLE;
            case "LENIENT" -> r == EmailVerifierUtil.Result.DELIVERABLE || r == EmailVerifierUtil.Result.UNKNOWN;
            default -> true;
        };
    }

    @Override
    public void notifyPasswordChanged(User u) {
        if (u == null) return;
        if (StringUtil.has(u.getEmail()))  MailService.sendPasswordChanged(u.getEmail(), u.getFullName());
        else if (StringUtil.has(u.getPhone())) SmsService.sendPasswordChanged(u.getPhone());
    }
}
