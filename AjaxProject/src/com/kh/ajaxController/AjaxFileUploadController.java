package com.kh.ajaxController;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AjaxFileUploadController
 */
@WebServlet("/fileUpload.do")
public class AjaxFileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFileUploadController() {
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
		
		// WebContent/upload/
		String filePath = request.getServletContext().getRealPath("/upload/");
		
		// 전달된 데이터 이용
		// 웹서버안에 자동저장되게하기위해 MultipartRequest객체 생성
		// MultipartRequest( MultipartRequest와 연결할 request객체, 
		// 					서버측에 저장될 경로, 최대 파일 크기, 파일 인코딩 방식, 파일 중복 처리를 위한 매개변수 )
		MultipartRequest multi = new MultipartRequest(request, filePath, 1024*1024*100, "UTF-8", 
				new MyFileRenamePolicy());
		
		// 원본파일이름 얻어오기
		System.out.println( multi.getOriginalFileName("upfile0") );
		
		// 전달된 파일들의 key값만 뽑아오기
		Enumeration e = multi.getFileNames();
//		Enumeration은 다음 내용이 있는지 확인하는 hasMoreElements() 메서드와 
		//그 값을 가져오는 nextElement() 메서드가 있고 
		//컬렉션의 데이터를 삭제하는 기능은 없음
		
		// while문 사용해서 넘어온 모든 파일의 원본명과 수정명을 콘솔창에 출력함
		while(e.hasMoreElements()) {
			String fileName = (String) e.nextElement();
			String originName = multi.getOriginalFileName(fileName); // 넘어온 파일의 원본명
			String changeName = multi.getFilesystemName(fileName); // 넘어온 파일의 수정명
								// 반환형 object여서 String으로 형변환
			System.out.println( originName+"||||"+changeName);
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
