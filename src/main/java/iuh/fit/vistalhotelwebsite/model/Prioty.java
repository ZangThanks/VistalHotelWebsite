package iuh.fit.vistalhotelwebsite.model;

public enum Prioty {
    LOW("LOW"),
    MEDIUM("MEDIUM"),
    HIGH("HIGHT"),
    URGENT("URGENT"),
    CRITICAL("CRITICAL");

    private String prioty;

    private Prioty(String prioty) {
        this.prioty = prioty;
    }

    public String getPrioty() {
        return prioty;
    }

    @Override
    public String toString() {
        return prioty;
    }
}
