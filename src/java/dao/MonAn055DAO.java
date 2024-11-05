package dao;

import model.MonAn055;
import java.sql.*;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.regex.Pattern;

public class MonAn055DAO extends DAO {

    public MonAn055DAO() {
        super();
    }

    public String removeDiacritics(String input) {
        String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(normalized).replaceAll("");
    }

    public ArrayList<MonAn055> getTenMonAn(String tukhoa) {
        ArrayList<MonAn055> list = new ArrayList<>();
        try {
            String sql = "SELECT id, ten FROM tblMonAn055";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            String keyword = removeDiacritics(tukhoa.toLowerCase());

            while (rs.next()) {
                String tenMonAn = rs.getString("ten");
                String tenMonAnNoDiacritics = removeDiacritics(tenMonAn.toLowerCase());

                if (tenMonAnNoDiacritics.contains(keyword)) {
                    int id = rs.getInt("id");

                    MonAn055 monAn = new MonAn055();
                    monAn.setId(id);
                    monAn.setTen(tenMonAn);
                    list.add(monAn);
                }
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public MonAn055 getMonAn(int idMonAn) {
        MonAn055 monAn = null;
        try {
            String sql = "{CALL ThongTinMonAn(?)}";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idMonAn);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String ten = rs.getString("ten");
                float gia = rs.getFloat("gia");
                String moTa = rs.getString("moTa");

                monAn = new MonAn055(idMonAn, ten, gia, moTa);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return monAn;
    }
}
