package models;

public class Employee extends Restaurant{
    int EmployeeID = 0;
    String EmployeeName = null;

    public Employee(int restaurantID, String location, int employeeID, String employeeName) {
        super(restaurantID, location);
        EmployeeID = employeeID;
        EmployeeName = employeeName;
    }
}
