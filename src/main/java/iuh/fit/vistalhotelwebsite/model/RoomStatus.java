package iuh.fit.vistalhotelwebsite.model;

public enum RoomStatus {
    AVAILABLE("AVAILABLE"),
    BOOKED("BOOKED"),
    CLEANING("CLEANING"),
    MAINTENANCE("MAINTENANCE");

    private String roomStatus;

    RoomStatus(String roomStatus) {
        this.roomStatus = roomStatus;
    }

    @Override
    public String toString() {
        return roomStatus;
    }
}
