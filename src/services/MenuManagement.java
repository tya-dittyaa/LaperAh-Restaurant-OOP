package services;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MenuDAO;
import models.Menu;

public class MenuManagement {
  private MenuDAO menuDAO;

  public MenuManagement(Connection connection) {
    this.menuDAO = new MenuDAO(connection);
  }

  public ArrayList<Menu> listMenuOnBranch(int branchId) {
    return menuDAO.listMenuOnBranch(branchId);
  }
}
