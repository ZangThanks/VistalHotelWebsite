package iuh.fit.vistalhotelwebsite;

import iuh.fit.vistalhotelwebsite.util.JPAUtil;

public class Runner {
    public static void main(String[] args) {
        EntityManager emf = JPAUtil.getEntityManager();
    }
}
