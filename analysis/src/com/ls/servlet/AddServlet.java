package com.ls.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ls.common.User;
import com.ls.common.UserHandle;
import com.ls.common.Student;
import com.ls.common.Teacher;
import com.ls.common.StudentHandle;
import com.ls.common.TeacherHandle;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;

import java.io.IOException;

public class AddServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException
    {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {   User user = new User();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int tel = Integer.parseInt(request.getParameter("tel"));
        String category = request.getParameter("category");
        String pwd = request.getParameter("pwd");
        UserHandle userHandle = new UserHandle();
        user.setId(id);
        user.setPassword(pwd);
        user.setName(name);
        user.setCategory(category);
        user.setTel(tel);
        userHandle.addUser(user);
        if(category.equals("student"))
        {   Student student = new Student();
            student.setId(id);
            student.setName(name);
            student.setTel(tel);
            StudentHandle studentHandle = new StudentHandle();
            studentHandle.addStudent(student);
            response.sendRedirect("home_Student.jsp");}
        else
        {   Teacher teacher = new Teacher();
            teacher.setId(id);
            teacher.setName(name);
            teacher.setTel(tel);
            TeacherHandle teacherHandle = new TeacherHandle();
            teacherHandle.addTeacher(teacher);
            response.sendRedirect("home_Teacher.jsp");}
    }
}
