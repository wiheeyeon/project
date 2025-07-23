<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
try
{
    // JDBC ����̹� ����
    Class.forName("com.mysql.cj.jdbc.Driver");
        String db_address = "jdbc:mysql://211.47.75.102/";
        String db_username = "dorm";
        String db_pwd = "anamdorm1!";
        Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
    // ���ڿ��� ���ڵ� ��� ����
    request.setCharacterEncoding("UTF-8");
    
    // ���� ��¥ ������ ��ǻ�Ϳ��� �޾ƿ� ��ü ����
    Timestamp today_date = new Timestamp(System.currentTimeMillis());
    
    // �Ķ���͸� ���� ������ �ۼ���, ����, ���� ������ �޾ƿ� �� ���ڿ� ������ ����
    String writer = request.getParameter("writer");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
	
	// �Խñ� ��ȣ�� �����ϱ� ���� �ӽ� ������ ���� ����`
	int num = 0;
	
	// MySQL�� �����ϱ� ���� �������� insertQuery ���ڿ� ���� (���� ��ϵ� �Խñ��� ������ �ľ�)
	String insertQuery = "SELECT MAX(num) from dbdorm.IOSF_BBS";
	
	// SQL �������� ���� (MySQL�� ����)�ϱ� ���� ��ü ����
	PreparedStatement psmt = connection.prepareStatement(insertQuery);
	
	// ��ȸ�� ��������� �����ϱ� ���� ResultSet ��ü ����
	ResultSet result = psmt.executeQuery();
	
	// �޾ƿ� ������ ������
	while(result.next())
	{
            // �ռ� �ӽ� ������ num ������, ������ MAX(num) Į���� + 1�� �Ͽ� ����
	    num = result.getInt("MAX(num)") + 1;
	}
	
	// MySQL�� �����ϱ� ���� �������� insertQuery ���ڿ� ���� (����ڰ� post_new.jsp ������ �ۼ��� ������ ����)
	insertQuery = "INSERT INTO pratice_board.post(num, title, writer, content, REG_DT) VALUES (?, ?, ?, ?, ?)";
	
	// SQL ��������, ���ο� ������ ���� �����
	psmt = connection.prepareStatement(insertQuery);
	
	// VALUES ? ���� �ϳ��� �����Ͽ� ����
	psmt.setInt(1, num);
	psmt.setString(2, title);
	psmt.setString(3, writer);
	psmt.setString(4, content);
	psmt.setTimestamp(5, today_date);
	
	// INSERT �Ͽ� �ݿ��� ���ڵ��� �Ǽ������ ��ȯ
	psmt.executeUpdate();
	
	// ��� �Ϸ�Ǹ�, post_list.jsp(�� ���) ������ �ǵ��� �´�.
	response.sendRedirect("post_list.jsp");
}
catch (Exception ex)
{
    out.println("������ �߻��߽��ϴ�. ���� �޽��� : " + ex.getMessage());
}
%>