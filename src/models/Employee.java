package models;

public class Employee extends Restaurant{
    private int EmployeeID = 0;
    private String EmployeeName = null;

    public Employee(int restaurantID, String location, int employeeID, String employeeName) {
        super(restaurantID, location);
        EmployeeID = employeeID;
        EmployeeName = employeeName;
    }

    public int getEmployeeID() {
        return EmployeeID;
    }

    public void setEmployeeID(int employeeID) {
        EmployeeID = employeeID;
    }

    public String getEmployeeName() {
        return EmployeeName;
    }

    public void setEmployeeName(String employeeName) {
        EmployeeName = employeeName;
    }

}
