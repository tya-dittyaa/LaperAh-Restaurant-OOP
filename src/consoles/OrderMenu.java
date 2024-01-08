package consoles;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Scanner;

import models.Employee;
import models.Menu;
import models.transaction.TrDetailMenu;
import models.transaction.TrHeader;
import services.MenuManagement;
import services.TransactionManagement;
import utils.DatabaseUtil;
import utils.MainUtilities;

public class OrderMenu {
    private static Scanner scan = MainUtilities.scan;
    private static DatabaseUtil dbInstance = DatabaseUtil.getInstance();

    public static void makeOrderMainPage() {
        Connection connection = dbInstance.getConnection();
        Employee employee = MainUtilities.employeeLoginData;

        ArrayList<TrHeader> trHeaders = new TransactionManagement(connection)
                .getTransacionHeaders(employee.getBranchId());
        ArrayList<Menu> menus = new MenuManagement(connection).listMenuOnBranch(employee.getBranchId());

        int inputTr = 0;
        do {
            MainUtilities.clearConsole();

            System.out.println("LaperAh Restaurant");
            System.out.println("[ Make/Add Order ]");
            System.out.println("===========================");
            System.out.println("Branch ID       : " + employee.getBranchId());
            System.out.println("Branch Location : " + employee.getBranchLocation());
            System.out.println("===========================");

            if (trHeaders.size() == 0) {
                System.err.println("No Available Reservation");
                System.err.println("Please make a new reservation first!");
                try {
                    Thread.sleep(2000);
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    MainMenu.HomePage();
                }
                return;
            }

            System.out.println("Available Reservation");
            for (int i = 0; i < trHeaders.size(); i++) {
                TrHeader trHeader = trHeaders.get(i);
                System.out.println(
                        (i + 1) + ". " + trHeader.getStatus() + " - " + trHeader.getCustomerName());
            }

            System.out.println("===========================");

            System.out.println("Enter the valid number above!");
            System.out.print(">> ");

            try {
                inputTr = scan.nextInt();
                if (inputTr > trHeaders.size())
                    inputTr = 0;
            } catch (Exception e) {
                inputTr = 0;
            }
            scan.nextLine();
        } while (inputTr == 0);

        int inputMenu = 0;
        do {
            MainUtilities.clearConsole();
            System.out.println("[ Reservation Page ]");
            System.out.println("Available Menu for Branch " + employee.getBranchLocation());
            System.out.println("===========================");
            for (int i = 0; i < menus.size(); i++) {
                Menu menu = menus.get(i);
                System.out
                        .println((i + 1) + ". " + menu.getMenuName() + " - " + menu.getType() + " - Rp"
                                + menu.getPrice());
            }
            System.out.println("===========================");

            System.out.println("Enter the valid number above!");
            System.out.print(">> ");

            try {
                inputMenu = scan.nextInt();
                if (inputMenu > menus.size())
                    inputMenu = 0;
            } catch (Exception e) {
                inputMenu = 0;
            }
            scan.nextLine();
        } while (inputMenu == 0);

        int inputQty = 0;
        do {
            MainUtilities.clearConsole();
            System.out.println("[ Reservation Page ]");
            System.out.println("Enter item quantity!");
            System.out.print(">> ");

            try {
                inputQty = scan.nextInt();
            } catch (Exception e) {
                inputQty = 0;
            }
            scan.nextLine();
        } while (inputQty == 0);

        Menu menu = menus.get(inputMenu - 1);
        TrHeader trHeader = trHeaders.get(inputTr - 1);
        TrDetailMenu trDetailMenu = new TrDetailMenu(trHeader.getTransactionID(), trHeader.getCustomerName(),
                "In Order", menu.getMenuID(), inputQty);

        new TransactionManagement(connection).insertOrder(trDetailMenu);

        MainUtilities.clearConsole();
        System.out.println("[ Reservation Page ]");
        System.out.println("Successfully added your order!");
        System.out.println(inputQty + "x " + menu.getMenuName());

        try {
            Thread.sleep(2000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MainMenu.HomePage();
        }
        return;
    }

    public static void getCustomerOrderStatusPage() {
        Connection connection = dbInstance.getConnection();
        Employee employee = MainUtilities.employeeLoginData;

        ArrayList<TrHeader> trHeaders = new TransactionManagement(connection)
                .getTransacionHeaders(employee.getBranchId());
        ArrayList<Menu> menus = new MenuManagement(connection).listMenuOnBranch(employee.getBranchId());

        int inputTr = 0;
        do {
            MainUtilities.clearConsole();

            System.out.println("LaperAh Restaurant");
            System.out.println("[ Show Customers Status ]");
            System.out.println("===========================");
            System.out.println("Branch ID       : " + employee.getBranchId());
            System.out.println("Branch Location : " + employee.getBranchLocation());
            System.out.println("===========================");

            if (trHeaders.size() == 0) {
                System.err.println("No Available Reservation");
                System.err.println("Please make a new reservation first!");
                try {
                    Thread.sleep(2000);
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    MainMenu.HomePage();
                }
                return;
            }

            System.out.println("Available Reservation");
            for (int i = 0; i < trHeaders.size(); i++) {
                TrHeader trHeader = trHeaders.get(i);
                System.out.println(
                        (i + 1) + ". " + trHeader.getStatus() + " - " + trHeader.getCustomerName());
            }

            System.out.println("===========================");
            System.out.println("Enter the valid number above!");
            System.out.print(">> ");

            try {
                inputTr = scan.nextInt();
                if (inputTr > trHeaders.size())
                    inputTr = 0;
            } catch (Exception e) {
                inputTr = 0;
            }
            scan.nextLine();
        } while (inputTr == 0);

        TrHeader trHeader = trHeaders.get(inputTr - 1);

        MainUtilities.clearConsole();
        System.out.println("LaperAh Restaurant");
        System.out.println("[ Show Customers Status ]");
        System.out.println("===========================");
        System.out.println("Branch ID       : " + employee.getBranchId());
        System.out.println("Branch Location : " + employee.getBranchLocation());
        System.out.println("===========================");
        System.out.println("Transaction ID  : " + trHeader.getTransactionID());
        System.out.println("Customer Name   : " + trHeader.getCustomerName());
        System.out.println("Order Status    : " + trHeader.getStatus());
        System.out.println("===========================");

        if (trHeader.getStatus().equals("In Reserve")) {
            try {
                System.out.println("Customer only make reservations, have not made menu orders!");
                Thread.sleep(5000);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                MainMenu.HomePage();
            }
            return;
        }

        int grandTotalPrice = 0;
        System.out.println("Purchased Items");
        ArrayList<TrDetailMenu> trDetailMenus = new TransactionManagement(connection)
                .getTransactionDetailMenu(trHeader.getTransactionID());

        for (int i = 0; i < trDetailMenus.size(); i++) {
            TrDetailMenu trDetailMenu = trDetailMenus.get(i);
            String index = (i + 1) + ". ";
            String menu_name = menus.get(trDetailMenu.getMenu_id()).getMenuName();
            int menu_price = menus.get(trDetailMenu.getMenu_id()).getPrice();
            int quantity = trDetailMenu.getQuantity();
            int totalPrice = menu_price * quantity;
            grandTotalPrice += totalPrice;

            System.out.printf("%s %dx %s --> %d * %d = Rp%d\n", index, quantity, menu_name, quantity, menu_price,
                    totalPrice);
        }

        System.out.println("\nGrand Total: Rp" + grandTotalPrice);
        System.out.println("===========================");

        try {
            System.out.println("You will be directed back to the Main Menu within 20 seconds...");
            Thread.sleep(20000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MainMenu.HomePage();
        }
        return;
    }

    public static void makeFinalizedMainPage() {
        Connection connection = dbInstance.getConnection();
        Employee employee = MainUtilities.employeeLoginData;

        ArrayList<TrHeader> trHeaders = new TransactionManagement(connection)
                .getTransacionHeaders(employee.getBranchId());
        ArrayList<Menu> menus = new MenuManagement(connection).listMenuOnBranch(employee.getBranchId());

        int inputTr = 0;
        do {
            MainUtilities.clearConsole();

            System.out.println("LaperAh Restaurant");
            System.out.println("[ Finalized / Check Out ]");
            System.out.println("===========================");
            System.out.println("Branch ID       : " + employee.getBranchId());
            System.out.println("Branch Location : " + employee.getBranchLocation());
            System.out.println("===========================");

            if (trHeaders.size() == 0) {
                System.err.println("No Available Reservation");
                System.err.println("Please make a new reservation first!");
                try {
                    Thread.sleep(2000);
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    MainMenu.HomePage();
                }
                return;
            }

            System.out.println("Available Reservation");
            for (int i = 0; i < trHeaders.size(); i++) {
                TrHeader trHeader = trHeaders.get(i);
                System.out.println(
                        (i + 1) + ". " + trHeader.getStatus() + " - " + trHeader.getCustomerName());
            }

            System.out.println("===========================");
            System.out.println("Enter the valid number above!");
            System.out.print(">> ");

            try {
                inputTr = scan.nextInt();
                if (inputTr > trHeaders.size())
                    inputTr = 0;
            } catch (Exception e) {
                inputTr = 0;
            }
            scan.nextLine();
        } while (inputTr == 0);

        TrHeader trHeader = trHeaders.get(inputTr - 1);

        MainUtilities.clearConsole();
        System.out.println("LaperAh Restaurant");
        System.out.println("[ Finalized / Check Out ]");
        System.out.println("===========================");
        System.out.println("Branch ID       : " + employee.getBranchId());
        System.out.println("Branch Location : " + employee.getBranchLocation());
        System.out.println("===========================");
        System.out.println("Transaction ID  : " + trHeader.getTransactionID());
        System.out.println("Customer Name   : " + trHeader.getCustomerName());
        System.out.println("Order Status    : " + trHeader.getStatus());
        System.out.println("===========================");

        if (trHeader.getStatus().equals("In Reserve")) {
            try {
                System.out.println("Customer only make reservations, have not made menu orders!");
                Thread.sleep(5000);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                MainMenu.HomePage();
            }
            return;
        }

        int grandTotalPrice = 0;
        System.out.println("Purchased Items");
        ArrayList<TrDetailMenu> trDetailMenus = new TransactionManagement(connection)
                .getTransactionDetailMenu(trHeader.getTransactionID());

        for (int i = 0; i < trDetailMenus.size(); i++) {
            TrDetailMenu trDetailMenu = trDetailMenus.get(i);
            String index = (i + 1) + ". ";
            String menu_name = menus.get(trDetailMenu.getMenu_id()).getMenuName();
            int menu_price = menus.get(trDetailMenu.getMenu_id()).getPrice();
            int quantity = trDetailMenu.getQuantity();
            int totalPrice = menu_price * quantity;
            grandTotalPrice += totalPrice;

            System.out.printf("%s %dx %s --> %d * %d = Rp%d\n", index, quantity, menu_name, quantity, menu_price,
                    totalPrice);
        }

        System.out.println("\nGrand Total: Rp" + grandTotalPrice);
        System.out.println("===========================");
        System.out.println("Are you sure you want to finalized / check out this order?");

        String inputChecking;
        do {
            System.out.print("[Y/N] >> ");
            inputChecking = scan.nextLine();
        } while (!inputChecking.equalsIgnoreCase("Y") && !inputChecking.equalsIgnoreCase("N"));

        MainUtilities.clearConsole();
        if (inputChecking.equalsIgnoreCase("N")) {
            System.out.println("[ Finalized / Check Out ]");
            System.out.println("Finalized order has been cancelled!");

            try {
                System.out.println("\nYou will be directed back to the Main Menu within 5 seconds...");
                Thread.sleep(20000);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                MainMenu.HomePage();
            }
        } else {
            System.out.println("LaperAh Restaurant");
            System.out.println("[ Customer Order Bill ]");
            System.out.println("===========================");
            System.out.println("Branch ID       : " + employee.getBranchId());
            System.out.println("Branch Location : " + employee.getBranchLocation());
            System.out.println("Employee ID     : " + employee.getEmployeeID());
            System.out.println("Employee Name   : " + employee.getEmployeeName());
            System.out.println("===========================");
            System.out.println("Transaction ID  : " + trHeader.getTransactionID());
            System.out.println("Customer Name   : " + trHeader.getCustomerName());
            System.out.println("Order Status    : Finalized");
            System.out.println("===========================");
            System.out.println("Purchased Items");

            for (int i = 0; i < trDetailMenus.size(); i++) {
                TrDetailMenu trDetailMenu = trDetailMenus.get(i);
                String index = (i + 1) + ". ";
                String menu_name = menus.get(trDetailMenu.getMenu_id()).getMenuName();
                int menu_price = menus.get(trDetailMenu.getMenu_id()).getPrice();
                int quantity = trDetailMenu.getQuantity();
                int totalPrice = menu_price * quantity;

                System.out.printf("%s %dx %s --> %d * %d = Rp%d\n", index, quantity, menu_name, quantity, menu_price,
                        totalPrice);
            }

            System.out.println("\nGrand Total: Rp" + grandTotalPrice);
            System.out.println("===========================");

            new TransactionManagement(connection).finalizedOrder(trHeader.getTransactionID());

            try {
                System.out.println("\nYou will be directed back to the Main Menu within 20 seconds...");
                Thread.sleep(20000);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                MainMenu.HomePage();
            }
        }

        return;
    }
}
