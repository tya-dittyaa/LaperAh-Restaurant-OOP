package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import models.Employee;
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
    String query_trdetailseat = "insert into transaction_detail_seat (id, seat_type_id, person) values (?, ?, ?)";

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

  
}
