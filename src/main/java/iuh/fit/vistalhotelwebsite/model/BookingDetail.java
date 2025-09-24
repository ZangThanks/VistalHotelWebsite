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
@IdClass(BookingDetail.BookingDetailId.class)
@Table(name = "booking_details")
public class BookingDetail {
    @Id
    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    @Id
    @ManyToOne
    @JoinColumn(name = "booking_id")
    private Booking booking;

    @Column(name = "room_price")
    private double roomPrice;

    @EqualsAndHashCode
    @AllArgsConstructor
    @NoArgsConstructor
    public static class BookingDetailId {
        private Room room;
        private Booking booking;
    }
}
