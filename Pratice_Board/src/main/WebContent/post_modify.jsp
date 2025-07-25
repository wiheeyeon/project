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
<title>글 수정</title>
</head>
<body>
    <h1>글 수정</h1>
    <%
    try
    {
    	// JDBC 드라이버 연결
       Class.forName("com.mysql.cj.jdbc.Driver");
        String db_address = "jdbc:mysql://211.47.75.102/";
        String db_username = "dorm";
        String db_pwd = "anamdorm1!";
        Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        // 문자열의 인코딩 방식 결정
        request.setCharacterEncoding("UTF-8");
        
        // 게시글 번호를 파라미터값을 통해 받아와 정수형 변수에 저장
        String num = request.getParameter("num");
        
        // MySQL로 전송하기 위한 쿼리문인 insertQuery 문자열 선언 (읽어온 게시글 번호를 통해, 불러올 게시글을 결정함)
        String insertQuery = "SELECT * FROM dbdorm.IOSF_BBS WHERE num=" + num;
        
        // SQL 쿼리문을 실행 (MySQL로 전송)하기 위한 객체 선언
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        // 조회된 결과물들을 저장하기 위한 ResultSet 객체 선언
        ResultSet result = psmt.executeQuery();
        
        // 받아온 정보가 있을 때
        while(result.next())
        {%>
            <!-- 입력값을 전송하기 위한 post method 방식의 form action 선언 -->
            <form action="post_modify_send.jsp" method="post">
            <!-- 숨겨진 textbox에 num값을 삽입해, 수정 버튼을 누르면 함께 post_modify_send.jsp로 전송 -->
            <input type="hidden" name="num" value="<%=result.getInt("num") %>">
            <table border="1">
                <tr>
                    <!-- 작성자 <td> 옆에 DB에서 받아온 writer 칼럼값 삽입 -->
                    <td>작성자</td>
                    <td><input type="text" name="writer" value="<%=result.getString("writer") %>"></td>
                </tr>
                <tr>
                    <!-- 제목 <td> 옆에 DB에서 받아온 title 칼럼값 삽입 -->
                    <td>제목</td>
                    <td><input type="text" name="title" value="<%=result.getString("title") %>"></td>
                </tr>
                <tr>
                    <!-- 내용 <td> 옆에 DB에서 받아온 content 칼럼값 삽입 -->
                    <td>내용</td>
                    <td><textarea rows="10" cols="20" name="content"><%=result.getString("content") %></textarea>
                </tr>
                <tr>
                    <td colspan="2">
                        <!-- 수정 버튼을 누르면 post_modify_send.jsp로 연결되며, -->
                        <!-- submit 형식의 button을 통해, post 방식으로 내용 전송 -->
                        <button type="submit">수정</button>
                        <!-- 목록으로 버튼을 누르면 post_list.jsp로 연결됨 -->
                        <button type="button" onclick="location.href='post_list.jsp'">목록으로</button>
                        <!-- 원상복구 버튼을 누르면 text 입력값이 DB에서 받아왔던 원상태로 모두 초기화 -->
                        <button type="reset">원상복구</button>
                    </td>
                </tr>
            </table>
            </form>
    <%
        }
    }
    catch (Exception ex)
    {
    	out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
    }%>
</body>
</html>