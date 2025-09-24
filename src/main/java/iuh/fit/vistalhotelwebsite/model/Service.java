package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "services")
public class Service {
    @Id
    @Column(name = "service_id")
    private String serviceID;

    @Column(name = "service_name")
    private String serviceName;

    private String description;

    private double price;

    private boolean availability;

    private String serviceHours;

    @Enumerated(EnumType.STRING)
    private ServiceCategory serviceCategory;
}
