package models;

import java.util.ArrayList;

public class MenuManagementSystem extends Menu{
    ArrayList<Menu> menuData = new ArrayList<>();

    public MenuManagementSystem(int restaurantID, String location, int menuID, String menuName, String description,
            int price, String type, String specificLoc) {
        super(restaurantID, location, menuID, menuName, description, price, type, specificLoc);
    }

    public void addItem(Menu thisMenu) {
        menuData.add(thisMenu);

        System.out.println("Item successfully added!");
    }

    public void deleteItem(Menu thisMenu) {
        menuData.remove(thisMenu);
        
        System.out.println("Item successfully deleted!");
    }
    
}
