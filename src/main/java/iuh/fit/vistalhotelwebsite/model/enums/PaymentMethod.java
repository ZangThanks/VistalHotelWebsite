package iuh.fit.vistalhotelwebsite.model.enums;

public enum PaymentMethod {
    VNPAY_QR("VNPAY QR"),
    CREDIT_CARD("CREDIT CARD"),
    BANK_TRANSFER("BANK TRANSFER"),
    CASH("CASH");

    private String paymentMethod;

    PaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    @Override
    public String toString() {
        return paymentMethod;
    }
}
