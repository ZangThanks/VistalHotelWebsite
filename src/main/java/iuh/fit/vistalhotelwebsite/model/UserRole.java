package iuh.fit.vistalhotelwebsite.model;

public enum UserRole {
    ADMIN("Admin"), EMPLOYEE("Employee"), CUSTOMER("Customer"), GUEST("Guest");
    private String role;


    UserRole(String role) {
        this.role = role;
    }

    public String getRole() {
        return role;
    }

    @Override
    public String toString() {
        return "UserRole{" +
                "role='" + role + '\'' +
                '}';
    }
}
