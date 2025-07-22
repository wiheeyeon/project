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
<title>�� ����</title>
</head>
<body>
    <h1>�� ����</h1>
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
        
        // �Խñ� ��ȣ�� �Ķ���Ͱ��� ���� �޾ƿ� ������ ������ ����
        String num = request.getParameter("num");
        
        // MySQL�� �����ϱ� ���� �������� insertQuery ���ڿ� ���� (�о�� �Խñ� ��ȣ�� ����, �ҷ��� �Խñ��� ������)
        String insertQuery = "SELECT * FROM dbdorm.IOSF_BBS WHERE num=" + num;
        
        // SQL �������� ���� (MySQL�� ����)�ϱ� ���� ��ü ����
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        // ��ȸ�� ��������� �����ϱ� ���� ResultSet ��ü ����
        ResultSet result = psmt.executeQuery();
        
        // �޾ƿ� ������ ���� ��
        while(result.next())
        {%>
            <!-- �Է°��� �����ϱ� ���� post method ����� form action ���� -->
            <form action="post_modify_send.jsp" method="post">
            <!-- ������ textbox�� num���� ������, ���� ��ư�� ������ �Բ� post_modify_send.jsp�� ���� -->
            <input type="hidden" name="num" value="<%=result.getInt("num") %>">
            <table border="1">
                <tr>
                    <!-- �ۼ��� <td> ���� DB���� �޾ƿ� writer Į���� ���� -->
                    <td>�ۼ���</td>
                    <td><input type="text" name="writer" value="<%=result.getString("writer") %>"></td>
                </tr>
                <tr>
                    <!-- ���� <td> ���� DB���� �޾ƿ� title Į���� ���� -->
                    <td>����</td>
                    <td><input type="text" name="title" value="<%=result.getString("title") %>"></td>
                </tr>
                <tr>
                    <!-- ���� <td> ���� DB���� �޾ƿ� content Į���� ���� -->
                    <td>����</td>
                    <td><textarea rows="10" cols="20" name="content"><%=result.getString("content") %></textarea>
                </tr>
                <tr>
                    <td colspan="2">
                        <!-- ���� ��ư�� ������ post_modify_send.jsp�� ����Ǹ�, -->
                        <!-- submit ������ button�� ����, post ������� ���� ���� -->
                        <button type="submit">����</button>
                        <!-- ������� ��ư�� ������ post_list.jsp�� ����� -->
                        <button type="button" onclick="location.href='post_list.jsp'">�������</button>
                        <!-- ���󺹱� ��ư�� ������ text �Է°��� DB���� �޾ƿԴ� �����·� ��� �ʱ�ȭ -->
                        <button type="reset">���󺹱�</button>
                    </td>
                </tr>
            </table>
            </form>
    <%
        }
    }
    catch (Exception ex)
    {
    	out.println("������ �߻��߽��ϴ�. ���� �޽��� : " + ex.getMessage());
    }%>
</body>
</html>