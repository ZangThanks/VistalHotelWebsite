package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@AttributeOverride(name = "id", column = @Column(name = "admin_id"))
@Table(name = "admins")
public class Admin extends User{

    @Column(name = "admin_level")
    private int adminLevel;

    @ElementCollection
    @CollectionTable(name = "admin_permissions", joinColumns = @JoinColumn(name = "user_id"))
    private List<String> permissions;

    @ToString.Exclude
    @OneToMany(mappedBy = "admin")
    private List<Promotion> promotions;
}
