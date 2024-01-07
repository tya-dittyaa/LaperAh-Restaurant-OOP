package models;

public class Branch {
    private int branchId = 0;
    private String branchLocation = null;

    public Branch(int branchId, String branchLocation) {
        this.branchId = branchId;
        this.branchLocation = branchLocation;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public String getBranchLocation() {
        return branchLocation;
    }

    public void setBranchLocation(String branchLocation) {
        this.branchLocation = branchLocation;
    }

}
