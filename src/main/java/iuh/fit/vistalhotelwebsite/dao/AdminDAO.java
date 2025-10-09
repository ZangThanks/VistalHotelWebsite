package iuh.fit.vistalhotelwebsite.dao;

import iuh.fit.vistalhotelwebsite.model.Admin;
import jakarta.persistence.EntityManager;

public class AdminDAO extends GenericDAO<Admin, String> {

    public AdminDAO() {
        super(Admin.class);
    }

    public AdminDAO(EntityManager em) {
        super(em, Admin.class);
    }

    // Find admin by email
    public Admin findByEmail(String email) {
        try {
            return em.createQuery("SELECT a FROM Admin a WHERE a.email = :email", Admin.class)
                    .setParameter("email", email)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception e) {
            return null;
        }
    }

    // Find admin by phone
    public Admin findByPhone(String phone) {
        try {
            return em.createQuery("SELECT a FROM Admin a WHERE a.phone = :phone", Admin.class)
                    .setParameter("phone", phone)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception e) {
            return null;
        }
    }


    // Find admin by username
    public Admin findByUserName(String userName) {
        try {
            return em.createQuery("SELECT a FROM Admin a WHERE a.userName = :userName", Admin.class)
                    .setParameter("userName", userName)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception e) {
            return null;
        }
    }
}


