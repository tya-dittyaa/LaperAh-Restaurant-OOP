package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.Branch;

public class BranchDAO {
  private Connection connection;

  public BranchDAO(Connection connection) {
    this.connection = connection;
  }

  public Branch getBranchDetail(int branchId) {
    Branch branch = null;
    String query = "select * from branch where id = " + branchId;

    try {
      PreparedStatement ps = connection.prepareStatement(query);
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        String branchLocation = rs.getString(2);
        branch = new Branch(branchId, branchLocation);
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    return branch;
  }
}
