package jspProject_final.service.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspProject_final.domain.user.UserDAO;
import jspProject_final.service.Action;

public class InfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String select = request.getParameter("select");
		if(select.equals("updatePassword")) {
			System.out.println("update");
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userId");
			String nowPassword = request.getParameter("nowPassword");
			String updatePassword = request.getParameter("updatePassword");
			String updatePasswordCheck = request.getParameter("updatePasswordCheck");
			
			UserDAO userDAO = new UserDAO();
			
			int result = userDAO.passwordCheck(userId, nowPassword);
			
			if(result != 1) {
				response.sendRedirect("views/user/userAlertForm.jsp?select=infoForm&alert=updatePasswordFail");
			} else if (updatePassword.equals(updatePasswordCheck) == false) {
				response.sendRedirect("views/user/userAlertForm.jsp?select=infoForm&alert=updatePasswordCheckFail");
			} else {
				result = userDAO.passwordUpdate(userId, updatePassword);
				if(result != 1) {
					response.sendRedirect("views/user/userAlertForm.jsp?select=infoForm&alert=updateFail");
				} else {
					response.sendRedirect("views/user/userAlertForm.jsp?select=infoForm&alert=updateSuccess");
				}
			}
		}
		
		if(select.equals("delete")) {
			System.out.println("delete");
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userId");
			String userPassword = request.getParameter("userPassword");
			
			UserDAO userDAO = new UserDAO();
			int result = userDAO.passwordCheck(userId, userPassword);
			if(result != 1) {
				response.sendRedirect("views/user/userAlertForm.jsp?select=infoForm&alert=deletePasswordFail");
			} else {
				result = userDAO.delete(userId);
				if(result != 1) {
					response.sendRedirect("views/user/userAlertForm.jsp?select=infoForm&alert=deleteFail");
				} else {
					session.invalidate();
					response.sendRedirect("views/user/userAlertForm.jsp?select=infoForm&alert=deleteSuccess");
				}
			}
		}
		
	}

}
