package consoles;

import java.util.Scanner;

import services.MenuManagement;

public class MenuConfig {
    Scanner scan = new Scanner(System.in);
    MenuManagement mm = new MenuManagement();

    public void menu() {
        int in = 0;

        while (true) {
             System.out.println("[Edit Menu]");
            System.out.println("1. Add item");
            System.out.println("2. Edit item");
            System.out.println("3. Delete item");
            System.out.println("4. Back");
            System.out.print(">> ");
            in = scan.nextInt();
            scan.nextLine();

            switch (in) {
                case 1:
                    mm.addItem();
                    break;

                case 2:
                    mm.deleteItem();
                    break;

                case 3:
                    
                    break;

                case 4:
                    
                    break;
            
                default:
                    break;
            }
        }
    }
}
