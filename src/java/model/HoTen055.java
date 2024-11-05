package model;

public class HoTen055 {

    private String ho;
    private String ten;

    public HoTen055() {
    }

    public HoTen055(String ho, String ten) {
        this.ho = ho;
        this.ten = ten;
    }

    public String getHo() {
        return ho;
    }

    public void setHo(String ho) {
        this.ho = ho;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    @Override
    public String toString() {
        return ho + " " + ten;
    }
}
