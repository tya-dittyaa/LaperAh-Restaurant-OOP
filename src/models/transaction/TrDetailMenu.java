package models.transaction;

public class TrDetailMenu extends TrHeader{
    private int quantity = 0;

    public TrDetailMenu(int transactionID, String customerName, String status, int quantity) {
        super(transactionID, customerName, status);
        this.quantity = quantity;
    }
}
