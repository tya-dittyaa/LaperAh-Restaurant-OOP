package consoles;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Scanner;

import services.TransactionManagement;
import utils.DatabaseUtil;
import utils.MainUtilities;

public class TransactionMenu {
  private static Scanner scan = MainUtilities.scan;
  private static DatabaseUtil dbInstance = DatabaseUtil.getInstance();

  public static void ReservationPage() {
    // * Customer Name
    String inputCustomerName = null;
    MainUtilities.clearConsole();
    System.out.println("[ Reservation Page ]");
    System.out.println("Input customer name! [0 for exit]");
    System.out.print(">> ");
    inputCustomerName = scan.nextLine();

    if (inputCustomerName.equals("0")) {
      MainMenu.HomePage();
      return;
    }

    // * Jumlah Meja
    int inputTotalTable = 0;
    boolean isValidInputTotalTable = false;

    do {
      MainUtilities.clearConsole();
      System.out.println("[ Reservation Page ]");
      System.out.println("Enter the number of tables! [0 for exit]");
      System.out.print(">> ");

      try {
        inputTotalTable = scan.nextInt();
        isValidInputTotalTable = true;
      } catch (Exception e) {
        isValidInputTotalTable = false;
      }
      scan.nextLine();
    } while (!isValidInputTotalTable);

    if (inputTotalTable == 0) {
      MainMenu.HomePage();
      return;
    }

    ArrayList<Integer> seatType = new ArrayList<>();
    ArrayList<Integer> personPerTable = new ArrayList<>();
    for (int i = 0; i < inputTotalTable; i++) {
      // * Tipe Meja
      int inputSeatType = 0;
      do {
        MainUtilities.clearConsole();
        System.out.println("[ Reservation Page ]");
        System.out.printf("Please select the table type (table %d / %d)\n", i + 1, inputTotalTable);
        System.out.println("1. Romantic (max 2 persons)");
        System.out.println("2. General (max 4 persons)");
        System.out.println("3. Family (max 10 persons)");
        System.out.println("4. Exit");

        try {
          inputSeatType = scan.nextInt();
        } catch (Exception e) {
          inputSeatType = 0;
        }
        scan.nextLine();
      } while (inputSeatType < 1 || inputSeatType > 3);

      switch (inputSeatType) {
        case 1:
          seatType.add(1);
          break;

        case 2:
          seatType.add(2);
          break;

        case 3:
          seatType.add(3);
          break;

        default:
          MainMenu.HomePage();
          return;
      }

      // * Jumlah orang permeja
      int inputPersonPerTable = 0;
      boolean isValidInputPersonPerTable = false;

      do {
        MainUtilities.clearConsole();
        System.out.println("[ Reservation Page ]");
        System.out.printf("Please enter the number of people per table (table %d / %d) [0 for exit]\n", i + 1,
            inputTotalTable);
        System.out.print(">> ");

        try {
          inputPersonPerTable = scan.nextInt();
          isValidInputPersonPerTable = true;

          if (inputPersonPerTable == 0) {
            MainMenu.HomePage();
            return;
          }

          switch (seatType.get(i)) {
            case 1:
              if (inputPersonPerTable > 2) {
                isValidInputPersonPerTable = false;
                System.err.println("Maximum for Romantic is 2 persons");
                Thread.sleep(1000);
              }
              break;

            case 2:
              if (inputPersonPerTable > 4) {
                isValidInputPersonPerTable = false;
                System.err.println("Maximum for General is 2 persons");
                Thread.sleep(1000);
              }
              break;

            case 3:
              if (inputPersonPerTable > 2) {
                isValidInputPersonPerTable = false;
                System.err.println("Maximum for Family is 10 persons");
                Thread.sleep(1000);
              }
              break;
          }
        } catch (Exception e) {
          isValidInputPersonPerTable = false;
        }
        scan.nextLine();
      } while (!isValidInputPersonPerTable);

      personPerTable.add(inputPersonPerTable);
    }

    Connection connection = dbInstance.getConnection();
    int transactionId = new TransactionManagement(connection).insertReservation(inputCustomerName, inputTotalTable,
        seatType, personPerTable);

    MainUtilities.clearConsole();
    System.out.println("[ Reservation Page ]");
    System.out.println("Successfully added the reservation to database");
    System.out.println("Return Transaction ID is " + transactionId);

    try {
      Thread.sleep(2000);
      MainMenu.HomePage();
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
    }
  }
}
