package iuh.fit.vistalhotelwebsite.model.enums;

public enum RequestStatus {
    PENDING("PEDING"),
    COMPLETED("COMPLETED"),
    FAILED("FAILED");

    private String requestStatus;

    private RequestStatus(String requestStatus) {
        this.requestStatus = requestStatus;
    }

    public String getRequestStatus() {
        return requestStatus;
    }

    @Override
    public String toString() {
        return requestStatus;
    }
}
