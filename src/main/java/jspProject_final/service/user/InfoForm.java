package jspProject_final.service.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspProject_final.service.Action;

public class InfoForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userPassword = request.getParameter("userPassword");
		response.sendRedirect("views/user/infoForm.jsp?userPassword=" + userPassword);
	}
	
	 
}
