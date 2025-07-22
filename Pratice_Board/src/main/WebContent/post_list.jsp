<!-- SQL ������ ���� import -->
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
<title>�Խñ� ���</title>
</head>
<body>
    <!-- �Խñ� ��� ������ ǥ�� -->
    <h1>�Խñ� ���</h1>
      <%
      try
      {
        // JDBC ����̹� ����
        Class.forName("com.mysql.jdbc.Driver");
        String db_address = "jdbc:mysql://localhost:3306/dbdorm";
        String db_username = "dorm";
        String db_pwd = "anamdorm1!";
        Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        // MySQL�� �����ϱ� ���� �������� insertQuery ���ڿ� ����
        String insertQuery = "SELECT * FROM dbdorm.IOSF_BBS order by num desc";
        
        // MySQL ������ ����
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        // �������� ������ �޾ƿ� ������ result ��ü�� ����
        ResultSet result = psmt.executeQuery();%>
        
        <!-- �Խñ� ����� ǥ���� �⺻ ���̺� ���� -->
        <table border="1">
        <tr>
          <td colspan="5">
            <h3>�Խñ� ���� Ŭ���� �� ���� ����</h3>
          </td>
        </tr>
        <tr>
		  <td colspan="5">
            <button type="button" value="�ű� �� �ۼ�" onClick="location.href='post_new.jsp'">�ű� �� �ۼ�</button>
          </td>
        </tr>
        <tr>
          <td>��ȣ</td>
          <td>�ۼ���</td>
          <td>����</td>
          <td>�ۼ���</td>
          <td>����</td>
        </tr>
        <%
        // �޾ƿ� ������ �Է��ϰ�, �ϳ��� Ŀ���� �������� �ѱ�
        while (result.next())
          {%>
            <tr>
              <!-- ��ȣ <td> �Ʒ��� DB���� �޾ƿ� num Į���� ���� -->
              <td><%=result.getInt("num") %></td>
              
              <!-- �ۼ��� <td> �Ʒ��� DB���� �޾ƿ� writer Į���� ���� -->
              <td><%=result.getString("writer") %></td>
              
              <!-- ���� <td> �Ʒ��� DB���� �޾ƿ� title Į���� ����, ���� Ŭ���� post_read.jsp�� ����Ǹ� num Į������ parameter�� �ѱ� -->
              <td><a href="post_read.jsp?num=<%=result.getInt("num") %>"><%=result.getString("title") %></a></td>
              
              <!-- �ۼ��� <td> �Ʒ��� DB���� �޾ƿ� reg_date Į���� ���� -->
              <td><%=result.getTimestamp("REG_DT") %></td>
              
              <td>
                <!-- ���� ��ư�� ������ post_modify.jsp�� ����Ǹ� num Į������ parameter�� �ѱ� -->
                <button type="button" value="����" onClick="location.href='post_modify.jsp?num=<%=result.getString("num") %>'">����</button>
                <!-- ���� ��ư�� ������ post_delete_send.jsp�� ����Ǹ� num Į������ parameter�� �ѱ� -->
                <button type="button" value="����" onClick="location.href='post_delete_send.jsp?num=<%=result.getString("num") %>'">����</button>
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