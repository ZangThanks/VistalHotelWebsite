package iuh.fit.vistalhotelwebsite.model.enums;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public enum BookingStatus {
    PENDING("Pending"),
    CHECKED_IN("Checked In"),
    CHECKED_OUT("Checked Out"),
    CANCELLED("Cancelled");

    private String status;
}
