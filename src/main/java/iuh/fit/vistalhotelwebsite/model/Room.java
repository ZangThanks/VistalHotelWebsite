package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
@Table(name = "rooms")
public class Room {
    @Id
    @Column(name = "room_number")
    private String roomNumber;
}
