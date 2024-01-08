package models.transaction;

public class TrDetailMenu extends TrHeader {
    private int menu_id = 0;
    private int quantity = 0;

    public TrDetailMenu(int transactionID, String customerName, String status, int menu_id, int quantity) {
        super(transactionID, customerName, status);
        this.menu_id = menu_id;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

}
