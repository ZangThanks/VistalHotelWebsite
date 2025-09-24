package iuh.fit.vistalhotelwebsite.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;
import java.util.Objects;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "room_types")
public class RoomType {
    @Id
    @Column(name = "room_type_id")
    private String roomTypeID;

    @Column(name = "type_name")
    private String typeName;

    private String description;

    private double area;

    //Số lượng người lưu trú tối đa
    @Column(name = "max_occupancy")
    private int maxOccupancy;

    //Tiện nghi (máy lạnh, nước nóng, ...)
    private List<String> amenties;

    private double basePrice;

    private List<Objects> images;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "room_number")
    private List<Room> rooms;
}
