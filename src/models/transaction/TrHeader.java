package models.transaction;

public class TrHeader {
    int transactionID = 0;
    String customerName = null;
    String status = null;

    public TrHeader(int transactionID, String customerName, String status) {
        this.transactionID = transactionID;
        this.customerName = customerName;
        this.status = "In Reserve";
    }

    public int getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(int transactionID) {
        this.transactionID = transactionID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
