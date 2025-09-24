package iuh.fit.vistalhotelwebsite.model;

import iuh.fit.vistalhotelwebsite.model.enums.BookingStatus;
import iuh.fit.vistalhotelwebsite.model.enums.PaymentStatus;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "bookings")
public class Booking {
    @Id
    @Column(name = "booking_id")
    private String bookingID;

    @Column(name = "check_in_date")
    private LocalDateTime checkInDate;

    @Column(name = "check_out_date")
    private LocalDateTime checkOutDate;

    @Column(name = "number_of_guests")
    private int numberOfGuests;

    @Enumerated(EnumType.STRING)
    private BookingStatus status;

    @Column(name = "special_requests", columnDefinition = "NVARCHAR(255)")
    private String specialRequests;

    @Column(name = "booking_date")
    private LocalDateTime bookingDate;

    @Column(name = "cancellation_date")
    private LocalDateTime cancellationDate;

    @Column(name = "hourly_rate")
    private double hourlyRate;

    private int duration;

    @Column(name = "package_type")
    private String packageType;

    @Column(name = "total_amount")
    private double totalAmount;

    @Enumerated(EnumType.STRING)
    private PaymentStatus paymentStatus;

    @Column(name = "total_cost")
    private double totalCost;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @ToString.Exclude
    @OneToMany(mappedBy = "booking")
    private List<BookingDetail> bookingDetails;

    @ToString.Exclude
    @OneToMany(mappedBy = "booking")
    private List<MaintenanceRequest> maintenanceRequests;
}
