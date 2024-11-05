package model;

public class NhanVien055 extends ThanhVien055 {

    private String viTri;

    public NhanVien055() {
        super();
    }

    public NhanVien055(String username, String password) {
        super(username, password);
    }

    public String getViTri() {
        return viTri;
    }

    public void setViTri(String viTri) {
        this.viTri = viTri;
    }
}
