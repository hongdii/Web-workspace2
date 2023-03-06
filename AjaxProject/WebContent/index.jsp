<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
// 	request는 페이지 시작과 함께 생성
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax 개요</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1>Ajax 개요</h1>
	
	<p>
		Asynchronous JavaScript And Xml의 약자
		서버로부터 데이터를 가져와 전체 페이지를 새로고침하지 않고 일부만 로드할 수 있게 하는 기법<br>
		우리가 기존에 a태그로 요청하거나 form를 통해 요청했던 방식은 동기식 요청방식<br>
		=> 응답페이지가 들어와야 볼수있으며 응답페이지가 호출되기전까지 아무요청하지못함<br>
		비동기식 요청을 보내기 위해서는 AJAX라는 기술이 필요함
		<br><br>
		
		* 동기식/비동기식<br>
		- 동기식 : 요청 처리 후 그에 해당하는 응답페이지가 돌아와야만 그 다음 작업 가능함<br>
		만약 서버에서 호출된 결과까지의 시간이 지연되면 계속 기다려야함(흰화면으로 보여지게됨)<br>
		전체 페이지가 리로드됨(새로고침 즉, 페이지가 기본적으로 한번 깜빡거림)<br><br>
		
		- 비동기식 : 현재 페이지를 그대로 유지하면서 중간중간 추가적인 요청을 보내줄 수 있음<br>
		요청을 한다고해서 다른페이지로 넘어가지 않음(현재 페이지 유지)<br>
		요청을 보내놓고 그에 해당하는 응답이 돌아올때 까지 현재 페이지에서 다른 작업을 할수있음
		ex) 아이디 중복체크기능, 검색어 자동완성 기능
		
		* 비동기식의 단점
		- 현재 페이지에 지속적으로 리소스가 쌓임 => 페이지가 느려질수 있음<br>
		- 페이지내 복잡도가 크게 증가함 -> 에러 발생시 대처가 어려워질수 있음<br>
		- 요청 후 들어온 응답데이터를 가지고 현재 페이지에 새로운 요소를 만들어서 뿌려줘야되는데,
			DOM요소를 새로이 만들어내는 구문을 잘숙지해야함<br><br>
		
	</p>
	
	<h1>javascript 방식을 이용한 Ajax테스트</h1>
	
	<h3>1. 버튼 클릭시 get 방식으로 서버에 데이터 전송 및 응답</h3>
	
	<h3>자바스크립트를 이용한 ajax통신</h3>
	
	<button onclick="ajaxTest1();">JavaScript ajax 테스트 1</button>
	
	<h3>2. 버튼 클릭시 post 방식으로 서버에 데이터 전송 및 응답</h3>
	
	<button onclick="ajaxTest2();">JavaScript ajax 테스트 2(POST 방식)</button>
	
	<div id="target">
	</div>
	
	<script>
		
		function ajaxTest1(){
			// ajax로 서버와 통신하기
			// 1. XMLHttpRequest 객체 생성하기
			const xhr = new XMLHttpRequest();
			
			// 2. XMLHttpRequest 객체를 설정하기
			// open() 함수를 이용해서 통신값을 설정
			// open()의 매개변수 1 : get/post , 매개변수 2 : 요청을 보내는 주소, [3 : 동기식, 비동기식 설정]
			// * 클라이언트가 보내는 값을 파라미터로 전송
			xhr.open("get", "<%= contextPath %>/ajaxTest.do?id=admin");
			
			// 3. 요청에 대한 서버 응답을 처리할 함수를 지정
// 			xhr객체의 onreadystatechange속성에 이벤트핸들러를 추가
			// xhr객체의 상태(state)를 관리하는 속성
			// 1) readyState : 전송상태를 관리
			// 2) status : 응답결과를 관리
			
			xhr.onreadystatechange = function(){
// 				console.log(xhr.readystate, xhr.status);
				// 응답결과가 제대로 수신되었는지 체크
				if(xhr.readyState == 4){ // 응답완료( reayState == 4 )
					
					if(xhr.status == 200){ // 정상적으로 수신완료
						// 서버가 응답한 내용은 xhr객체의 responseText라는 속성에 자동으로 들어감
						console.log(xhr.responseText);
						document.getElementById("target").innerHTML += "<h3>"+xhr.responseText+"</h3>";
					}
					else if(xhr.status == 404){ // 응답결과가 404 ? 찾는 페이지 (url)이 존재하지 않다.
						alert("찾는 페이지가 존재하지 않습니다.");
					} else{ // 그외 에러
						alert("에러가 발생했습니다..");
					}
				}
			}
			
			// 설정 완료 후 요청을 보냄(send)
			xhr.send();
		}
		
		function ajaxTest2(){
			// 객체가 있어야 데이터 전송가능
			const xhr = new XMLHttpRequest();
			
			xhr.open("post", "<%= contextPath%>/ajaxTest.do");
			xhr.onreadystatechange = function(){
				
				// readyState은 xhr안에 있는 프로퍼티
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						document.getElementById("target").innerHTML += "<h4>"+xhr.responseText+"</h4>";
					}
				}
			}
			// post 방식으로 데이터 전송시 파라미터 설정 방법
			// url에 데이터 내용을 작성하지 않고, send함수의 매개변수로 작성해야함.
			// 전송방식도 수정해줘야함.
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			// 여러개값 전달하려면 & 붙여서 보내기
			xhr.send("id=user01");
		}
	</script>
	
	<pre>
		* jQuery 방식에서의 AJAX통신
		
		$.ajax({
			속성명:속성값,
			속성명:속성값,
			속성명:속성값,
			...
		});
		
		* 주요속성
		- url : 요청할 url(필수)
		- type|method : 요청전송방식(get/post, 생략시 기본값은 get)
		- data : 요청시 전달할 값
