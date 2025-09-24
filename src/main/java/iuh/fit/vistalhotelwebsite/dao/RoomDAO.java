package iuh.fit.vistalhotelwebsite.dao;

import iuh.fit.vistalhotelwebsite.model.Room;
import jakarta.persistence.EntityManager;

public class RoomDAO extends GenericDAO<Room, String> {

    public RoomDAO(Class<Room> clazz) {
        super(clazz);
    }

    public RoomDAO(EntityManager em, Class<Room> clazz) {
        super(em, clazz);
    }
}
