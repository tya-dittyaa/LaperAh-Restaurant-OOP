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

  public int insertOrder(String customerName, ArrayList<String> itemNames, ArrayList<Integer> quantityEach) {
    // add to db
    // change status to in order
    return 0;
  }

  public void printBill(String customerName) {
    int total = 0; // each items' price * quantity

    System.out.println("[Laper Ah App]");
    System.out.println("--------------------------");
    System.out.println("Nama Barang\n\n Jumlah");
    // get items price & quantity from db
    System.out.println("--------------------------");
    System.out.println("\n\n\n" + total);
    System.out.println("--------------------------");
    System.out.println("\nTHANK YOU!");
  }
}
