package com.kh.ajaxController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HtmlTestController
 */
@WebServlet("/jqHtmlTest.do")
public class HtmlTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HtmlTestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request.getParameter()에서 얻어온 값이 한글일 경우에
		// encoding 설정을 UTF-8로 해줘야함
		// 이 파일에서 따로 해주지않는 이유는 얻어온값이 없기때문
		
		// msg 키값을 가진 세미프로젝트 화이팅~ 세팅
		request.setAttribute("msg", "세미프로젝트 화이팅~");
		
		// htmlTest.jsp 파일로 값 포워딩
		request.getRequestDispatcher("views/htmlTest.jsp").forward(request, response);
		
	}

}
