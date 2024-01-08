package consoles;

import java.util.Scanner;

import models.Employee;
import utils.MainUtilities;

public class MainMenu {
  private static Scanner scan = MainUtilities.scan;

  public static void HomePage() {
    OrderMenu om = new OrderMenu();
    Employee employee = MainUtilities.employeeLoginData; 
    int input = 0;

    MainUtilities.clearConsole();

    System.out.println("LaperAh Restaurant");
    System.out.println("[ Restaurant App ]");
    System.out.println("===========================");
    System.out.println("Branch ID       : " + employee.getBranchId());
    System.out.println("Branch Location : " + employee.getBranchLocation());
    System.out.println("Employee ID     : " + employee.getEmployeeID());
    System.out.println("Employee Name   : " + employee.getEmployeeName());
    System.out.println("===========================");
    System.out.println("1. Reservation");
    System.out.println("2. Make Order");
    System.out.println("3. Edit Menu");
    System.out.println("4. Show Customers Status");
    System.out.println("5. Employee Logout");
    System.out.println("6. Exit App");
    System.out.println("===========================");
    System.out.print(">> ");

    try {
      input = scan.nextInt();
    } catch (Exception e) {
      input = 0;
    }
    scan.nextLine();

    switch (input) {
      case 1:
        TransactionMenu.ReservationPage();
        return;
      case 2:
        // make order
        om.makeOrder();
        break;

      case 3:
        // edit menu
        break;

      case 4:
        // show customer status
        break;

      case 5:
        EmployeeMenu.LogoutPage();
        return;

      case 6:
        ExitPage();
        return;

      default:
        System.out.println("\nInvalid input! Try Again!");
        try {
          Thread.sleep(500);
        } catch (Exception e) {
          e.printStackTrace();

        } finally {
          HomePage();
        }
        return;
    }
  }

  public static void ExitPage() {
    utils.MainUtilities.clearConsole();

    System.out.println("Thank you for using LaperAh Restaurant App...");
    System.out.println("© 2023, kuitkatnekat by Aditya, Karina, and Luke");

    return;
  }
}
