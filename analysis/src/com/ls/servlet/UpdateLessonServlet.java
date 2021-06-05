package com.ls.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ls.common.Lesson;
import com.ls.common.LessonHandle;
public class UpdateLessonServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        Lesson lesson = new Lesson();
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        int l_id = Integer.parseInt(request.getParameter("l_id"));
        String l_name= request.getParameter("l_name");
        String l_teacher_name = request.getParameter("l_teacher_name");
        lesson.setL_id(l_id);
        lesson.setL_name(l_name);
        lesson.setL_teacher_name(l_teacher_name);
        LessonHandle lessonHandle = new LessonHandle();
        lessonHandle.updateLesson(lesson);
        response.sendRedirect("backStage.jsp");
    }
}
