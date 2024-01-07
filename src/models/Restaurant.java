package models;

public class Restaurant {
    int RestaurantID = 0;
    String location = null;

    public Restaurant(int restaurantID, String location) {
        RestaurantID = restaurantID;
        this.location = location;
    }
}
