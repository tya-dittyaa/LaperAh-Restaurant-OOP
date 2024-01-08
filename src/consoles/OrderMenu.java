package consoles;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Scanner;

import models.Menu;
import models.transaction.TrDetailMenu;
import services.TransactionManagement;
import utils.DatabaseUtil;

public class OrderMenu {
    Scanner scan = new Scanner(System.in);
    ArrayList<String> itemNames = new ArrayList<>();
    ArrayList<Integer> quantityEach = new ArrayList<>();

    private static DatabaseUtil dbInstance = DatabaseUtil.getInstance();
    Connection connection = dbInstance.getConnection();

    public void makeOrder() {
        String customerName, itemName, YN;
        int quantity;
        boolean makeAnotherOrder = true;

        System.out.println("[Make Order]");
        // show menu list in employee's location (klo perlu)
        System.out.print("Enter customer name: ");
        customerName = scan.nextLine();

        while (makeAnotherOrder == true) {
            System.out.print("Enter item name: ");
            itemName = scan.nextLine();

            System.out.print("Enter quantity: ");
            quantity = scan.nextInt();
            scan.nextLine();

            System.out.print("Make another order? [Y/N] >> ");
            YN = scan.nextLine();

            // add to arraylist
            itemNames.add(itemName);
            quantityEach.add(quantity);
            
            makeAnotherOrder = (YN.equals("Y")) ? true : false;
        }

        // add to Tr
        TransactionManagement tr = new TransactionManagement(connection);
        tr.insertOrder(customerName, itemNames, quantityEach); 

        System.out.println("Order success!");
    }
}
