package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name = "employees")
public class Employee extends User{
    private String department;
    private String position;
    private double salary;
    private LocalDate hireDate;


}
