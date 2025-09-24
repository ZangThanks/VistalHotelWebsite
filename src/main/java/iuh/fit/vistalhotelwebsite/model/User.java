package iuh.fit.vistalhotelwebsite.model;

import iuh.fit.vistalhotelwebsite.model.enums.UserRole;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@MappedSuperclass
public abstract class User {
    @Id
    private String id;

    @Column(name = "user_name", columnDefinition = "NVARCHAR(255)")
    private String userName;

    private String password;

    private String email;

    private String phone;

    @Column(name = "full_name", columnDefinition = "NVARCHAR(255)")
    private String fullName;

    @Column(columnDefinition = "NVARCHAR(255)")
    private String address;

    @Enumerated(EnumType.STRING)
    private UserRole userRole;


}
