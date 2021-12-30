package jspProject_final.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspProject_final.service.Action;
import jspProject_final.service.user.JoinAction;
import jspProject_final.service.user.JoinForm;
import jspProject_final.service.user.LoginAction;
import jspProject_final.service.user.LoginForm;
import jspProject_final.service.user.LogoutAction;
import jspProject_final.service.user.PasswordCheckAction;
import jspProject_final.service.user.InfoForm;
import jspProject_final.service.user.InfoAction;
import jspProject_final.service.root.*;

// http://localhost:8000/jspProject_final/userController
@WebServlet("/userController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. null과 공백 접근 금지(유효성검사)
		if (request.getParameter("cmd") == null || request.getParameter("cmd").equals("")) {
			return;
		}
		
		String cmd = request.getParameter("cmd");
		System.out.println(cmd);
		
		Action action = router(cmd);
		if (action != null) {
			action.execute(request, response);
		}
	}
	int result = -1;
	private Action router(String cmd) {	
		if (cmd.equals("joinForm")) {			// 회원가입 페이지
			return new JoinForm();
		} else if (cmd.equals("join")) {		// 회원가입
			return new JoinAction();
		} else if (cmd.equals("loginForm")) {	// 로그인 페이지
			return new LoginForm();
		} else if (cmd.equals("login")) {		// 로그인
			return new LoginAction();
		} else if (cmd.equals("passwordCheckForm")) {// 비밀번호 체크 (업데이트 위함)
			return new PasswordCheckAction();
		} else if (cmd.equals("infoForm")) {	// 업데이트 페이지
			return new InfoForm();
		} else if (cmd.equals("infoAction")) {		// 업데이트
			return new InfoAction();
		} else if (cmd.equals("logout")) {		// 로그아웃
			return new LogoutAction();
			
			// 루트 관리 Action은 컨트롤러 미사용
		} else if (cmd.equals("rootUserInfoForm")) { // 루트계정 - 유저 관리 페이지
			return new rootUserInfoForm();
		} else if (cmd.equals("rootBoardInfoForm")) { // 루트계정 - 게시판 관리 페이지
			return new rootBoardInfoForm();
		} else if (cmd.equals("rootCommentInfoForm")) { // 루트계정 - 댓글 관리 페이지
			return new rootCommentInfoForm();
		}
		return null;
	}
	
}
