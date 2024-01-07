package services;

import java.util.ArrayList;

import models.Employee;

public class EmployeeManagement extends Employee{
    ArrayList<Employee> employeeData = new ArrayList<>();

    public EmployeeManagement(int restaurantID, String location, int employeeID, String employeeName) {
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

    public void signup(Employee thisEmployee) {
        employeeData.add(thisEmployee);

        System.out.println("Sign in success!");
    }
}