<!-- 		success, error, complete는 컴파일 에러시 실행안됨 -->
		- success : ajax통신 성공시 실행할 함수(이벤트 핸들러)를 정의
		- error: ajax통신 실패시 실행할 함수를 정의
		- complete : ajax통신 실패했든, 성공했든 무조건 실행할 함수 정의
		
		* 부수적인 속성
		- async : 서버와의 비동기 처리방식 설정 여부(기본값 true)
		- contentType : requset의 데이터 인코딩 방식 정의(보내는 측의 데이터 인코딩)
		- dataType : response로 오는 데이터의 자료형설정(값을 추가안하면 스마트하게 판단함)
			-- dataType에 들어갈 데이터값
					 text : String데이터
					 xml : 트리형태의 구조
					 json : 맵 형태의 구조(일반적인 데이터구조)
					 script: javascript 및 일반 String 형태의 데이터
					 html : html 태그 자체를 return하는 방식
		- accept : 파라미터의 타입 설정(사용자특화된 파라미터 타입 설정 가능)
		- beforeSend : ajax요청을 하기전에 실행되는 이벤트핸들러(데이터가공 및 header관련 설정)
		- cache : 요청 및 결과값을 scope에서 갖고 있지 않도록 하는것(기본값 true)
		- contents : jQuery에서 response의 데이터를 파싱하는 방식 정의
		- crossDomain : 타 도메인 호출 가능 여부 (기본값 false)
		- dataFilter : response데이터를 받았을때 정상적인 값을 return할수 있도록 데이터와 데이터 타입 설정
		- global : 기본 이벤트 사용여부 => 버퍼링같이 시작과 끝을 나타낼때, 선처리 작업시 사용함.
		- password : 서버에 접속권한이 필요한 경우 설정
		- processDta : 서버로 보내는 값에 대한 형태 설정 여부(기본 데이터 원하는 경우 false)
		- timeout : 서버 요청시 응답 대기시간 설정(ms단위)
	</pre>
	
	<h1>jQuery 방식을 이용한 AJAX 테스트</h1>
	
	<h3>1. 버튼 클릭시 get 방식으로 서버에 데이터 전송 및 응답</h3>
	
	입력 : <input type="text" id="input1">
	<button id="btn1">전송</button>
	<br>
	
	응답 : <label id="output1">응답대기중...</label>
	
	<script>
		$(function(){
			
			$("#btn1").click(function(){
				// 기존의 동기식 방식
				// location.href = "/ajax/url.do?input="+input.value;
			
				// 비동기식 통신 : 페이지 전환이 되지 않는다.
				$.ajax({
// 					절대경로로 url 요청
					// url은 필수로 작성
					url:'<%= contextPath %>/jqAjax1.do',  
					type:'get',
					// 객체로 묶어서 키-밸류 로 전달
					data : {input : $("#input1").val()},
					success : function(result){ // 매개변수에는 서블릿으로부터 전달받은 응답데이터가 담겨있다.
					// xhr.reponseText와 같음
						console.log(result);
					$("#output1").text(result);
						
					},
					error : function(){
						console.log("ajax통신 실패");
					},
					complete : function(){
						console.log("ajax통신 여부와 상관없이 항상 실행됨");
					}
				})
			});
			
		});
	</script>
	
	<hr>
	<br>
	
	<h3> 2. 버튼 클릭시 post 방식으로 서버에 데이터 전송 및 응답</h3>
	
