package com.ls.servlet;
import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ls.common.Lesson;
import com.ls.common.LessonHandle;
public class DeleteLessonServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int l_id  = Integer.parseInt(request.getParameter("l_id"));
        Lesson lesson;
        LessonHandle lessonHandle = new LessonHandle();
        lesson = lessonHandle.getLesson(l_id);
        lessonHandle.deleteLesson(l_id);
        response.sendRedirect("backStage.jsp");

    }
}
