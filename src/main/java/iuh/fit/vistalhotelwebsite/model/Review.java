package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "reviews")
@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class Review {
    @Id
    @Column(name = "review_id")
    private String reviewID;

    private double rating;

    @Column(name = "room_quantity")
    private int roomQuantity;

    @Column(name = "service_quantity")
    private int serviceQuality;

    private int location;

    @Column(name = "value_for_money")
    private int valueForMoney;

    private String comment;

    @Column(name = "review_date")
    private LocalDateTime reviewDate;

    @Column(name = "is_anonymous")
    private boolean isAnonymous;

    private List<Object> images;
}
