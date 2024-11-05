package dao;

import model.TKMonAnTheoDT055;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TKMonAnTheoDT055DAO extends DAO {

    public TKMonAnTheoDT055DAO() {
        super();
    }

    public ArrayList<TKMonAnTheoDT055> getDoanhThuMonAn(String startDate, String endDate) {
        ArrayList<TKMonAnTheoDT055> list = new ArrayList<>();
        String sql = "{call TKMonAnTheoDoanhThu(?, ?)}";

        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, startDate);
            cs.setString(2, endDate);
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                TKMonAnTheoDT055 tk = new TKMonAnTheoDT055();
                tk.setId(rs.getInt("idMonAn"));
                tk.setTen(rs.getString("tenMonAn"));
                tk.setGia(rs.getFloat("gia"));
                tk.setSoLuongMA(rs.getInt("soLuongMA"));
                tk.setDoanhThu(rs.getFloat("doanhThu"));
                list.add(tk);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    //thuộc tính ẩn tính tổng doanh thu
    public float getTongDoanhThu(String startDate, String endDate) {
        float tongDoanhThu = 0;
        ArrayList<TKMonAnTheoDT055> listDoanhThu = getDoanhThuMonAn(startDate, endDate);

        for (TKMonAnTheoDT055 monAn : listDoanhThu) {
            tongDoanhThu += monAn.getDoanhThu();
        }

        return tongDoanhThu;
    }
}
