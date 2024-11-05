package model;

import java.util.Date;

public class HoaDon055 {

    private int id;
    private Date ngayTao;
    private float tongTien;
    private String phuongThucThanhToan;
    private NVBanHang055 nvbh;
    private DonDatHang055 donDatHang;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public float getTongTien() {
        return tongTien;
    }

    public void setTongTien(float tongTien) {
        this.tongTien = tongTien;
    }

    public String getPhuongThucThanhToan() {
        return phuongThucThanhToan;
    }

    public void setPhuongThucThanhToan(String phuongThucThanhToan) {
        this.phuongThucThanhToan = phuongThucThanhToan;
    }

    public NVBanHang055 getNvbh() {
        return nvbh;
    }

    public void setNvbh(NVBanHang055 nvbh) {
        this.nvbh = nvbh;
    }

    public DonDatHang055 getDonDatHang() {
        return donDatHang;
    }

    public void setDonDatHang(DonDatHang055 donDatHang) {
        this.donDatHang = donDatHang;
    }
}
