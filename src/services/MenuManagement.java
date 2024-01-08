package services;

import java.util.ArrayList;
import java.util.Scanner;

import models.Menu;

public class MenuManagement {
    Scanner scan = new Scanner(System.in);
    ArrayList<Menu> menuData = new ArrayList<>();

    public void addItem() {
        int restaurantID, menuID, price;
        String location, itemName, description, type, specificLoc;

        System.out.println("[Add Item]");
        System.out.print("Enter restaurant ID: ");
        restaurantID = scan.nextInt();

        System.out.print("Enter location: ");
        location = scan.nextLine();

        System.out.print("Enter menu ID: ");
        menuID = scan.nextInt();

        System.out.print("Enter item name: ");
        itemName = scan.nextLine();

        System.out.print("Enter price: ");
        price = scan.nextInt();

        System.out.print("Enter type: ");
        type = scan.nextLine();
        
        if(type.equalsIgnoreCase("General")) {
            Menu newItem = new Menu(restaurantID, location, menuID, itemName, null, price, type, null);
            menuData.add(newItem); // add to db
        }
        else if(type.equalsIgnoreCase("Special")) {
            System.out.print("Enter description: ");
            description = scan.nextLine();

            Menu newItem = new Menu(restaurantID, location, menuID, itemName, description, price, type, null);
            menuData.add(newItem); // add to db
        }
        else if(type.equalsIgnoreCase("Local Special")) {
            System.out.print("Enter description: ");
            description = scan.nextLine();

            System.out.print("Enter specific location: ");
            specificLoc = scan.nextLine();

            Menu newItem = new Menu(restaurantID, location, menuID, itemName, description, price, type, specificLoc);
            menuData.add(newItem); // add to db
        }

        System.out.println("Item successfully added!");
    }

    public void deleteItem() {
        int restaurantID, menuID, price;
        String location, itemName, description, type, specificLoc;

        System.out.println("[Delete Item]");
        System.out.print("Enter restaurant ID: ");
        restaurantID = scan.nextInt();

        System.out.print("Enter location: ");
        location = scan.nextLine();

        System.out.print("Enter menu ID: ");
        menuID = scan.nextInt();

        System.out.print("Enter item name: ");
        itemName = scan.nextLine();

        System.out.print("Enter price: ");
        price = scan.nextInt();

        System.out.print("Enter type: ");
        type = scan.nextLine();
        
        if(type.equalsIgnoreCase("General")) {
            Menu newItem = new Menu(restaurantID, location, menuID, itemName, null, price, type, null);
            menuData.remove(newItem); // delete to db
        }
        else if(type.equalsIgnoreCase("Special")) {
            System.out.print("Enter description: ");
            description = scan.nextLine();

            Menu newItem = new Menu(restaurantID, location, menuID, itemName, description, price, type, null);
            menuData.remove(newItem); // delete to db
        }
        else if(type.equalsIgnoreCase("Local Special")) {
            System.out.print("Enter description: ");
            description = scan.nextLine();

            System.out.print("Enter specific location: ");
            specificLoc = scan.nextLine();

            Menu newItem = new Menu(restaurantID, location, menuID, itemName, description, price, type, specificLoc);
            menuData.remove(newItem); // delete to db
        }

        System.out.println("Item successfully deleted!");
    }

}
