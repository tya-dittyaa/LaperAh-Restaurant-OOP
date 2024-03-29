package models.transaction;

public class TrDetailSeat extends TrHeader {
    private String seatType = null;
    private int totalPerson = 0;

    public TrDetailSeat(int transactionID, String customerName, String status, String seatType, int totalPerson) {
        super(transactionID, customerName, status);
        this.seatType = seatType;
        this.totalPerson = totalPerson;
    }

    public String getSeatType() {
        return seatType;
    }

    public void setSeatType(String seatType) {
        this.seatType = seatType;
    }

    public int getTotalPerson() {
        return totalPerson;
    }

    public void setTotalPerson(int totalPerson) {
        this.totalPerson = totalPerson;
    }

}
