package com.ls.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ls.common.User;
import com.ls.common.UserHandle;
import com.ls.common.Student;
import com.ls.common.StudentHandle;
import com.ls.common.Teacher;
import com.ls.common.TeacherHandle;

public class UpdateServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
        User user = new User();
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int tel = Integer.parseInt(request.getParameter("tel"));
        String now_category = request.getParameter("category");
        String pwd = request.getParameter("pwd");
        user.setId(id);
        user.setName(name);
        user.setTel(tel);
        user.setCategory(now_category);
        user.setPassword(pwd);
        StudentHandle studentHandle = new StudentHandle();
        TeacherHandle teacherHandle = new TeacherHandle();
        UserHandle userHandle = new UserHandle();
        String last_category = userHandle.getUser(id).getCategory();
        userHandle.updateUser(user);
        if (now_category == last_category) {
            if (now_category.equals("student")) {
                Student student = new Student();
                student.setId(id);
                student.setName(name);
                student.setTel(tel);
                studentHandle.updateStudent(student);
            } else {
                Teacher teacher = new Teacher();
                teacher.setId(id);
                teacher.setName(name);
                teacher.setTel(tel);
                teacherHandle.updateTeacher(teacher);
            }

        }
        else
        {
            if (now_category.equals("student")) {
                Student student = new Student();
                student.setId(id);
                student.setName(name);
                student.setTel(tel);
                studentHandle.addStudent(student);
            } else {
                Teacher teacher = new Teacher();
                teacher.setId(id);
                teacher.setName(name);
                teacher.setTel(tel);
                teacherHandle.addTeacher(teacher);
            }
            if(last_category.equals("student"))
            {
                studentHandle.deleteStudent(id);
            }
            else
            {
                teacherHandle.deleteTeacher(id);
            }
        }
        response.sendRedirect("backStage.jsp");
    }
}
