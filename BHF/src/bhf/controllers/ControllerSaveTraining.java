package bhf.controllers;

public class ControllerSaveTraining {
	private ControllerDataBase spbd = new ControllerDataBase();
	
	public boolean save_Training(String name, String distance, String login, String type) {
		boolean odp = spbd.save_Training_DB(name, distance, login, type);
		return odp;
	}
}
