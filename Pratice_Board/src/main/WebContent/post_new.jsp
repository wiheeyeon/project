<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ű� �Խñ� �ۼ�</title>
</head>
<body>
    <h1>�ű� �Խñ� �ۼ�</h1>
    <!-- �Է°��� �����ϱ� ���� post method ����� form action ���� -->
    <form action="post_new_send.jsp" method="post">
        <table>
            <tr>
                <td>�ۼ���</td>
                <td><input type="text" name="writer"></td>
            </tr>
            <tr>
                <td>����</td>
                <td><input type="text" name="title"></td>
            </tr>
            <tr>
                <td>����</td>
                <td><textarea rows="10" cols="20" name="content"></textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                    <!-- ���� ��ư�� ������ post_read_send.jsp�� ����Ǹ�, -->
                    <!-- submit ������ button�� ����, post ������� ���� ���� -->
                    <button type="submit">����</button>
                    <!-- ������� ��ư�� ������ post_list.jsp�� ����� -->
                    <button type="button" onclick="location.href='post_list.jsp'">�������</button>
                    <!-- �ʱ�ȭ ��ư�� ������ text �Է°��� ��� �ʱ�ȭ�� -->
                    <button type="reset">�ʱ�ȭ</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>