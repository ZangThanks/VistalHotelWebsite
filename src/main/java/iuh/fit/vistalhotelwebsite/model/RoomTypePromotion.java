package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "room_type_promotions")
public class RoomTypePromotion {

    @Id
    @Column(name = "room_type_id")
    private String roomTypeID;

    @Id
    @Column(name = "promotion_id")
    private String promotionID;

    @Column(name = "discount_value")
    private double discountValue;

    @Column(name = "start_date")
    private LocalDate startDate;

    @Column(name = "end_date")
    private LocalDate endDate;
}
