<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
try
{
	// JDBC ����̹� ����
    Class.forName("com.mysql.jdbc.Driver");
    String db_address = "jdbc:mysql://localhost:3306/dbdorm";
    String db_username = "dorm";
    String db_pwd = "anamdorm1!";
    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
    
    // ���ڿ��� ���ڵ� ��� ����
    request.setCharacterEncoding("UTF-8");
    
    // �Ķ���͸� ���� ������ �Խñ� ��ȣ�� �޾ƿ�, num ������ ����
    String num = request.getParameter("num");
    
    // MySQL�� �����ϱ� ���� �������� insertQuery ���ڿ� ���� (�о�� �Խñ� ��ȣ�� ����, ������ �Խñ��� �ٽ��ѹ� ����(Ȯ��)��)
    String insertQuery = "DELETE FROM dbdorm.IOSF_BBS WHERE num=" + num;
    
    // SQL �������� ���� (MySQL�� ����)�ϱ� ���� ��ü ����
 	PreparedStatement psmt = connection.prepareStatement(insertQuery);

    // DELETE �Ͽ� �ݿ��� ���ڵ��� �Ǽ������ ��ȯ
    psmt.executeUpdate();
 	
    // ��� �Ϸ�Ǹ�, post_list.jsp(�� ���) ������ �ǵ��� �´�.
    response.sendRedirect("post_list.jsp");
}
catch (Exception ex)
{
	out.println("������ �߻��߽��ϴ�. ���� �޽��� : " + ex.getMessage());
}
%>