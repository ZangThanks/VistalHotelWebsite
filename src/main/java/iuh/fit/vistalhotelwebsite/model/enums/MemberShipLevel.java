package iuh.fit.vistalhotelwebsite.model.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@ToString
public enum MemberShipLevel {
    BRONZE("Bronze123"), SILVER("Silver"), GOLD("Gold"), PLATINUM("Platinum");
    private String level;
}
