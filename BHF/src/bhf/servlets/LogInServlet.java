package bhf.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bhf.controllers.ControllerDataBase;
import bhf.controllers.ControllerLogIn;
import bhf.objects.User;

/**
 * Servlet implementation class LogInServlet
 */
@WebServlet("/LogInServletPath")
public class LogInServlet extends HttpServlet {
	private ControllerDataBase spbd;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public LogInServlet() {
        super();
       
    }
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		ControllerLogIn sterownikLogowania = new ControllerLogIn();
		int wynik=sterownikLogowania.uwierzytelnij(login, password);
		RequestDispatcher dispatcher;
		String blad ="";
		System.out.println(wynik);
		if(wynik==1 || wynik==2) {
			blad="Please provide all information.";
			request.setAttribute("blad", blad);
			dispatcher =request.getRequestDispatcher("Main_Page/log_In.jsp"); 
			dispatcher.forward(request, response);
		}
		else if(wynik==-1) {
			blad="Login can only contain letters.";
			request.setAttribute("blad", blad);
			dispatcher =request.getRequestDispatcher("Main_Page/log_In.jsp"); 
			dispatcher.forward(request, response);
		}
		else if(wynik==3) {
			blad="Login or password are incorrect.";
			request.setAttribute("blad", blad);
			dispatcher =request.getRequestDispatcher("Main_Page/log_In.jsp"); 
			dispatcher.forward(request, response);
		}
		else if(wynik==4) {
			blad="Your account has been deleted.";
			request.setAttribute("blad", blad);
			dispatcher =request.getRequestDispatcher("Main_Page/log_In.jsp"); 
			dispatcher.forward(request, response);
		}
		//jest to zwykly uzytkownik
		else if(wynik==5) {
			User user=sterownikLogowania.getUzytkownik(login);
			request.getSession().setAttribute("user", user);
			response.sendRedirect("Logged_In_User/user.jsp");
		}
		//jest to administrator
		else if(wynik==6) {
			User user=sterownikLogowania.getUzytkownik(login);
			request.getSession().setAttribute("user", user);
			response.sendRedirect("Logged_In_Admin/admin.jsp");
		}
		
		return;
	}
}


