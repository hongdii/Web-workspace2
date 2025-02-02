package com.kh.cookie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckCookieController
 */
@WebServlet("/checkCookie.do")
public class CheckCookieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckCookieController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// location.href 로 접근시 get방식
		
		// 서버측에서 쿠키확인
		
		// client가 보낸 cookie값들 확인
		// cookie값은 request객체안에 담겨있고, getCookies()메소드를 이용하여 꺼내올수있다.
		// session값도 request객체안에 담겨있고, getSession()메소드를 이용하여 꺼내왔음.
		// getCookies() 반환형은 Cookie[]임 (서버에 저장되는 쿠키값이 한개가 아니기때문에)
		
		Cookie[] cookies = request.getCookies(); // 저장된 쿠키가 없다 ? --> null값이 반환됨
		
		if(cookies != null) {
			
			for(Cookie c : cookies) {
				// Cookie값을 확인하는 메소드 : getName(), getValue()
				System.out.println("키값 : "+c.getName()+", value값 : "+c.getValue());
				
			}
		}
		
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
