package dao;

import model.TKCacLanGoiMon055;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.BanDuocDat055;

public class TKCacLanGoiMon055DAO extends DAO {

    public TKCacLanGoiMon055DAO() {
        super();
    }

    // Lấy các lần gọi món ăn dựa trên monAnId với tổng số lượng theo từng đơn
    public List<TKCacLanGoiMon055> getCacLanGoiMon(int monAnId) {
        List<TKCacLanGoiMon055> list = new ArrayList<>();
        String sql = "{CALL TKCacLanGoiMonAn(?)}";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, monAnId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TKCacLanGoiMon055 tkCacLanGoiMon = new TKCacLanGoiMon055();
                tkCacLanGoiMon.setMaDon(rs.getInt("donDatHangId"));
                tkCacLanGoiMon.setSoLuongMA(rs.getInt("soLuong"));
                tkCacLanGoiMon.setTongGia(rs.getFloat("tongGia"));
                BanDuocDat055 banDuocDat = new BanDuocDat055();
                banDuocDat.setNgayDatBan(rs.getDate("ngayDat"));
                tkCacLanGoiMon.setBanDuocDat(banDuocDat);

                list.add(tkCacLanGoiMon);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
