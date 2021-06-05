package com.ls.servlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.ls.common.User;
import com.ls.common.UserHandle;

import java.io.IOException;

public class LoginOut extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("name");
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }
}
