package services;

import java.sql.Connection;

import dao.BranchDAO;
import models.Branch;

public class BranchManagement {
  private BranchDAO branchDAO;

  public BranchManagement(Connection connection) {
    this.branchDAO = new BranchDAO(connection);
  }

  public Branch getBranchDetail(int branchId) {
    return branchDAO.getBranchDetail(branchId);
  }
}
