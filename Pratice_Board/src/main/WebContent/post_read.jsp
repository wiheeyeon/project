<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� �� ����</title>
</head>
<body>
    <h1>�Խñ� �� ����</h1>
    <%
    try
    {
        // JDBC ����̹� ����
        Class.forName("com.mysql.jdbc.Driver");
        String db_address = "jdbc:mysql://localhost:3306/dbdorm";
        String db_username = "dorm";
        String db_pwd = "anamdorm1!";
        Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        // �޾ƿ��� ���ڿ��� ���ڵ� ��� ����
        request.setCharacterEncoding("UTF-8");
        
        // �Ķ���͸� ���� ������ �Խñ� ��ȣ�� �޾ƿ�, num ������ ����
        String num = request.getParameter("num");
        
        // MySQL�� �����ϱ� ���� �������� insertQuery ���ڿ� ���� (�о�� �Խñ� ��ȣ�� ����, �ҷ��� �Խñ��� ������)
        String insertQuery = "SELECT * FROM dbdorm.IOSF_BBS WHERE num=" + num;
        
        // SQL �������� ���� (MySQL�� ����)�ϱ� ���� ��ü ����
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        // ��ȸ�� ��������� �����ϱ� ���� ResultSet ��ü ����
        ResultSet result = psmt.executeQuery(); %>
        
        <table border="1">
            <%
            // �޾ƿ� ������ ������
            while(result.next())
            {%>
            	<tr>
            	    <!-- ��ȣ <td> ���� DB���� �޾ƿ� num Į���� ���� -->
            	    <td>��ȣ</td>
            	    <td><%=result.getInt("num") %></td>
            	</tr>
            	<tr>
            	    <!-- �ۼ��� <td> ���� DB���� �޾ƿ� reg_date Į���� ���� -->
            	    <td>�ۼ���</td>
            	    <td><%=result.getTimestamp("REG_DT") %></td>
            	</tr>
            	<tr>
            	    <!-- �ۼ��� <td> ���� DB���� �޾ƿ� writer Į���� ���� -->
            	    <td>�ۼ���</td>
            	    <td><%=result.getString("writer") %></td>
            	</tr>
            	<tr>
            	    <!-- ���� <td> ���� DB���� �޾ƿ� title Į���� ���� -->
            	    <td>����</td>
            	    <td><%=result.getString("title") %></td>
            	</tr>
            	<tr>
            	    <!-- ���� <td> ���� DB���� �޾ƿ� content Į���� ���� -->
            	    <td>����</td>
            	    <td><%=result.getString("content") %></td>
            	</tr>
            	<tr>
            	    <td colspan="2">
            	        <!-- ������� ��ư�� ������ post_list.jsp�� ����� -->
            	        <button type=button onclick="location.href='post_list.jsp'">�������</button>
            	    </td>
            	</tr>
            	<%            	
            }%>
        </table>
        <%
    }
    catch (Exception ex)
    {
        out.println("������ �߻��߽��ϴ�. ���� �޽��� : " + ex.getMessage());
    }%>

</body>
</html>