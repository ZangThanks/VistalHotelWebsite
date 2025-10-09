package iuh.fit.vistalhotelwebsite.dao;

import iuh.fit.vistalhotelwebsite.model.Employee;
import jakarta.persistence.EntityManager;

public class EmployeeDAO extends GenericDAO<Employee, String> {

    public EmployeeDAO() {
        super(Employee.class);
    }

    public EmployeeDAO(EntityManager em) {
        super(em, Employee.class);
    }

    // Find employee by email
    public Employee findByEmail(String email) {
        try {
            return em.createQuery("SELECT e FROM Employee e WHERE e.email = :email", Employee.class)
                    .setParameter("email", email)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception e) {
            return null;
        }
    }

    // Find employee by phone
    public Employee findByPhone(String phone) {
        try {
            return em.createQuery("SELECT e FROM Employee e WHERE e.phone = :phone", Employee.class)
                    .setParameter("phone", phone)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception e) {
            return null;
        }
    }

    // Find employee by username
    public Employee findByUserName(String userName) {
        try {
            return em.createQuery("SELECT e FROM Employee e WHERE e.userName = :userName", Employee.class)
                    .setParameter("userName", userName)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception e) {
            return null;
        }
    }
}


