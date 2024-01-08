package models;

public class Menu extends Branch {
    private int menuID = 0;
    private String menuName = null;
    private String description = null;
    private int price = 0;
    private String type = null;
    private String specificLoc = null;

    public Menu(int branchId, String location, int menuID, String menuName, String description, int price,
            String type, String specificLoc) {
        super(branchId, location);
        this.menuID = menuID;
        this.menuName = menuName;
        this.description = description;
        this.price = price;
        this.type = type;
        this.specificLoc = specificLoc;
    }

    public int getMenuID() {
        return menuID;
    }

    public void setMenuID(int menuID) {
        this.menuID = menuID;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSpecificLoc() {
        return specificLoc;
    }

    public void setSpecificLoc(String specificLoc) {
        this.specificLoc = specificLoc;
    }

}
