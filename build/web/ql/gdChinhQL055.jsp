<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ quản lí</title>
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <script>
            function openPage(page) {
                window.location.href = page;
            }
            function logout() {
                window.location.href = "../gdDangNhap055.jsp";
            }
        </script>
    </head>
    <body>
        <%
            ThanhVien055 ql = (ThanhVien055) session.getAttribute("quanli");
            if (ql == null) {
                response.sendRedirect("../gdDangNhap055.jsp?err=timeout");
            }
        %>
        
        <div class="navbar">
            <div class="title">RestMan - Trang Chủ Quản Lí</div>
            <div class="user-info">
                <span>Chào, Quản Lí!</span>
                <button onclick="logout()">Đăng xuất</button>
            </div>
        </div>

        <div class="content">
            <h2>Quản lí RestMan</h2>
            <button class="btn" onclick="openPage('gdChonTK055.jsp')">Xem thống kê</button>
        </div>
    </body>
</html>
