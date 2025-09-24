package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@IdClass(CustomerVoucher.CustomerVoucherId.class)
@Table(name = "customer_vouchers")
public class CustomerVoucher {
    @Id
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @Id
    @ManyToOne
    @JoinColumn(name = "vouchers_id")
    private Voucher voucher;

    private boolean state;

    @EqualsAndHashCode
    @AllArgsConstructor
    @NoArgsConstructor
    public static class CustomerVoucherId {
        private Customer customer;
        private Voucher voucher;
    }
}
