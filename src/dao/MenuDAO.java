package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.Branch;
import models.Menu;
import services.BranchManagement;

public class MenuDAO {
  private Connection connection;

  public MenuDAO(Connection connection) {
    this.connection = connection;
  }

  public ArrayList<Menu> listMenuOnBranch(int branchId) {
    String query = "select * from menu where menu_type_id = 1";

    ArrayList<Menu> menus = new ArrayList<>();
    Branch nowBranch = new BranchManagement(connection).getBranchDetail(branchId);

    if (branchId == 1 || branchId == 2 || branchId == 3) {
      query = query + " union select * from menu where menu_type_id = 2";
    } else {
      query = query + " union select * from menu where menu_type_id = 3 and branch_id = " + branchId;
    }
    query = query + " order by id asc";

    try {
      PreparedStatement ps = connection.prepareStatement(query);
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        int id = rs.getInt(1);
        String name = rs.getString(2);
        String description = rs.getString(3);
        int price = rs.getInt(4);

        String type = null;
        switch (rs.getInt(5)) {
          case 1:
            type = "General";
            break;
          case 2:
            type = "Special";
            break;
          case 3:
            type = "Local Special";
            break;
        }

        String location = rs.getString(7);

        menus.add(new Menu(nowBranch.getBranchId(), nowBranch.getBranchLocation(), id, name, description, price, type,
            location));
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    return menus;
  }
}
