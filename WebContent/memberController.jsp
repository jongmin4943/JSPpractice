<%@page import="org.apache.tomcat.util.json.JSONParser"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.comstudy21.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
//멤버 필드선언 하는 부분
private static ArrayList<MemberVo> list = new ArrayList<>();
{
	list.add(new MemberVo("1001","Kim","kim@naver.com", "010-1111-2222"));
	list.add(new MemberVo("1002","Hong","hong@naver.com", "010-2222-3333"));
	list.add(new MemberVo("1003","PARK","park@naver.com", "010-3333-4444"));
	
}
%>
<%
//service() 메소드 구현 부분

if("POST".equals(request.getMethod())) {
	//POST 요청 처리 부분
	String no = request.getParameter("no");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	list.add(new MemberVo(no,name,email,phone));
	System.out.println("저장 완료");
} else {
	JSONArray jsArr = new JSONArray();
	for(int i = 0; i<list.size(); i++) {
		JSONObject jsObj = new JSONObject();
		jsObj.put("no", list.get(i).getNo());
		jsObj.put("name", list.get(i).getName());
		jsObj.put("email", list.get(i).getEmail());
		jsObj.put("phone", list.get(i).getPhone());
		jsArr.put(jsObj);
	}
	JSONObject rootObj = new JSONObject();
	rootObj.put("mem_list", jsArr);
	
	//JSONParser jParser = new JSONParser();

	
	
	out.println(rootObj.toString());
	//GET 요청 처리 부분
	//JSONObject 라이브러리 활용, ArrayList 데이터를 JSON 문자열로 변경한다.
	//변경된 JSON문자열을 화면에 출력 한다.
}
%>