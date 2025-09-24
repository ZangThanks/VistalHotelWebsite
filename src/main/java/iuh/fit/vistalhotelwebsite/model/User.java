package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@Table(name = "users")
public abstract class User {
    @Id
    @Column(name = "user_id")
    private String userID;

    @Column(name = "username")
    private String userName;
    private String password;
    private String email;
    private String phone;

    @Column(name = "full_name")
    private String fullName;
    private String address;

    @Enumerated(EnumType.STRING)
    private UserRole userRole;


}
