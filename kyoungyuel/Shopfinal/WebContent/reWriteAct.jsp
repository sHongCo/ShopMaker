<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="data.*"%>
<jsp:useBean id="revo" class="data.REVO" scope="page" />
<jsp:setProperty name="revo" property="reContents" />
<jsp:setProperty name="revo" property="rePoint" />
<!DOCTYPE html>

	<%
	
	
		String uId = null;
		if (session.getAttribute("uId") != null) {
			uId = (String) session.getAttribute("uId");
		}
		
		if (session.getAttribute("pNum") != null) {
			//////////////////////////////////////////////////////////////
		//	String pNum = (String)session.getAttribute("pNum");
			session.getAttribute("pNum");
		
			/////////////////////////////////////////////////////////////
		}
		if (uId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 해주세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if (revo.getreContents() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력하지 않은 항목이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				DAO dao2 = new DAO();
				int result = dao2.writeReview(revo.getreContents(), uId, revo.getrePoint());
				if (result != -1) {
				
					////////////////////////////////
					
					session.setAttribute("pNum", revo.getpNum());
					////////////////////
					PrintWriter script = response.getWriter();
					script.println("<script>");
					//script.println("location.href = 'viewGood.jsp?pNum=2'");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글작성 완료')");
				//script.print("location.href = 'viewGood.jsp?pNum=2");
				//	pageContext.forward("viewGood.jsp");
				script.println("history.back()");
					script.println("</script>");
				}
			}
		}
	%>
 --%>
 
 
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="data.*"%>
<jsp:useBean id="revo" class="data.REVO" scope="page" />
<jsp:setProperty name="revo" property="reContents" />
<jsp:setProperty name="revo" property="rePoint" />
<!DOCTYPE html>

	<%
	
	
		String uId = null;
		String pNum = null;
		if (session.getAttribute("uId") != null) {
			uId = (String) session.getAttribute("uId");
		}
		
		if (request.getParameter("pNum") != null) {
			pNum =request.getParameter("pNum");
		}
		System.out.println("reWriteAct"+pNum);
		/* if (uId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 해주세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else { */
			if (revo.getreContents() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력하지 않은 항목이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				DAO dao2 = new DAO();
				int result = dao2.writeReview(revo.getreContents(), uId, revo.getrePoint());
				if (result != -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('리뷰등록 실패!')");
					pageContext.forward("viewGood.jsp");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글작성 완료')");
					//script.println("<jsp:forward page="">");
					pageContext.forward("viewGood.jsp");
					script.println("</script>");
				}
			}
		//}
	%>
 