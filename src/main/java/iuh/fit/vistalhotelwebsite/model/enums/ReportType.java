package iuh.fit.vistalhotelwebsite.model.enums;

public enum ReportType {
    REVENUE("REVENUE"),
    OCCUPANCY("OCCUPANCY"),
    CUSSTOMER("CUSTOMER"),
    SERVICE("SERVICE"),
    MAINTENANCE("MAINTENANCE");

    private String reportType;

    public String getReportType() {
        return reportType;
    }

    private ReportType(String reportType) {
        this.reportType = reportType;
    }

    @Override
    public String toString() {
        return reportType;
    }
}
