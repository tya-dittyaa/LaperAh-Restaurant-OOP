package consoles;

import java.sql.Connection;
import java.util.Scanner;

import models.Employee;
import services.EmployeeManagement;
import utils.DatabaseUtil;
import utils.MainUtilities;

public class EmployeeMenu {
  private static Scanner scan = MainUtilities.scan;
  private static DatabaseUtil dbInstance = DatabaseUtil.getInstance();

  public static void LoginPage() {
    int input = 0;

    MainUtilities.clearConsole();
    System.out.println("LaperAh Restaurant");
    System.out.println("[ Employee Login Page ]");
    System.out.println("=======================");
    System.out.println("1. Login");
    System.out.println("2. Register");
    System.out.println("3. Exit App");
    System.out.println("=======================");
    System.out.print(">> ");

    try {
      input = scan.nextInt();
    } catch (Exception e) {
      input = 0;
    }
    scan.nextLine();

    switch (input) {
      case 1:
        Login();
        return;

      case 2:
        Register();
        return;

      case 3:
        consoles.MainMenu.ExitPage();
        return;

      default:
        System.out.println("\nInvalid input! Try Again!");
        try {
          Thread.sleep(500);
        } catch (Exception e) {
          e.printStackTrace();

        } finally {
          LoginPage();
        }
        return;
    }
  }

  public static void LogoutPage() {
    Employee employee = MainUtilities.employeeLoginData;

    MainUtilities.clearConsole();
    System.out.println("Successfully Logout!");
    System.out.printf("Goodbye %s from Branch %s", employee.getEmployeeName(), employee.getBranchLocation());

    try {
      Thread.sleep(1500);
    } catch (InterruptedException e) {
      e.printStackTrace();
    } finally {
      // Utilities.employeeLoginData = null;
      LoginPage();
    }

    return;
  }

  private static void Login() {
    int inputId = 0;

    MainUtilities.clearConsole();
    System.out.println("[ Employee Login Page ]");
    System.out.println("Input your Employee ID! [0 for back]");
    System.out.print(">> ");

    try {
      inputId = scan.nextInt();
    } catch (Exception e) {
      inputId = -1;
    }
    scan.nextLine();

    if (inputId == 0) {
      LoginPage();
      return;
    }

    Connection connection = dbInstance.getConnection();
    Employee getLogin = new EmployeeManagement(connection).getLogin(inputId);

    MainUtilities.clearConsole();
    System.out.println("[ Employee Login Page ]");

    if (getLogin == null) {
      System.err.println("The Employee ID you entered is incorrect!");
      System.err.println("Please try again!");
    } else {
      System.out.println("Successfully Login!");
      System.out.printf("Welcome %s from Branch %s", getLogin.getEmployeeName(), getLogin.getBranchLocation());
    }

    try {
      Thread.sleep(1500);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }

    if (getLogin == null)
      Login();

    MainUtilities.employeeLoginData = getLogin;
    MainMenu.HomePage();

    return;

  }

  private static void Register() {
    MainUtilities.clearConsole();
    System.out.println("Coming Soon...");

    try {
      Thread.sleep(1500);
    } catch (Exception e) {
      e.printStackTrace();

    } finally {
      LoginPage();
    }
  }

}
