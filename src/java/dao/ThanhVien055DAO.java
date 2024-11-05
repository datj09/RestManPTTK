package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.HoTen055;
import model.ThanhVien055;

public class ThanhVien055DAO extends DAO {

    public ThanhVien055DAO() {
        super();
    }

    public boolean kiemTraDangNhap(ThanhVien055 tv) {
        boolean kq = false;
        if (tv.getUsername().contains("true") || tv.getUsername().contains("=") || tv.getPassword().contains("true") || tv.getPassword().contains("=")) {
            return false;
        }
        String sql = "{call kiemtraDN(?,?)}"; //su dung stored procedure
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, tv.getUsername());
            cs.setString(2, tv.getPassword());
            ResultSet rs = cs.executeQuery();
            if (rs.next()) {
                tv.setId(rs.getInt("id"));
                tv.setVaiTro(rs.getString("vaitro"));
                //hoten
                HoTen055 ht = new HoTen055();
                ht.setHo(rs.getString("ho"));
                ht.setTen(rs.getString("ten"));
                tv.setHoten(ht);
                kq = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            kq = false;
        }
        return kq;
    }
}
