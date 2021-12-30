package jspProject_final.service.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspProject_final.service.Action;
import jspProject_final.domain.user.User;
import jspProject_final.domain.user.UserDAO;

public class LoginAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		
		UserDAO userDAO = new UserDAO();
		User user = userDAO.login(userId, userPassword);
		if(user != null) {
			try {
				HttpSession session = request.getSession();
				session.setAttribute("userInfo", user);
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userName", user.getUserName());
				response.sendRedirect("views/user/userAlertForm.jsp?select=login&alert=loginSuccess");
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			try {
				response.sendRedirect("views/user/userAlertForm.jsp?select=login&alert=loginFail");
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
	}
}
