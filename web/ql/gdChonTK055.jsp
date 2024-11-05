<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.ThanhVien055"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chọn loại thống kê</title>
        <link rel="stylesheet" type="text/css" href="../css/style3.css">
        <script>
            function showDateRange() {
                var selectBox = document.getElementById("loaiThongKe");
                var selectedValue = selectBox.value;
                var dateRangeForm = document.getElementById("dateRangeForm");

                dateRangeForm.style.display = (selectedValue === "doanhthuMonAn") ? "block" : "none";
            }
        </script>
    </head>
    <body>
        <%
            ThanhVien055 ql = (ThanhVien055) session.getAttribute("quanli");
            if (ql == null) {
                response.sendRedirect("gdDangNhap055.jsp?err=timeout");
            }
        %>
        <div class="container">
            <h2>Chọn loại thống kê</h2>

            <label for="loaiThongKe">Loại thống kê:</label>
            <select id="loaiThongKe" name="loaiThongKe" onchange="showDateRange()">
                <option value="">-- Chọn loại thống kê --</option>
                <option value="doanhthuMonAn">Thống kê doanh thu món ăn</option>
            </select>

            <div id="dateRangeForm" style="display: none; margin-top: 15px;">
                <h3>Chọn khoảng thời gian</h3>
                <form action="gdTKMonAnTheoDT055.jsp" method="get">
                    <label for="startDate">Từ ngày:</label>
                    <input type="date" id="startDate" name="startDate" required>
                    <label for="endDate">Đến ngày:</label>
                    <input type="date" id="endDate" name="endDate" required>
                    <button type="submit" class="btn">Xem thống kê</button>
                </form>
            </div>
        </div>
    </body>  
</html>
