package services;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TransactionDAO;

public class TransactionManagement {
  private TransactionDAO transactionDAO;

  public TransactionManagement(Connection connection) {
    this.transactionDAO = new TransactionDAO(connection);
  }

  public int insertReservation(String customerName, int totalTable, ArrayList<Integer> seatType,
      ArrayList<Integer> personPerTable) {
    return transactionDAO.insertReservation(customerName, totalTable, seatType, personPerTable);
  }
}
