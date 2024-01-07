package models;

import java.util.ArrayList;

public class EmployeeManagementSystem extends Employee{
    ArrayList<Employee> employeeData = new ArrayList<>();

    public EmployeeManagementSystem(int restaurantID, String location, int employeeID, String employeeName) {
        super(restaurantID, location, employeeID, employeeName);
    }
    
    public boolean login(Employee thisEmployee) {
        for (Employee employee : employeeData) {
            if(employee.equals(thisEmployee)) {
                return true;
            }
        }

        return false;
    }

    public void signin(Employee thisEmployee) {
        employeeData.add(thisEmployee);

        System.out.println("Sign in success!");
    }
}
