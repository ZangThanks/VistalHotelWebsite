package iuh.fit.vistalhotelwebsite.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Booking {
    private String bookingID;
    private LocalDateTime checkInDate;
    private LocalDateTime checkOutDate;
    private int numberOfGuests;
    private BookingStatus status;
    private String specialRequests;
    private LocalDateTime bookingDate;
    private LocalDateTime cancellationDate;
    private double hourlyRate;
    private int duration;
    private String packageType;
    private double totalAmount;
    private PaymentStatus paymentStatus;
    private double totalCost;
}
