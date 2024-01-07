package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.Employee;

public class EmployeeDAO {
  private Connection connection;

  public EmployeeDAO(Connection connection) {
    this.connection = connection;
  }

  public Employee getLogin(int employeeID) {
    String query = "select * from employee e join branch b on e.branch_id = b.id where e.id = ?";
    Employee employee = null;

    try {
      PreparedStatement ps = connection.prepareStatement(query);
      ps.setInt(1, employeeID);
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        String name = rs.getString(2);
        int branchId = rs.getInt(4);
        String branchLocation = rs.getString(5);

        employee = new Employee(branchId, branchLocation, employeeID, name);
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    return employee;
  }
}
