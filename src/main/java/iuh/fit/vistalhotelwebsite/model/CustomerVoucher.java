package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "customer_vouchers")
public class CustomerVoucher {
    @Id
    @Column(name = "customer_id")
    private String customerID;

    @Id
    @Column(name = "voucher_id")
    private String voucherID;

    private boolean state;
}
