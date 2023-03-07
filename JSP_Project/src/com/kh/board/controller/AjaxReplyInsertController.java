package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Reply;
import com.kh.board.model.vo.ReplyBuilder;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AjaxReplyInsertController
 */
@WebServlet("/rinsert.bo")
public class AjaxReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ajax에서 건내준 키값으로 파라미터값얻어와야함
		String content = request.getParameter("content");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
	
		// Reply객체로 얻어온값 객체화
		Reply r = new Reply();
		r.setReplyContent(content);
		r.setRefBno(bno);
		r.setReplyWriter(userNo+"");
		
		// 스프링에서는 필드명그대로 메서드로 사용함 
		// ex) setReplyContent() -> replyContent()
		ReplyBuilder rb = new ReplyBuilder.
								Builder(1).
								setReplyContent("댓글내용").
								setRefBno(1).
								build();
		
		// result는 등록된 행의 갯수를 반환받을것임
		int result = new BoardService().insertReply(r);
			
		response.setContentType("text/html; charset=UTF-8");
		
		// 비동기식 전달
		// 행의수 1 혹은 0 전달
		response.getWriter().print(result);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
