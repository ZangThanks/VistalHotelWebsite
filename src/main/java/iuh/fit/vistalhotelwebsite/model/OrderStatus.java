package iuh.fit.vistalhotelwebsite.model;

public enum OrderStatus {
    PLACE("PLACE"),
    PREPARING("PREPARING"),
    READY("READY"),
    DELIVERED("DELIVERED"),
    CANCELLED("CANCELLED");

    private String orderStatus;

    OrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Override
    public String toString() {
        return orderStatus;
    }
}
