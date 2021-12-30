package jspProject_final.service.user;

import java.util.Arrays;
import java.util.List;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspProject_final.domain.user.User;
import jspProject_final.domain.user.UserDAO;
import jspProject_final.service.Action;
import jspProject_final.service.NullCheckHandler;

public class JoinAction  implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
//		List<String> userList = Arrays.asList("userName", "userId", "userPassword", "uesrEmail", "userCreated");
		
		// 데이터 변수
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		String userPasswordCheck = request.getParameter("userPasswordCheck");
		String userEmail = request.getParameter("userEmail");
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String userCreated = dateFormat.format(date);
		
		User user = new User(userName, userId, userPassword, userEmail, userCreated);
		UserDAO userDAO = new UserDAO();
		
		int idCheck = userDAO.idCheck(userId);
		if(idCheck != 1) {
			try {
				System.out.println("아이디 중복");
				response.sendRedirect("views/user/userAlertForm.jsp?select=join&alert=idCheck");
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			if(userPassword.equals(userPasswordCheck) == false) {
				try {
					System.out.println("비밀번호 불일치");
					response.sendRedirect("views/user/userAlertForm.jsp?select=join&alert=passwordCheck");				
				} catch(Exception e) {
					System.out.println(e.getMessage());
				}
			} else {
				int result = userDAO.join(user);
				if (result != 1 ) {
					try {
						System.out.println("회원가입 실패");
						response.sendRedirect("views/user/userAlertForm.jsp?select=join&alert=joinFail");
					} catch(IOException e) {
						System.out.println(e.getMessage());
					}
				} else {
					try {
						System.out.println("회원가입 성공");
						response.sendRedirect("views/user/userAlertForm.jsp?select=join&alert=joinSuccess");
					} catch(IOException e) {
						System.out.println(e.getMessage());
					}
				}
			}
		}
	}
}
