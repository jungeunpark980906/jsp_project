package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mysql.cj.log.Log;

import domain.MemberVO;
import service.MemberService;
import service.MemberServiceImpl;


@WebServlet("/mem/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	private RequestDispatcher rdp;
	private MemberService msv;
	private int isOk; //확인
	private String destPage; //목적지주소
	
	
  
    public MemberController() {
        msv = new MemberServiceImpl(); 
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html; charset=utf-8");
		
		String uri = request.getRequestURI(); //전체
		System.out.println(">>> uri  :" + uri);
		String path = uri.substring(uri.lastIndexOf("/")+1); //보낼주소만
		log.info(">>> path : " + path);
		
		
		switch(path) {
		//회원가입
		case "join":
			destPage = "/member/join.jsp";
			break;
		case "register":
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			int age = Integer.parseInt(request.getParameter("age")) ;
		
			MemberVO mvo = new MemberVO(id,password, email,age);
			
			isOk = msv.register(mvo);
			log.info(">>> JOIN : " + (isOk > 0 ? "성공!" : "실패"));
			destPage = "/"; 
			break;
		
		//로그인,로그아웃
		case "login":
			destPage = "/member/login.jsp";
			break;
		case "login_auth":
			try {
				String id2 = request.getParameter("id");
				String password2 = request.getParameter("password");
				MemberVO mvo2 = new MemberVO(id2,password2);

				MemberVO loginMvo = msv.login(mvo2);

				if(loginMvo != null) {
					HttpSession ses = request.getSession();
					ses.setAttribute("ses", loginMvo);
					ses.setMaxInactiveInterval(10*60);
				}else {
					request.setAttribute("msg_login", 0);
				}
				
			} catch (Exception e) {
				log.info("controller error!");
				e.printStackTrace();
			}
			destPage="/";
			break;
		case "logout":
			try {
				HttpSession ses = request.getSession();
				MemberVO mvo2 = (MemberVO)ses.getAttribute("ses");
				String id2 = mvo2.getId();
				log.info(">>>> login ID : "+id2);

				isOk = msv.lastLogin(id2); //마지막 로그인 시간 저장하기!
				log.info(">>> LogOut : " + (isOk > 0 ? "성공" : "실패"));
				ses.invalidate();
			} catch (Exception e) {
				log.info("controller error!");
				e.printStackTrace();
			}
			destPage="/";
			break;
		
		//전체 회원출력
		case "list":
			List<MemberVO> list = new ArrayList<MemberVO>();
			list = msv.list();
			
			request.setAttribute("mvo", list);
			destPage = "/member/list.jsp";
			break;
		
		//정보 수정
		case "modify_rdy":
			try {
				HttpSession ses = request.getSession();
				MemberVO mvo2 = (MemberVO)ses.getAttribute("ses");
				
			} catch (Exception e) {
				log.info("controller error!");
				e.printStackTrace();
			}
			
			destPage="/member/modify.jsp";
			break;
		case "modify":
			try {
				String id2 = request.getParameter("id");
				String password2 = request.getParameter("password");
				String email2 = request.getParameter("email");
				int age2 = Integer.parseInt(request.getParameter("age"));
				
				MemberVO mvo2 = new MemberVO(id2, password2,email2,age2);
				
				isOk = msv.edit(mvo2);
				log.info(">>> 정보수정 : " + (isOk > 0 ? "성공" : "실패"));
				
			} catch (Exception e) {
				log.info("controller error!");
				e.printStackTrace();
			}
			destPage="/";
			break;
			
		//회원 탈퇴(삭제)
		case "delete":
			try {
				HttpSession ses = request.getSession();	
				MemberVO mvo2 = (MemberVO)ses.getAttribute("ses");
				String id2 = mvo2.getId(); 
				
				isOk = msv.delete(id2); 
				ses.invalidate(); 
				log.info(">>> 회원탈퇴 : " + (isOk > 0 ? "성공" : "실패"));
				
			} catch (Exception e) {
				log.info("controller error!");
				e.printStackTrace();
			}
			
			destPage="/";
			break;
		}
		
		
		rdp = request.getRequestDispatcher(destPage);
		rdp.forward(request, response);
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
