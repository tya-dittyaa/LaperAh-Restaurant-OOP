package models;

public class Menu extends Restaurant{
    int menuID = 0;
    String menuName = null;
    String description = null;
    int price = 0;
    String type = null;
    String specificLoc = null;
    
    public Menu(int restaurantID, String location, int menuID, String menuName, String description, int price,
            String type, String specificLoc) {
        super(restaurantID, location);
        this.menuID = menuID;
        this.menuName = menuName;
        this.description = description;
        this.price = price;
        this.type = type;
        this.specificLoc = specificLoc;
    }
}
