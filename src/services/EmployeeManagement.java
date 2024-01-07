package services;

import java.sql.Connection;

import dao.EmployeeDAO;
import models.Employee;

public class EmployeeManagement {
  private EmployeeDAO employeeDAO;

  public EmployeeManagement(Connection connection) {
    this.employeeDAO = new EmployeeDAO(connection);
  }

  public Employee getLogin(int employeeID) {
    return employeeDAO.getLogin(employeeID);
  }
}