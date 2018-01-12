package bhf.objects;

public class Marker {
	
	private String location;
	private String name;
	private String distance_with_km;
	private String duration_with_minutes;
	private int ditance;
	
	public String getDistance_with_km() {
		return distance_with_km;
	}
	public void setDistance_with_km(String distance_with_km) {
		this.distance_with_km = distance_with_km;
	}
	public String getDuration_with_minutes() {
		return duration_with_minutes;
	}
	public void setDuration_with_minutes(String duration_with_minutes) {
		this.duration_with_minutes = duration_with_minutes;
	}
	public int getDitance() {
		return ditance;
	}
	public void setDitance(int ditance) {
		this.ditance = ditance;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