<!-- 	비동기식 사용시 input 태그에 required 속성 사용 불가 
		required 속성은 "form 태그 안에서 submit타입의 input태그일때만 가능"
		-->
	이름 : <input type="text" id="input2_1"> <br>
	나이 : <input type="number" id="input2_2"> <br>
	<button onclick="test2();">전송</button>
	<br>
	
	응답 : <label id="output2">응답 대기중...</label>
	
	<script>
		
		
		function test2(){
			// 버전1) 문자열데이터 응답받기
<%-- 			$.ajax({
 				url : "<%= contextPath %>/jqAjax2.do", 
 				data : {
 					name : $("#input2_1").val(),
 					age : $("#input2_2").val()
 				},
  				type : 'post',
  				success: function(result){
  					$("#output2").text(result);		
					
  					// 입력값을 초기화
  					$("#input2_1").val("");
 					$("#input2_2").val("");
 				},
 				error : function(){
 					console.log("통신실패");
 				}
				
 			})--%>

			// 버전2) JSON데이터 응답받기
			
			$.ajax({
				url : "<%= contextPath %>/jqAjax2.do",
				data : {
					name : $("#input2_1").val(),
					age  : $("#input2_2").val()
				},
				type : 'post',
				success: function(result){
					console.log(typeof(result));
					console.log(result);
					
					//JSONArray 응답받는경우
					//$("#output2").text("이름 : "+result[0]+", 나이 : "+result[1]);
					
					//JSONObject 응답받는경우
					// {name:"현지", age:"20"}
					$("#output2").text("이름 : "+result.name+", 나이 : "+result.age);
				},
				error : function(){
 					console.log("통신실패");
				}
			})
			
		}
		
	</script>
	
	<h3>3. 서버로 데이터 전송 후, 조회된 객체를 응답데이터로 받기</h3>
	
	회원번호 입력 : <input type="number" id="input3">
	<button onclick="test3();">조회</button>
	
	<div id="output3"></div>
	
	<script>
		function test3(){
			$.ajax({
// 				get post방식 생략되어서 get방식 기본값
				url : "jqAjax3.do",
				data : {no : $("#input3").val()},
				success : (result) => {
					console.log(result);
					
					let resultStr = "회원번호 : "+result.userNo+"<br>"
									+ "이름 : "+result.userName+"<br>"
									+ "아이디 : "+result["userId"]+"<br>"
									+ "주소 : "+result["address"]+"<br>";
									
					$("#output3").html(resultStr);
				},
				error : function(req, status, error){
					console.log(req, status, error);
				}
			})
		}
	</script>
	
	<h3>4. 응답 데이터로 여러개의 객체들이 담겨있는 ArrayList받기</h3>
	
	<button onclick="test4();">회원정보조회</button>
	
	<table id="output4" border="1" style="text-align:center">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	<script>
		function test4(){
			
			$.ajax({
				url : "<%=contextPath%>/jqAjax4.do",
				success : function(result){
					let str = "";
					
					// length메서드 사용=> 전달값 배열
					for(let i=0 ; i<result.length ; i++){
						str += "<tr>"
								+"<td>"+ result[i].userNo +"</td>"
								+"<td>"+ result[i].userName +"</td>"
								+"<td>"+ result[i]['userId'] +"</td>"
								+"<td>"+ result[i]['address'] +"</td>"
						str += "</tr>";
					}
					
					$("#output4 tbody").html(str);
				
				}
			});
		}
	</script>
	
	<h2>5. ajax를 활용한 자동완성기능 구현하기</h2>
	<select id="searchType">
		<option value="1">글제목</option>
		<option value="2">카테고리</option>
		<option value="3">글내용</option>
		<option value="4">작성자</option>
	</select>
	<br>
	
	<input id="keyword" type="text" placeholder="찾을 게시글을 작성하세요">
	<br>
	
	<select id="list">
	</select>
	
	<script>
	// keyup()을 통해 키보드가 눌릴때마다 url로 비동기요청을 보냄
		$(function(){
			$("#keyword").keyup(function(e){
				$.ajax({
					url : "<%= contextPath%>/jqAutoSearch.do",
					data : {
						keyword : $("#keyword").val(),
						searchType : $("#searchType").val()	
					},
					success : function(data){
						
						$("#list").html(""); // 리스트 비워주기
						console.log(data);
						
						let str = "";
						for(let i=0 ; i<data.length ; i++){
							str += '<option>'
								+ data[i].boardTitle
								+'</option>'
						}
						
						$("#list").html(str);
						
					}
				
				})
			});
		});
	</script>
	
	<h2>6. Ajax로 html파일 받아오기</h2>
	
	<button id="htmlAjax">html문서 받기</button>
	<div id="htmloutput"></div>
	
	<script>
	// 비동기식통신을 활용해서 페이지를 계속 전환하는것이 아니라
	// 페이지안에서 내용만 변경시켜줌
		$(function(){
			$("#htmlAjax").click(function(){
				
				$.ajax({
					url : "<%=contextPath%>/jqHtmlTest.do",
					type : "post",
					dataType : "html",
					// dataType 생략해도 알아서 해줌
					// 명시적으로 데이터타입 작성해주는 것이 좋음
					success : function(data){
						console.log(data);
						$("#htmloutput").html(data);
					}
					
				});
			});
		});
	</script>
	
	<h2>7. xml데이터 가져오기 </h2>
	<button id="xmlTest">xml 데이터 가져오기</button>
	
	<div id="fiction">
		<h2>소설</h2>
		<table id="fiction-info">
		
		</table>
	</div>
	
	<div id="it">
		<h2>프로그래밍</h2>
		<table id="it-info">
		</table>
	</div>
	
	<script>
		$(function(){
			$("#xmlTest").click( () => {
				$.ajax({
					// 존재하는 파일(css, xml,..) 등은
					// 아파치가 받아줌
					url : "books.xml",
					//data => xml 파일 자체
					success : function(data){
						let ficheader = "<tr><th>제목</th><th>저자</th>";
						let itheader = ficheader;
						
						console.log(data);
						
						// find() 후손찾는 메서드
// 						let entity = $(data).find("books");
						// 해당 xml태그의 시작태그 가져오는 법 find(":root") ==> 시작태그 모를때 유용
						let entity = $(data).find(":root");
						console.log(entity);
						
						let books = $(entity).find("book");
						console.log(books);
						
						books.each( function(index , item){
							let info = "<tr>"
										// item은 book객체 자체
										 + "<td>" + $(item).find("title").text() + "</td>"
										 + "<td>" + $(item).find("author").text() + "</td>"
									 + "</tr>";
							
							let subject = $(item).find("subject").text();
							
							if(subject == "소설"){
								ficheader += info;
							}else if(subject == "프로그래밍"){
								itheader += info;
							}
						})
						
						$("#fiction-info").html(ficheader);
						$("#it-info").html(itheader);
					}
				});
			});
		});
		
	</script>
	
	<h2>8. Ajax를 이용한 파일 업로드 처리하기</h2>
	
