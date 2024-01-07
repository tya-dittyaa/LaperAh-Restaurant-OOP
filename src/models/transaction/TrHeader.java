package models.transaction;

public class TrHeader{
    int transactionID = 0;
    String customerName = null;
    String status = null;
    
    public TrHeader(int transactionID, String customerName, String status) {
        this.transactionID = transactionID;
        this.customerName = customerName;
        this.status = status;
    }
}
