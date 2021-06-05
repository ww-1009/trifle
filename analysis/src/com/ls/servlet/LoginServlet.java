package com.ls.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpCookie;
import java.net.URLDecoder;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.ls.common.User;
import com.ls.common.UserHandle;

public class LoginServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String code = request.getParameter("code");
		User user = new User();
		user.setName(name);
	    user.setPassword(pwd);
		UserHandle userHandle = new UserHandle();

		if (userHandle.login(user)) {
			HttpSession session = request.getSession();
			String sessionCode = (String) session.getAttribute("safecode");
			if (!(sessionCode.equals(code))) {
				request.setAttribute("Msg", "对不起,您的验证码不正确,请重新输入");
				request.getRequestDispatcher("login.jsp").forward(request,
						response);
			} else {
				session.setAttribute("name", user.getName());
				session.setAttribute("pwd", user.getPassword());
				User login_user = userHandle.getUserByName(name, pwd);
				if (login_user.getCategory().equals("student"))
					request.getRequestDispatcher("home_Student.jsp").forward(request,
						response);
				else {
					request.getRequestDispatcher("home_Teacher.jsp").forward(request,response);
				}
			}
		} else {
			System.out.println("调用");
			request.setAttribute("Msg", "对不起,您的账号密码不正确请重新输入");
			request.getRequestDispatcher("login.jsp")
					.forward(request, response);
		}
	}

}