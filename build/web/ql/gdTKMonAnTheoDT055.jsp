<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.TKMonAnTheoDT055DAO, model.TKMonAnTheoDT055, java.util.ArrayList, model.ThanhVien055" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thống kê Doanh thu Món ăn</title>
        <link rel="stylesheet" type="text/css" href="../css/style4.css">
    </head>
    <body>
        <%
            ThanhVien055 ql = (ThanhVien055) session.getAttribute("quanli");
            if (ql == null) {
                response.sendRedirect("gdDangNhap055.jsp?err=timeout");
            }
        %>
        <div class="container">
            <h2>Thống kê Doanh thu Món ăn</h2>

            <%
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");

                if (startDate != null && endDate != null) {
                    TKMonAnTheoDT055DAO tkMonAnDAO = new TKMonAnTheoDT055DAO();
                    ArrayList<TKMonAnTheoDT055> listDoanhThu = tkMonAnDAO.getDoanhThuMonAn(startDate, endDate);
                    float tongDoanhThu = tkMonAnDAO.getTongDoanhThu(startDate, endDate);

                    if (listDoanhThu.isEmpty()) {
                        out.println("<p>Không có dữ liệu thống kê trong khoảng thời gian này.</p>");
                    } else {
            %>
            <p class="date-range">Từ ngày <%= startDate%> đến ngày <%= endDate%></p>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Tên Món Ăn</th>
                    <th>Đơn giá</th>
                    <th>Số Lượng</th>
                    <th>Doanh Thu</th>
                    <th>Xem các lần gọi món</th>
                </tr>
                <% for (TKMonAnTheoDT055 monAn : listDoanhThu) {%>
                <tr>
                    <td><%= monAn.getId()%></td>
                    <td><%= monAn.getTen()%></td>
                    <td><%= String.format("%,.0f", monAn.getGia())%> VND</td>
                    <td><%= monAn.getSoLuongMA()%></td>
                    <td><%= String.format("%,.0f", monAn.getDoanhThu())%> VND</td>
                    <td>
                        <form action="gdCacLanGoiMon055.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="monAnId" value="<%= monAn.getId()%>">
                            <input type="hidden" name="tenMonAn" value="<%= monAn.getTen()%>">
                            <button type="submit" class="btn">Xem</button>
                        </form>
                    </td>
                </tr>
                <% }%>
            </table>
            <p class="total-revenue">Tổng Doanh Thu: <%= String.format("%,.0f", tongDoanhThu)%> VND</p>
            <%
                    }
                } else {
                    out.println("<p>Vui lòng chọn khoảng thời gian hợp lệ.</p>");
                }
            %>
            <div class="back-button">
                <button type="button" class="btn" onclick="history.back()">Quay lại</button>
            </div>
        </div>
    </body>
</html>
