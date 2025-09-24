package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "promotions")
public class Promotion {
    @Id
    @Column(name = "promotion_id")
    private String promotionID;

    @Column(name = "promotion_name")
    private String promotionName;

    private String description;

    @Column(name = "discount_type")
    private String discountType;

    @Column(name = "is_active")
    private boolean isActive;

    @ToString.Exclude
    @OneToMany(mappedBy = "promotion")
    private List<RoomTypePromotion> roomTypePromotions;
}
