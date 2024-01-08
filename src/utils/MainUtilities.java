package utils;

import java.util.Scanner;

import models.Employee;

public class MainUtilities {
  public static Scanner scan = new Scanner(System.in);
  public static Employee employeeLoginData = null;

  public static void clearConsole() {
    for (int i = 0; i < 50; i++) {
      System.out.println("");
    }
  }

}
