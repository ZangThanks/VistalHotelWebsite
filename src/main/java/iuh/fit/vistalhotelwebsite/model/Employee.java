package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Table(name = "employees")
public class Employee extends User{

    private String department;

    private String position;

    private double salary;

    @Column(name = "hire_date")
    private LocalDate hireDate;

    @ToString.Exclude
    @OneToMany(mappedBy = "employee")
    private List<Report> reports;
}
