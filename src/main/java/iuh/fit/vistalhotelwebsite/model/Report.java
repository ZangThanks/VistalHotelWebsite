package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
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

    @Column(name = "report_type")
    private ReportType reportType;

    @Column(name = "generated_date")
    private LocalDateTime generatedDate;

    @Column(name = "report_period")
    private String reportPeriod;
}
