package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@Table(name = "customers")
public class Customer extends User{

    @Column(name = "birth_date")
    private LocalDate birthDate;
    private Gender gender;

    @Column(name = "loyalty_points")
    private int loyaltyPoints;

    @Column(name = "membership_level")
    private MemberShipLevel memberShipLevel;


}
