package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "reports")
public class Report {
    @Id
    @Column(name = "report_id")
    private String reportID;

    @Enumerated(EnumType.STRING)
    @Column(name = "report_type")
    private ReportType reportType;

    @Column(name = "generated_date")
    private LocalDateTime generatedDate;

    @Column(name = "report_period")
    private String reportPeriod;

    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;
}
