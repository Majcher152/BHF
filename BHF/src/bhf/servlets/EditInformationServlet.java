package bhf.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bhf.controllers.ControllerRegister;
import bhf.controllers.ControllerSaveEdit;
import bhf.controllers.ControllerSaveTraining;

/**
 * Servlet implementation class EditInformationServlet
 */
@WebServlet("/EditInformationServletPath")
public class EditInformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditInformationServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		String type = request.getParameter("type");
		if (type == null) {
			type = "user";
		}
		ControllerSaveEdit sr = new ControllerSaveEdit();
		String name = request.getParameter("name");
		String lastName = request.getParameter("lastName");
		String login = request.getParameter("login");
		String phoneNumber = request.getParameter("phoneNumber");
		String email = request.getParameter("email");
		int blad = sr.uwierzytelnij_edit(name, lastName, email, phoneNumber, login);
		String wyswietl = "";
		RequestDispatcher dispatcher;
		System.out.println(blad);
		switch (blad) {
		case 17:
			wyswietl = "Wrong e-mail.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 0:
			if (sr.saveEdit(login, name, lastName, email, phoneNumber, type))
				wyswietl = "Edition has been done successfully.";
			else
				wyswietl = "Error";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 18:
			wyswietl = "Provide a name.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 1:
			wyswietl = "The name can only contain letters.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;

		case 19:
			wyswietl = "Provide a last name.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 2:
			wyswietl = "The last name can only contain letters.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 3:
			wyswietl = "The phone number can only contain numbers.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 4:
			wyswietl = "Login can not contain symbols.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 5:
			wyswietl = "The name can contain only 30 letters.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Editw.jsp");
			dispatcher.forward(request, response);
			break;
		case 6:
			wyswietl = "The last name can contain only 30 letters.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 15:
			wyswietl = "This email is taken.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 11:
			wyswietl = "Phone number needs to contain 9 characters.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 16:
			wyswietl = "This phone number is taken.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 8:
			wyswietl = "Login needs to contain at least 3 characters.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 7:
			wyswietl = "Login can contain only 16 characters.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		case 14:
			wyswietl = "This login is taken.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("Logged_In_User/your_Profile_Edit.jsp");
			dispatcher.forward(request, response);
			break;
		}

	}

}
