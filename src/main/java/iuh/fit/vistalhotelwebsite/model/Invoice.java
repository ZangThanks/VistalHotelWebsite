package iuh.fit.vistalhotelwebsite.model;

import iuh.fit.vistalhotelwebsite.model.enums.InvoiceType;
import iuh.fit.vistalhotelwebsite.model.enums.PaymentMethod;
import iuh.fit.vistalhotelwebsite.model.enums.PaymentStatus;

import java.time.LocalDateTime;
import java.util.List;

public class Invoice {
    private String invoiceID;
    private String bookingID;
    private LocalDateTime issueDate;
    private InvoiceType type;
    private double totalAmount;
    private PaymentStatus paymentStatus;
    private PaymentMethod paymentMethod;
    private String description;
    private List<InvoiceDetail> details;
    private LocalDateTime paidDate;
    private String transactionID;
}
