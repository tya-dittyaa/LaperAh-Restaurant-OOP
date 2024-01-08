package services;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TransactionDAO;
import models.transaction.TrDetailMenu;
import models.transaction.TrHeader;

public class TransactionManagement {
  private TransactionDAO transactionDAO;

  public TransactionManagement(Connection connection) {
    this.transactionDAO = new TransactionDAO(connection);
  }

  public int insertReservation(String customerName, int totalTable, ArrayList<Integer> seatType,
      ArrayList<Integer> personPerTable) {
    return transactionDAO.insertReservation(customerName, totalTable, seatType, personPerTable);
  }

  public ArrayList<TrHeader> getTransacionHeaders(int branchId) {
    return transactionDAO.getTransacionHeaders(branchId);
  }

  public boolean insertOrder(TrDetailMenu trDetailMenu) {
    return transactionDAO.insertOrder(trDetailMenu);
  }

  public ArrayList<TrDetailMenu> getTransactionDetailMenu(int transactionId) {
    return transactionDAO.getTransactionDetailMenu(transactionId);
  }

  public boolean finalizedOrder(int transactionId) {
    return transactionDAO.finalizedOrder(transactionId);
  }
}
