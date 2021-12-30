package jspProject_final.service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspProject_final.service.Action;

public class UpdateForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String boardKey = request.getParameter("boardKey");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		response.sendRedirect("views/board/updateForm.jsp?boardKey="+boardKey
				+"&boardTitle="+boardTitle
				+"&boardContent="+boardContent);
		
	}

}
