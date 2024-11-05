<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>
<%
    String username = (String) request.getParameter("username");
    String password = (String) request.getParameter("password");
    ThanhVien055 tv = new ThanhVien055();
    tv.setUsername(username);
    tv.setPassword(password);
    ThanhVien055DAO dao = new ThanhVien055DAO();
    boolean kq = dao.kiemTraDangNhap(tv);
    if (kq && (tv.getVaiTro().equalsIgnoreCase("khachhang"))) {
        session.setAttribute("khachhang", tv);
        response.sendRedirect("kh\\gdChinhKH055.jsp");
    } else if (kq && (tv.getVaiTro().equalsIgnoreCase("quanli"))) {
        session.setAttribute("quanli", tv);
        response.sendRedirect("ql\\gdChinhQL055.jsp");
    } else {
        response.sendRedirect("gdDangNhap055.jsp?err=fail");
    }
%>