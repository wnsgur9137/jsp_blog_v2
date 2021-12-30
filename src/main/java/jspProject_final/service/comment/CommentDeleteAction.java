package jspProject_final.service.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspProject_final.service.Action;
import jspProject_final.domain.comment.CommentDAO;

public class CommentDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer commentKey = Integer.parseInt(request.getParameter("commentKey"));
		CommentDAO commentDAO = new CommentDAO();
		System.out.println(commentKey);
		
		int result = commentDAO.commentDelete(commentKey);
		if(result != 1) {
			response.sendRedirect("views/board/boardAlertForm.jsp?select=commentDelete&alert=commentDeleteFail");
		} else {
			response.sendRedirect("views/board/boardAlertForm.jsp?select=commentDelete&alert=commentDeleteSuccess");
		}
	}

}
