package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "rooms")
public class Room {
    @Id
    @Column(name = "room_number")
    private String roomNumber;

    private int floor;

    @Enumerated(EnumType.STRING)
    private RoomStatus status;

    @Column(name = "last_cleaned")
    private LocalDateTime lastCleaned;

    private String notes;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "room_number")
    private RoomType roomType;
}
