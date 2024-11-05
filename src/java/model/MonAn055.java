package model;

public class MonAn055 {

    private int id;
    private String ten;
    private float gia;
    private String moTa;

    public MonAn055() {
    }

    public MonAn055(int id, String ten, float gia, String moTa) {
        this.id = id;
        this.ten = ten;
        this.gia = gia;
        this.moTa = moTa;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public float getGia() {
        return gia;
    }

    public void setGia(float gia) {
        this.gia = gia;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }
}
