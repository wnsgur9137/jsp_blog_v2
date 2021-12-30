package jspProject_final.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspProject_final.service.Action;
import jspProject_final.service.board.ContentAction;
import jspProject_final.service.board.ListAction;
import jspProject_final.service.board.SaveAction;
import jspProject_final.service.board.SaveForm;
import jspProject_final.service.board.Delete;
import jspProject_final.service.board.UpdateAction;
import jspProject_final.service.board.UpdateForm;
import jspProject_final.service.board.SearchForm;
import jspProject_final.service.comment.CommentSaveAction;
import jspProject_final.service.comment.CommentDeleteAction;

// http://localhost:8000/jspProject_final/boardController
@WebServlet("/boardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response); //doProcess로 보내버림
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response); //doProcess로 보내버림
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. null과 공백 접근 금지(유효성 검사)
		if (request.getParameter("cmd") == null || request.getParameter("cmd").equals("")) {
			return;
		}
		
		String cmd = request.getParameter("cmd");
		Action action = router(cmd);
		if (action != null) {
			action.execute(request,  response);
		}
	}
	
	private static Action router(String cmd) {
		// http://localhost:8080/blog/board?cmd=list
		if (cmd.equals("list")) {				// 게시글 전체 보기 
			return new ListAction();
		} else if (cmd.equals("content")) {		// 게시글 상세보기 페이지 
			return new ContentAction();
		} else if (cmd.equals("delete")) {		// 게시글 삭제 
			return new Delete();
		} else if (cmd.equals("updateForm")) {	// 게시글 수정 페이지 
			return new UpdateForm();
		} else if (cmd.equals("update")) {		// 게시글 수정 
			return new UpdateAction();
		} else if (cmd.equals("saveForm")) {	// 게시글 작성 페이지 
			return new SaveForm();
		} else if (cmd.equals("save")) {		// 게시글 작성
			return new SaveAction();
		} else if (cmd.equals("search")) {		// 게시글 검색
			return new SearchForm();
		} else if (cmd.equals("saveComment")) { // 댓글 작성
			return new CommentSaveAction();
		} else if (cmd.equals("deleteComment")) { // 댓글 삭제
			return new CommentDeleteAction();
		}
		return null;
	}
}
