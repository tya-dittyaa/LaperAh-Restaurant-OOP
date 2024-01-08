package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.Employee;
import models.transaction.TrDetailMenu;
import models.transaction.TrHeader;
import utils.MainUtilities;

public class TransactionDAO {
  private Connection connection;

  public TransactionDAO(Connection connection) {
    this.connection = connection;
  }

  public int insertReservation(String customerName, int totalTable, ArrayList<Integer> seatType,
      ArrayList<Integer> personPerTable) {
    Employee employee = MainUtilities.employeeLoginData;

    String query_trheader = "insert into transaction_header (branch_id, employee_id, customer_name, order_status_id) values (?, ?, ?, ?)";
    String query_getId = "select * from transaction_header order by id desc";
    String query_trdetailseat = "insert into transaction_detail_seat (transaction_id, seat_type_id, person) values (?, ?, ?)";

    int transactionId = 0;

    try {
      PreparedStatement ps = connection.prepareStatement(query_trheader);
      ps.setInt(1, employee.getBranchId());
      ps.setInt(2, employee.getEmployeeID());
      ps.setString(3, customerName);
      ps.setInt(4, 1);
      ps.executeUpdate();
      ps.close();
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
    }

    try {
      PreparedStatement ps = connection.prepareStatement(query_getId);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
        transactionId = rs.getInt(1);
      }
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
    }

    for (int i = 0; i < seatType.size(); i++) {
      try {
        PreparedStatement ps = connection.prepareStatement(query_trdetailseat);
        ps.setInt(1, transactionId);
        ps.setInt(2, seatType.get(i));
        ps.setInt(3, personPerTable.get(i));
        ps.executeUpdate();
        ps.close();
      } catch (Exception e) {
        // TODO: handle exception
        e.printStackTrace();
      }
    }

    return transactionId;
  }

  public ArrayList<TrHeader> getTransacionHeaders(int branchId) {
    ArrayList<TrHeader> trHeaders = new ArrayList<>();
    String query = "select * from transaction_header where order_status_id in (1,2) and branch_id = " + branchId;

    try {
      PreparedStatement ps = connection.prepareStatement(query);
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        int id = rs.getInt(1);
        String customerName = rs.getString(4);

        String status = null;
        switch (rs.getInt(5)) {
          case 1:
            status = "In Reserve";
            break;
          case 2:
            status = "In Order";
            break;
          case 3:
            status = "Finalized";
            break;
        }

        trHeaders.add(new TrHeader(id, customerName, status));
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    return trHeaders;
  }

  public boolean insertOrder(TrDetailMenu trDetailMenu) {
    boolean isExist = false;
    String query1 = "select count(*) from transaction_detail_menu where transaction_id = ? and menu_id = ?";
    String query2 = "update transaction_detail_menu set quantity = quantity + ? where transaction_id = ? and menu_id = ?";
    String query3 = "insert into transaction_detail_menu (transaction_id, menu_id, quantity) values (?, ?, ?);"
        + " update transaction_header set order_status_id = 2 where id = " + trDetailMenu.getTransactionID();

    try {
      PreparedStatement ps = connection.prepareStatement(query1);
      ps.setInt(1, trDetailMenu.getTransactionID());
      ps.setInt(2, trDetailMenu.getMenu_id());
      ResultSet rs = ps.executeQuery();
      rs.next();
      int count = rs.getInt(1);
      isExist = count > 0;
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
    }

    if (isExist) {
      try {
        PreparedStatement ps = connection.prepareStatement(query2);
        ps.setInt(1, trDetailMenu.getQuantity());
        ps.setInt(2, trDetailMenu.getTransactionID());
        ps.setInt(3, trDetailMenu.getMenu_id());
        ps.executeUpdate();
        ps.close();
      } catch (Exception e) {
        // TODO: handle exception
        e.printStackTrace();
      }

      return true;
    }

    try {
      PreparedStatement ps = connection.prepareStatement(query3);
      ps.setInt(1, trDetailMenu.getTransactionID());
      ps.setInt(2, trDetailMenu.getMenu_id());
      ps.setInt(3, trDetailMenu.getQuantity());
      ps.executeUpdate();
      ps.close();
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
    }

    return true;
  }

  public ArrayList<TrDetailMenu> getTransactionDetailMenu(int transactionId) {
    ArrayList<TrDetailMenu> trDetailMenus = new ArrayList<>();

    String query = "select th.id, th.customer_name, ost.name, tdm.menu_id, tdm.quantity"
        + " from transaction_header th"
        + " join transaction_detail_menu tdm on th.id = tdm.transaction_id"
        + " join order_status_type ost on th.order_status_id = ost.id"
        + " where th.id = " + transactionId;

    try {
      PreparedStatement ps = connection.prepareStatement(query);
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        int id = rs.getInt(1);
        String customerName = rs.getString(2);
        String order_status = rs.getString(3);
        int menu_id = rs.getInt(4);
        int quantity = rs.getInt(5);

        trDetailMenus.add(new TrDetailMenu(id, customerName, order_status, menu_id, quantity));
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    return trDetailMenus;
  }

  public boolean finalizedOrder(int transactionId) {
    String query = "update transaction_header set order_status_id = 3 where id = " + transactionId;

    try {
      PreparedStatement ps = connection.prepareStatement(query);
      ps.executeUpdate();
      ps.close();
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
    }

    return true;
  }
}
