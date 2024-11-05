<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.MonAn055DAO, model.MonAn055, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Tìm Kiếm Món Ăn</title>
        <link rel="stylesheet" type="text/css" href="../css/style2.css">
    </head>
    <body>
        <h2>Tìm kiếm món ăn</h2>

        <form method="get" action="gdTimKiem055.jsp">
            <label for="tukhoa"></label>
            <input type="text" name="tukhoa" id="tukhoa" placeholder="Nhập tên món ăn..." required>
            <input type="submit" value="Tìm kiếm">
        </form>

        <%
            String tukhoa = request.getParameter("tukhoa");
            if (tukhoa != null && !tukhoa.trim().isEmpty()) {
                MonAn055DAO monAnDAO = new MonAn055DAO();
                ArrayList<MonAn055> listMonAn = monAnDAO.getTenMonAn(tukhoa);

                if (listMonAn.isEmpty()) {
        %>
        <p class="message">Không tìm thấy món ăn nào phù hợp với từ khóa "<%= tukhoa%>".</p>
        <%
        } else {
        %>
        <table>
            <tr>
                <th>ID</th>
                <th>Tên Món Ăn</th>
                <th>Xem thông tin</th>
            </tr>
            <%
                for (MonAn055 monAn : listMonAn) {
            %>
            <tr>
                <td><%= monAn.getId()%></td>
                <td><%= monAn.getTen()%></td>
                <td>
                    <form action="gdMonAn055.jsp" method="get">
                        <input type="hidden" name="id" value="<%= monAn.getId()%>">
                        <input type="submit" value="Xem">
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <%
                }
            }
        %>
    </body>
</html>
