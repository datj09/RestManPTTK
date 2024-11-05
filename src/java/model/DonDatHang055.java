package model;

import java.util.Date;
import java.util.List;

public class DonDatHang055 {

    private int id;
    private int maDon;
    private KhachHang055 khachHang;
    private BanDuocDat055 banDuocDat;
    private List<MonDuocDat055> dsMonDuocDat;
    private List<ComboDuocDat055> dsComboDuocDat;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMaDon() {
        return maDon;
    }

    public void setMaDon(int maDon) {
        this.maDon = maDon;
    }

    public KhachHang055 getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang055 khachHang) {
        this.khachHang = khachHang;
    }

    public BanDuocDat055 getBanDuocDat() {
        return banDuocDat;
    }

    public void setBanDuocDat(BanDuocDat055 banDuocDat) {
        this.banDuocDat = banDuocDat;
    }

    public List<MonDuocDat055> getDsMonDuocDat() {
        return dsMonDuocDat;
    }

    public void setDsMonDuocDat(List<MonDuocDat055> dsMonDuocDat) {
        this.dsMonDuocDat = dsMonDuocDat;
    }

    public List<ComboDuocDat055> getDsComboDuocDat() {
        return dsComboDuocDat;
    }

    public void setDsComboDuocDat(List<ComboDuocDat055> dsComboDuocDat) {
        this.dsComboDuocDat = dsComboDuocDat;
    }
}
