<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.TKCacLanGoiMon055DAO, model.TKCacLanGoiMon055, java.util.ArrayList, model.ThanhVien055" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết Các Lần Gọi Món</title>
        <link rel="stylesheet" type="text/css" href="../css/style5.css">
    </head>
    <body>
        <%
            ThanhVien055 ql = (ThanhVien055) session.getAttribute("quanli");
            if (ql == null) {
                response.sendRedirect("gdDangNhap055.jsp?err=timeout");
            }
        %>
        <div class="container">
            <h2>Chi tiết Các Lần Gọi Món</h2>
            <%
                String monAnIdParam = request.getParameter("monAnId");
                String tenMonAn = request.getParameter("tenMonAn");
                if (monAnIdParam != null) {
                    int monAnId = Integer.parseInt(monAnIdParam);
                    TKCacLanGoiMon055DAO donDatHangDAO = new TKCacLanGoiMon055DAO();
                    ArrayList<TKCacLanGoiMon055> listDonHang = (ArrayList<TKCacLanGoiMon055>) donDatHangDAO.getCacLanGoiMon(monAnId);

                    out.println("<h3>Tên món ăn: " + tenMonAn + "</h3>");

                    if (listDonHang.isEmpty()) {
                        out.println("<p>Không có lần gọi món nào cho món ăn này.</p>");
                    } else {
            %>
            <table>
                <tr>
                    <th>Mã Đơn Hàng</th>
                    <th>Số Lượng</th>
                    <th>Tổng Giá</th>
                    <th>Ngày Đặt</th>
                    <th>Xem Hóa Đơn</th>
                </tr>
                <% for (TKCacLanGoiMon055 donHang : listDonHang) { %>
                <tr>
                    <td><%= donHang.getMaDon() %></td>
                    <td><%= donHang.getSoLuongMA() %></td>
                    <td><%= String.format("%,.0f", donHang.getTongGia()) %> VND</td>
                    <td><%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(donHang.getBanDuocDat().getNgayDatBan()) %></td>
                    <td>
                        <form action="gdHoaDon055.jsp" method="get">
                            <input type="hidden" name="donDatHangId" value="<%= donHang.getMaDon() %>">
                            <button type="submit" class="btn">Xem</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
            <% 
                    }
                } else {
                    out.println("<p>ID món ăn không hợp lệ.</p>");
                }
            %>
            <div class="back-button">
                <button type="button" class="btn" onclick="history.back()">Quay lại</button>
            </div>
        </div>
    </body>
</html>
