package iuh.fit.vistalhotelwebsite.config;

import iuh.fit.vistalhotelwebsite.service.NotifierService;
import iuh.fit.vistalhotelwebsite.service.impl.NotifierServiceImpl;
import iuh.fit.vistalhotelwebsite.util.ConfigUtil;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Cho ConfigUtil & OAuthConfig đọc init-params + properties
        ConfigUtil.init(sce.getServletContext());
        OAuthConfig.init(sce.getServletContext());

        // NotifierService cho toàn app
        NotifierService notifier = new NotifierServiceImpl();
        sce.getServletContext().setAttribute("notifier", notifier);
    }
}
