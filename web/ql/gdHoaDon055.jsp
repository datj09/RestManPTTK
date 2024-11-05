<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.HoaDon055DAO, model.HoaDon055, model.MonDuocDat055, model.ComboDuocDat055, model.ThanhVien055" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Hóa Đơn</title>
        <link rel="stylesheet" type="text/css" href="../css/style6.css">
    </head>
    <body>
        <%
            ThanhVien055 ql = (ThanhVien055) session.getAttribute("quanli");
            if (ql == null) {
                response.sendRedirect("gdDangNhap055.jsp?err=timeout");
            }
        %>
        <div class="container">
            <h2>Hóa Đơn</h2>
            <%
                String donDatHangIdParam = request.getParameter("donDatHangId");
                if (donDatHangIdParam != null) {
                    int donDatHangId = Integer.parseInt(donDatHangIdParam);
                    HoaDon055DAO hoaDonDAO = new HoaDon055DAO();
                    HoaDon055 hoaDon = hoaDonDAO.getHoaDon(donDatHangId);

                    if (hoaDon != null) {
            %>
            <div class="invoice-number">
                Số: <%= hoaDon.getId()%>
            </div>
            <div class="date">
                Ngày tạo: <%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(hoaDon.getNgayTao())%>
            </div>

            <div class="info-section">
                <div>
                    <p><strong>Khách hàng:</strong> <%= hoaDon.getDonDatHang().getKhachHang().getHoten()%> (Mã KH: <%= hoaDon.getDonDatHang().getKhachHang().getId()%>)</p>
                    <p><strong>Bàn Số:</strong> <%= hoaDon.getDonDatHang().getBanDuocDat().getId()%></p>
                </div>
                <div style="text-align:right;">
                    <p><strong>Nhân viên bán hàng:</strong> <%= hoaDon.getNvbh().getHoten()%> (Mã NV: <%= hoaDon.getNvbh().getId()%>)</p>
                </div>
            </div>

            <div class="table-section">
                <h3>Món ăn:</h3>
                <table>
                    <tr>
                        <th>ID Món</th>
                        <th>Tên Món Ăn</th>
                        <th>Số Lượng</th>
                        <th>Đơn Giá</th>
                        <th>Thành Tiền</th>
                    </tr>
                    <% for (MonDuocDat055 mon : hoaDon.getDonDatHang().getDsMonDuocDat()) {%>
                    <tr>
                        <td><%= mon.getId()%></td>
                        <td><%= mon.getTen()%></td>
                        <td><%= mon.getSoLuong()%></td>
                        <td><%= String.format("%,.0f", mon.getGia())%> VND</td>
                        <td><%= String.format("%,.0f", mon.getTongGia())%> VND</td>
                    </tr>
                    <% } %>
                </table>
            </div>

            <div class="table-section">
                <h3>Combo:</h3>
                <table>
                    <tr>
                        <th>ID Combo</th>
                        <th>Tên Combo</th>
                        <th>Số Lượng</th>
                        <th>Đơn Giá</th>
                        <th>Thành Tiền</th>
                    </tr>
                    <% for (ComboDuocDat055 combo : hoaDon.getDonDatHang().getDsComboDuocDat()) {%>
                    <tr>
                        <td><%= combo.getId()%></td>
                        <td><%= combo.getTen()%></td>
                        <td><%= combo.getSoLuong()%></td>
                        <td><%= String.format("%,.0f", combo.getGia())%> VND</td>
                        <td><%= String.format("%,.0f", combo.getTongGia())%> VND</td>
                    </tr>
                    <% }%>
                </table>
            </div>

            <div class="total-section">
                Tổng tiền: <%= String.format("%,.0f", hoaDon.getTongTien())%> VND
            </div>
            <div class="payment-method">
                Phương thức thanh toán: <%= hoaDon.getPhuongThucThanhToan()%>
            </div>

            <%
                    } else {
                        out.println("<p>Không tìm thấy hóa đơn cho đơn đặt hàng này.</p>");
                    }
                } else {
                    out.println("<p>ID đơn đặt hàng không hợp lệ.</p>");
                }
            %>
            <div class="back-button">
                <button type="button" class="btn" onclick="history.back()">Quay lại</button>
            </div>
        </div>
    </body>
</html>
