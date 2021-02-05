<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! // 필드선언
String fname;
String city;
%>
<%
System.out.print("전송방식 : " + request.getMethod());
//get이나 post냐 에 따라 다른 처리가 가능하다.
//REST방식 처리 : GET, PUT, DELETE, POST...
if("POST".equals(request.getMethod())) {
fname=request.getParameter("name");
city=request.getParameter("city");
out.println("POST방식으로 전송받은 데이터를 필드에 저장완료");
} else {
out.print("Dear " + fname + ". ");
out.print("Hope you live well in " + city + ".");
}


%>