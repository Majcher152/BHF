package bhf.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bhf.controllers.ControllerLogIn;
import bhf.controllers.ControllerSaveTraining;
import bhf.objects.User;

/**
 * Servlet implementation class SaveTrainingServlet
 */
@WebServlet("/SaveTrainingServletPath")
public class SaveTrainingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveTrainingServlet() {
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

		String final_name = request.getParameter("final_name");
		String final_distance = request.getParameter("final_distance");
		String tmp = final_distance.substring(0, (final_distance.length() -2));
		float distance = Float.parseFloat(tmp);
		String login = request.getParameter("login");
		String type_training;
		
		if (distance < 4)
			type_training = "Easy training";
		else if (distance < 7)
			type_training = "Intermediate training";
		else 
			type_training = "Advanced training";
		
		
		ControllerSaveTraining controller = new ControllerSaveTraining();
		controller.save_Training(final_name, final_distance, login, type_training);
		
		response.sendRedirect("Logged_In_User/routes.jsp");
		return;
	}

}
