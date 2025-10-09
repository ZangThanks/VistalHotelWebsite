package iuh.fit.vistalhotelwebsite.dao;

import iuh.fit.vistalhotelwebsite.model.Customer;
import jakarta.persistence.EntityManager;

public class CustomerDAO extends GenericDAO<Customer, String> {

    public CustomerDAO() {
        super(Customer.class);
    }

    public CustomerDAO(EntityManager em) {
        super(em, Customer.class);
    }

    // Find customer by email
    public Customer findByEmail(String email) {
        try {
            return em.createQuery("SELECT c FROM Customer c WHERE c.email = :email", Customer.class)
                    .setParameter("email", email)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception e) {
            return null;
        }
    }

    // Find customer by phone
    public Customer findByPhone(String phone) {
        try {
            return em.createQuery("SELECT c FROM Customer c WHERE c.phone = :phone", Customer.class)
                    .setParameter("phone", phone)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception e) {
            return null;
        }
    }

    // Find customer by username
    public Customer findByUserName(String userName) {
        try {
            return em.createQuery("SELECT c FROM Customer c WHERE c.userName = :userName", Customer.class)
                    .setParameter("userName", userName)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception e) {
            return null;
        }
    }
}



