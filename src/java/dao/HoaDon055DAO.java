package dao;

import model.HoaDon055;
import model.MonDuocDat055;
import model.DonDatHang055;
import model.ComboDuocDat055;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.BanDuocDat055;
import model.HoTen055;
import model.KhachHang055;
import model.NVBanHang055;

public class HoaDon055DAO extends DAO {

    public HoaDon055DAO() {
        super();
    }

    public HoaDon055 getHoaDon(int donDatHangId) {
        HoaDon055 hoaDon = null;
        String sql = "{CALL HoaDonChiTiet(?)}";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, donDatHangId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                hoaDon = new HoaDon055();
                hoaDon.setId(rs.getInt("id"));
                hoaDon.setPhuongThucThanhToan(rs.getString("phuongThucThanhToan"));
                hoaDon.setNgayTao(rs.getDate("ngayTao"));
                hoaDon.setTongTien(rs.getFloat("tongTien"));

                // Tạo đối tượng nhân viên bán hàng và thiết lập các thuộc tính
                NVBanHang055 nvbh = new NVBanHang055();
                nvbh.setId(rs.getInt("maNV"));
                HoTen055 htnv = new HoTen055(rs.getString("hoNV"), rs.getString("tenNV"));
                nvbh.setHoten(htnv);
                hoaDon.setNvbh(nvbh);

                // Tạo đối tượng khách hàng, bàn ăn và thiết lập các thuộc tính
                DonDatHang055 donDatHang = new DonDatHang055();
                donDatHang.setId(donDatHangId);
                KhachHang055 kh = new KhachHang055();
                kh.setId(rs.getInt("maKH"));
                HoTen055 htkh = new HoTen055(rs.getString("hoKH"), rs.getString("tenKH"));
                kh.setHoten(htkh);
                donDatHang.setKhachHang(kh);
                BanDuocDat055 banDuocDat = new BanDuocDat055();
                banDuocDat.setId(rs.getInt("maBan"));
                donDatHang.setBanDuocDat(banDuocDat);
                hoaDon.setDonDatHang(donDatHang);

                // Lấy danh sách các món trong đơn đặt hàng
                List<MonDuocDat055> listMon = new ArrayList<>();
                String sqlMon = "{CALL GetMonDuocDat(?)}";
                PreparedStatement psMon = con.prepareStatement(sqlMon);
                psMon.setInt(1, donDatHangId);
                ResultSet rsMon = psMon.executeQuery();

                while (rsMon.next()) {
                    MonDuocDat055 mon = new MonDuocDat055();
                    mon.setId(rsMon.getInt("id"));
                    mon.setTen(rsMon.getString("ten"));
                    mon.setSoLuong(rsMon.getInt("soLuong"));
                    mon.setGia(rsMon.getFloat("gia"));
                    mon.setTongGia(rsMon.getFloat("tongGia"));
                    listMon.add(mon);
                }
                donDatHang.setDsMonDuocDat(listMon);

                // Lấy danh sách các combo trong đơn đặt hàng
                List<ComboDuocDat055> listCombo = new ArrayList<>();
                String sqlCombo = "{CALL GetComboDuocDat(?)}";
                PreparedStatement psCombo = con.prepareStatement(sqlCombo);
                psCombo.setInt(1, donDatHangId);
                ResultSet rsCombo = psCombo.executeQuery();

                while (rsCombo.next()) {
                    ComboDuocDat055 combo = new ComboDuocDat055();
                    combo.setId(rsCombo.getInt("id"));
                    combo.setTen(rsCombo.getString("ten"));
                    combo.setSoLuong(rsCombo.getInt("soLuong"));
                    combo.setGia(rsCombo.getFloat("gia"));
                    combo.setTongGia(rsCombo.getFloat("tongGia"));
                    listCombo.add(combo);
                }
                donDatHang.setDsComboDuocDat(listCombo);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return hoaDon;
    }
}
