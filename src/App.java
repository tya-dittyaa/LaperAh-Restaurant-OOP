import java.util.Scanner;

import services.EmployeeManagementSystem;

public class App {
    Scanner scan = new Scanner(System.in);

    public void verif() {
        int in = 0;
        
        do {
            System.out.println("[Employee Verification]");
            System.out.println("1. Log in");
            System.out.println("2. Sign in");
            System.out.println("3. Back");
            System.out.print(">> ");
            in = scan.nextInt();
            scan.nextLine();

            String employeeName, location;
            int employeeID, restaurantID;

            if(in == 1){
                System.out.print("Enter restaurant ID: ");
                restaurantID = scan.nextInt();
                scan.nextLine();

                System.out.print("Enter location: ");
                location = scan.nextLine();
                scan.nextLine();

                System.out.print("Enter employee ID: ");
                employeeID = scan.nextInt();
                scan.nextLine();

                System.out.print("Enter name: ");
                employeeName = scan.nextLine();
                scan.nextLine();

                EmployeeManagementSystem ems = new EmployeeManagementSystem(restaurantID, location, employeeID, employeeName);

                ems.login(ems);
                // Employee employee = new Employee(restaurantID, location, employeeID, employeeName);
            }
            else if(in == 2){

            }

        } while (in != 3);
        

    }

    public App() {
        int in = 0;

        // log in / sign in di EmployeeManagementSystem

        do {
            System.out.println("Welcome to LaperAh Restaurant!");
            System.out.println("Select:");
            System.out.println("1. Reservation");
            System.out.println("2. Edit Menu");
            System.out.println("3. Show Customers Status");
            System.out.println("4. Exit");
            System.out.print(">> ");
            in = scan.nextInt();
            scan.nextLine();

            switch (in) {
                case 1:
                    String customerName, location, seatType;
                    int nSeats, nPeople;

                    System.out.println("[Reservation]");
                    System.out.print("Enter customer Name: ");
                    customerName = scan.nextLine();

                    System.out.print("Enter location: ");
                    location = scan.nextLine();

                    System.out.print("Enter the number of seats:");
                    nSeats = scan.nextInt();
                    scan.nextLine();

                    System.out.print("Enter seat type: ");
                    seatType = scan.nextLine();
                    scan.nextInt();

                    System.out.println("Enter the number of people per table: ");
                    nPeople = scan.nextInt();
                    scan.nextLine();
    
                    break;
            
                case 2:
                    // edit menu
                    break;

                case 3:
                    // show customers
                    break;

                case 4:
                    System.out.println("Thank you for using our application! :)");
                    break;

                default:
                    System.out.println("Invalid input! Try Again!");
                    break;
            }

        } while (in != 4);

    }

    public static void main(String[] args) {
        new App();
    }
}
