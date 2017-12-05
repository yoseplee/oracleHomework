<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>    
<%
String URL = "jdbc:mysql://129.150.125.98:3306/dku";         //3306은 Mysql포트번호, dku는 DB명
String USER = "dku";                                   //계정 id 
String PASS="1234";

Connection conn=null;
Statement stmt = null;
ResultSet rs = null;

try
{
        Class.forName("com.mysql.jdbc.Driver");                 //mysql을 사용
        conn = DriverManager.getConnection(URL, USER, PASS);    //아이디, 비밀번호, 주소를 넣고 연결 
        stmt = conn.createStatement();
        rs = stmt.executeQuery( "select * from student order by id desc limit 1;" );         //DB내 테이블명
        while( rs.next() )
        {
                String id = rs.getString("id");                 //ID, name은 테이블 내 필드명입니다 
                String name = rs.getString("name");
				String email = rs.getString("email");
                out.println(" ID: "+id+"<br>"+"이름 : "+name+"<br>"+" Email : "+email+"<br><br>");
        }
}catch(SQLException e)                                  //try문 종료
{
        out.println(e.getMessage());
}
finally
{
        if(rs != null)try{rs.close();}catch(SQLException ex){}
        if(stmt != null)try{stmt.close();}catch(SQLException ex){}
        if(conn != null)try{conn.close();}catch(SQLException ex){}
}
%>