package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "vouchers")
public class Voucher {
    @Id
    @Column(name = "voucher_id")
    private String voucherID;

    @Column(name = "voucher_name")
    private String voucherName;

    @Column(name = "discount_percentage")
    private double discountPercentage;

    @Column(name = "discount_value")
    private double discountValue;

    @Column(name = "start_date")
    private LocalDate startDate;

    @Column(name = "end_date")
    private LocalDate endDate;

    @Column(name = "discount_type")
    private String discountType;

    @Column(name = "is_active")
    private boolean isActive;
}
