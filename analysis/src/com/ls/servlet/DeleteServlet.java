package com.ls.servlet;
import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ls.common.UserHandle;
import com.ls.common.TeacherHandle;
import com.ls.common.StudentHandle;
import com.ls.common.User;
public class DeleteServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id  = Integer.parseInt(request.getParameter("id"));
        TeacherHandle teacherHandle = new TeacherHandle();
        UserHandle userHandle = new UserHandle();
        StudentHandle studentHandle = new StudentHandle();
        User user = new User();
        user = userHandle.getUser(id);
        userHandle.deleteUser(id);
        if(user.getCategory().equals("student"))
            studentHandle.deleteStudent(id);
        else
            teacherHandle.deleteTeacher(id);
        response.sendRedirect("backStage.jsp");

    }

}
