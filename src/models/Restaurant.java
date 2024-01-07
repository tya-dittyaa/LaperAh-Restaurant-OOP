package models;

public class Restaurant {
    private int RestaurantID = 0;
    private String location = null;

    public Restaurant(int restaurantID, String location) {
        RestaurantID = restaurantID;
        this.location = location;
    }

    public int getRestaurantID() {
        return RestaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        RestaurantID = restaurantID;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

}