<!-- 	multiple 여러개 업로드하는 속성 -->
	<input type="file" id="upfile" multiple>
	<button onclick="sendFile();">파일전송</button>
	
	<script>
		function sendFile(){
			// 파일 전송시에는 FormData라는 객체를 생성해서 파일을 추가시켜줘야함
			let form = new FormData();
			
// 			console.log($("#upfile"), $("#upfile")[0].files[0]);
			
// 			// files사용시 반드시 $("#upfile")[0]와 같이 인덱스 명시해줘야 데이터에 접근할 수 있음
// 			// 가져오는 값이 배열이기 때문. upfile에는 모든 데이터가 담겨있음.
// 			form.append("upfile", $("#upfile")[0].files[0]);
			$.each( $("#upfile")[0].files , function(index, file){
				console.log(index, file);
				form.append("upfile"+index, file);
			} );
			
			
			$.ajax({
				url : "<%= contextPath%>/fileUpload.do",
				data : form,
				type : "post",
				
				// 전달값이 file일 경우에 두 속성 값을 false로 추가
				// 데이터를 파일 그자체로 전달해주기 위함
				processData : false,
				contentType : false,
				
				success : function(data){
					alert("업로드 성공");
					
					// 데이터 비워주기
					$("#upfile").val("");
				}
			});
		};
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	
</body>
</html>