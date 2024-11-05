<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Đăng nhập</title>
        <link rel="stylesheet" type="text/css" href="css/loginstyle.css">
    </head>
    <body>
        <div class="login-container">
            <h2>Đăng nhập</h2>
            <%
                if (request.getParameter("err") != null) {
                    if (request.getParameter("err").equalsIgnoreCase("timeout")) {
            %>
                        <div class="info-message">Hết phiên làm việc. Vui lòng đăng nhập lại!</div>
            <%
                    } else if (request.getParameter("err").equalsIgnoreCase("fail")) {
            %>
                        <div class="error-message">Sai tên đăng nhập hoặc mật khẩu!</div>
            <%
                    }
                }
            %>
            <form name="dangnhap" action="doDangNhap055.jsp" method="post" onsubmit="return validateForm()">
                <label for="username">Tên đăng nhập:</label>
                <input type="text" name="username" id="username" required />

                <label for="password">Mật khẩu:</label>
                <input type="password" name="password" id="password" required />

                <input type="submit" value="Đăng nhập" />
            </form>
        </div>

        <script>
            // JavaScript cho kiểm tra form trước khi gửi để tiết kiệm tài nguyên máy chủ thay vì gửi dữ liệu thiếu thông tin lên máy chủ để kiểm tra
            function validateForm() {
                const username = document.getElementById("username").value.trim();
                const password = document.getElementById("password").value.trim();

                if (username === "" || password === "") {
                    alert("Vui lòng nhập cả tên đăng nhập và mật khẩu.");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
