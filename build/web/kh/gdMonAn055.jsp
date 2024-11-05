<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.MonAn055DAO, model.MonAn055" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết Món Ăn</title>
        <link rel="stylesheet" type="text/css" href="../css/style1.css">
    </head>
    <body>
        <h2>Chi tiết Món Ăn</h2>

        <%
            String idParam = request.getParameter("id");
            if (idParam != null) {
                int id = Integer.parseInt(idParam);
                MonAn055DAO monAnDAO = new MonAn055DAO();
                MonAn055 monAn = monAnDAO.getMonAn(id);

                if (monAn != null) {
        %>
        <!-- Hiển thị chi tiết món ăn trong bảng -->
        <table class="details-table">
            <tr>
                <td>ID</td>
                <td><%= monAn.getId()%></td>
            </tr>
            <tr>
                <td>Tên món ăn</td>
                <td><%= monAn.getTen()%></td>
            </tr>
            <tr>
                <td>Giá</td>
                <td><%= String.format("%,.0f", monAn.getGia())%> VND</td>
            </tr>
            <tr>
                <td>Mô tả</td>
                <td><%= monAn.getMoTa()%></td>
            </tr>
        </table>
        <%
        } else {
        %>
        <p class="error-message">Món ăn không tồn tại.</p>
        <%
            }
        } else {
        %>
        <p class="error-message">ID món ăn không hợp lệ.</p>
        <%
            }
        %>

        <button type="button" class="back-button" onclick="history.back()">Quay lại</button>
    </body>
</html>
