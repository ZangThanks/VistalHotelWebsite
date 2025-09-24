package iuh.fit.vistalhotelwebsite.model;

public enum RoomStatus {
    AVAILABLE("AVAILABLE"),
    BOOKED("BOOKED"),
    CLEANING("CLEANING"),
    MAINTENANCE("MAINTENANCE");

    private String roomStatus;

    private RoomStatus(String roomStatus) {
        this.roomStatus = roomStatus;
    }

    public String getRoomStatus() {
        return roomStatus;
    }

    @Override
    public String toString() {
        return roomStatus;
    }
}
