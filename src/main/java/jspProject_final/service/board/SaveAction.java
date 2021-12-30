package jspProject_final.service.board;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspProject_final.domain.board.Board;
import jspProject_final.domain.board.BoardDAO;
import jspProject_final.service.Action;

public class SaveAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String boardTitle = request.getParameter("boardTitle");
		String userId = (String)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		String boardContent = request.getParameter("boardContent");
		String listType = request.getParameter("listType");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String boardCreated = dateFormat.format(date);
		
		System.out.println("----------board----------");
		System.out.println("title : " + boardTitle);
		System.out.println("userId : " + userId);
		System.out.println("userName : " + userName);
		System.out.println("content : " + boardContent);
		System.out.println("listType : " + listType);
		System.out.println("-------------------------");
		
		Board board = new Board(null, userId, userName, boardTitle, boardContent, 0, boardCreated, listType);
		BoardDAO boardDAO = new BoardDAO();
		
		int result = boardDAO.save(board);
		
		if(result != 1) {
			response.sendRedirect("views/board/boardAlertForm.jsp?select=save&alert=saveFail");
		} else {
			response.sendRedirect("views/board/boardAlertForm.jsp?select=save&alert=saveSuccess");
		}
	}

}
