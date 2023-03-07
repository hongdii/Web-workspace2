package com.kh.cookie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CookieCreateController
 */
@WebServlet("/cookieTest.do")
public class CookieCreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookieCreateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// url로 접근시 get 방식 활용
		// 쿠키 생성하기
		Cookie c = new Cookie("userId", "admin");
		// 쿠키 객체 생성시 저장할		key , value값을 생성자의 매개변수로 넣음
	
		// setMaxAge() 쿠키 유지시간 설정
		c.setMaxAge(24*60*60); // 1일 동안 유지되도록 설정
	
		// 생성된 cookie를 클라이언트에게 전달
		response.addCookie(c);
		
		Cookie c2 = new Cookie("email", "dhguswl@naver.com");
		c2.setMaxAge(60); // 60초 유지, 유지시간 지나면 자동삭제
		
		response.addCookie(c2);
		
		// 보여질곳정하고 포워딩
		// resonse안에 쿠키 두개담겨있음
		request.getRequestDispatcher("views/responsePage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
