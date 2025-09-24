package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
@Table(name = "early_checkins")
public class EarlyCheckin {
    @Id
    @Column(name = "request_id")
    private String requestID;

    @Column(name = "request_time")
    private LocalDateTime requestTime;

    @Column(name = "approval_status")
    private String approvalStatus;

    @Column(name = "additional_fee")
    private double additionalFee;

    @Column(name = "approve_by")
    private String approveBy;

    @Column(name = "request_date")
    private LocalDateTime requestDate;
}
