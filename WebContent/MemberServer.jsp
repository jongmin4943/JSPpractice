<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.comstudy21.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
// 선언부 - 멤버필드, 멤메소드 선언 부분
private static ArrayList<MemberVo> list = new ArrayList<>();
{
	list.add(new MemberVo("1001","Kim","kim@naver.com", "010-1111-2222"));
	list.add(new MemberVo("1002","Hong","hong@naver.com", "010-2222-3333"));
	list.add(new MemberVo("1003","PARK","park@naver.com", "010-3333-4444"));
}

private JSONObject  show(JspWriter out, ArrayList<MemberVo> searchList) throws Exception {
	//GET 요청 처리
		//list에 있는 각 MemverVo 객체의 값이 JSONObject 객체로 이전된다.
		//JSONObject 객체를 JSONArrary로 저장한다.
		//JSONArray를 JSONObject root 속성에 저장.
		/* 
		JSONObject root = ("mem_list", [{}, {}, {}])
		*/
		JSONArray jsArr = new JSONArray();
		JSONObject rootObj = new JSONObject();
		for(int i = 0; i<searchList.size(); i++) {
			JSONObject jsObj = new JSONObject();
			jsObj.put("no",searchList.get(i).getNo());
			jsObj.put("name",searchList.get(i).getName());
			jsObj.put("email",searchList.get(i).getEmail());
			jsObj.put("phone",searchList.get(i).getPhone());
			jsArr.put(jsObj);
		}
		rootObj.put("mem_list", jsArr);
		out.print(rootObj);
		//브라우저 화면에 JSON 문자열 출력 해 보기
		return rootObj;
}

%>
<%
// 스크립트 릿 - service 함수의 내부 구현
String method = request.getMethod();

if("POST".equals(method)) {
	//POST 요청 처리
	MemberVo vo = new MemberVo();
	vo.setNo(request.getParameter("no"));
	vo.setName(request.getParameter("name"));
	vo.setEmail(request.getParameter("email"));
	vo.setPhone(request.getParameter("phone"));
	list.add(vo);
	show(out, list);
} else {
	//GET 요청 처리
	//cmd파라미터를 사용한다.
	String cmd = request.getParameter("cmd");
	String searchData = request.getParameter("searchData");
	if("search".equals(cmd)){
		//검색 요청을 받으면 목록을 새로 만들어서 show한다.
		ArrayList<MemberVo> newList = new ArrayList<MemberVo>();
		//검색 알고리즘을 이용해서 list에서 searchData를 검색해서 newList에 담아준다.
		for(MemberVo mv : list) {
			if(mv.getName().indexOf(searchData) != -1) {
				newList.add(mv);
			}
		}
		show(out, newList);
	} else {
		//default 전체 목록 show
		show(out, list);
	}
	
}

%>