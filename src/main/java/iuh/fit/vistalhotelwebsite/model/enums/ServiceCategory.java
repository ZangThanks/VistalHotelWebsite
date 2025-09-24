package iuh.fit.vistalhotelwebsite.model.enums;

public enum ServiceCategory {
    FOOD_BEVERAGE("FOOD BEVERAGE"),
    LAUNDRY("LAUNDRY");

    private String serviceCategory;

    ServiceCategory(String serviceCategory) {
        this.serviceCategory = serviceCategory;
    }

    @Override
    public String toString() {
        return serviceCategory;
    }
}
