package models;

public class Employee extends Branch {
    private int EmployeeID = 0;
    private String EmployeeName = null;

    public Employee(int branchId, String branchLocation, int employeeID, String employeeName) {
        super(branchId, branchLocation);
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
