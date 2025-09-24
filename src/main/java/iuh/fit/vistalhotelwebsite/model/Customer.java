package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.List;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString(callSuper = true)
@Table(name = "customers")
public class Customer extends User{

    @Column(name = "birth_date")
    private LocalDate birthDate;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    @Column(name = "loyalty_points")
    private int loyaltyPoints;

    @Column(name = "membership_level")
    @Enumerated(EnumType.STRING)
    private MemberShipLevel memberShipLevel;

    @ToString.Exclude
    @OneToMany(mappedBy = "customer")
    private List<CustomerVoucher> customerVouchers;

    @ToString.Exclude
    @OneToMany(mappedBy = "customer")
    private List<Booking> bookings;
}
