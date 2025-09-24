package iuh.fit.vistalhotelwebsite.model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "booking_services")
public class BookingService {
    @Id
//    @ManyToOne
//    @JoinColumn(name = "service_id")
    private Service service;

    @Id
    //    @ManyToOne
//    @JoinColumn(name = "booking_id")
//    private Booking booking;

    @Column(name = "service_price")
    private double servicePrice;

    private int quantity;

    @Column(name = "total_amount")
    private double totalAmount;

    @EqualsAndHashCode
    @AllArgsConstructor
    @NoArgsConstructor
    public static class BookingServiceId {
        private Service service;
//        private Booking booking;
    }
}
