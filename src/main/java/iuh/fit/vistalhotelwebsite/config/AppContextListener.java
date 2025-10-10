package iuh.fit.vistalhotelwebsite.config;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {
    @Override public void contextInitialized(ServletContextEvent sce) {
        OAuthConfig.init(sce.getServletContext());
    }
}
