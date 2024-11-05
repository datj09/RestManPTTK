<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ khách hàng</title>
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
            ThanhVien055 kh = (ThanhVien055) session.getAttribute("khachhang");
            if (kh == null) {
                response.sendRedirect("../gdDangNhap055.jsp?err=timeout");
            }
        %>
        
        <div class="navbar">
            <div class="title">RestMan - Trang Chủ Khách Hàng</div>
            <div class="user-info">
                <span>Chào, <%= kh.getHoten()%> !</span>
                <button onclick="logout()">Đăng xuất</button>
            </div>
        </div>

        <div class="content">
            <h2>Chào mừng đến với RestMan</h2>
            <p>Bạn có thể tìm kiếm các món ăn yêu thích của mình tại đây.</p>
            <button class="btn" onclick="openPage('gdTimKiem055.jsp')">Tìm kiếm món ăn</button>
        </div>
    </body>
</html>
