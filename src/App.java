import java.util.Scanner;

public class App {
    Scanner scan = new Scanner(System.in);

    public App() {
        int in = 0;

        do {
            System.out.println("Welcome to LaperAh Restaurant!");
            System.out.println("Select:");
            System.out.println("1. Reservation");
            System.out.println("2. Edit Menu");
            System.out.println("3. Show Customers");
            System.out.println("4. Exit");
            System.out.print(">> ");
            in = scan.nextInt();
            scan.nextLine();

            //test

            switch (in) {
                case 1:
                    // reservation
    
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
