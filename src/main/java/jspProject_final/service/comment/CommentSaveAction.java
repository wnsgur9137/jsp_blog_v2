package jspProject_final.service.comment;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspProject_final.service.Action;
import jspProject_final.domain.comment.Comment;
import jspProject_final.domain.comment.CommentDAO;

public class CommentSaveAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer commentBoardKey = Integer.parseInt(request.getParameter("boardKey"));
		String commentUserId = (String)session.getAttribute("userId");
		String commentUserName = (String)session.getAttribute("userName");
		String commentContent = request.getParameter("commentContent");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String commentCreated = dateFormat.format(date);
		
		System.out.println("-----------------------------");
		System.out.println(commentBoardKey);
		System.out.println(commentUserId);
		System.out.println(commentUserName);
		System.out.println(commentContent);
		System.out.println(commentCreated);
		System.out.println("-----------------------------");
		
		Comment comment = new Comment(null, commentBoardKey, commentUserId, commentUserName, commentContent, commentCreated);
		CommentDAO commentDAO = new CommentDAO();
		
		int result = commentDAO.save(comment);
		
		if(result != 1) {
			response.sendRedirect("views/board/boardAlertForm.jsp?select=commentSave&alert=commentSaveFail");
		} else {
			response.sendRedirect("views/board/boardAlertForm.jsp?select=commentSave&alert=commentSaveSuccess");
		}
	}

}
