package bhf.controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bhf.objects.Marker;
import bhf.objects.User;


public class ControllerDataBase {

	private Connection con = null;
	
	/* public ControllerDataBase() {
		 try {
			 Context envContext = new InitialContext();
			 DataSource ds = (DataSource)
					 envContext.lookup("java:/comp/env/jdbc/aso");
			 con = ds.getConnection();
		 } catch (NamingException e) {
		 e.printStackTrace();
		 } catch (SQLException e) {
		 e.printStackTrace();
		 }
	 }*/
	
	public ControllerDataBase() {
		
		Connection conn = null;
		try {
			Class.forName("org.sqlite.JDBC");
			//jdbc:mysql://localhost:3306/aso?characterEncoding=utf-8
			//String url = "jdbc:sqlite:C:/Users/lmajcher/bhf.db";
			String url = "jdbc:sqlite:C:/Users/Lukas/git1/BHF/BHF/bhf.db";
			//String url = "jdbc:sqlite://localhost:3306/bhf?characterEncoding=utf-8";
			con = DriverManager.getConnection(url);
			
			System.out.println("Connection to SQLite has been established.");
		} catch(SQLException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} /*finally {
			try {
				if(con != null) {
					con.close();
				}
			} catch(SQLException ex) {
				System.out.println(ex.getMessage());
			}
		}*/
	
	}


	public Connection getCon() {
		return con;
	}

	
	public boolean saveEdit(String login, String name, String lastname, String email, String phoneNumber,
			 String type) {
		boolean odp = true;
		PreparedStatement stmt = null;
		System.out.println(name + " " + lastname + " " + email  + " " + phoneNumber  + " " + login  + " " + type);
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"UPDATE `users` SET name= ?, lastname = ?, email = ?, phonenumber = ?, type = ? WHERE login = ?;");
			stmt.setString(1, name);
			stmt.setString(2, lastname);
			stmt.setString(3, email);
			stmt.setString(4, phoneNumber);
			stmt.setString(5, type);
			stmt.setString(6, login);
			stmt.executeUpdate();
		} catch (SQLException e) {
			odp = false;
			System.out.println("TU JEST BLAD");
			return false;
		} finally {
			close(stmt);
		}
		return odp;
	}
	
	public boolean save_Training_DB(String name, String distance,String login, String type) {
		PreparedStatement pstmt = null;
		int userid = getId(login);
		System.out.println(name + " " + distance+ " " +type+ " " + userid);
		try {
			// przygotowanie zapytania
			pstmt = con.prepareStatement(
					"INSERT INTO trainings(name, distance, type, userid) VALUES (?,?,?,?);");
			pstmt.setString(1, name);
			pstmt.setString(2, distance);
			pstmt.setString(3, type);
			pstmt.setInt(4, userid);
			// wykonanie zapytania
			pstmt.executeUpdate();
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			close(pstmt);
		}
		return true;
	}
	
	
	public int getId(String login) {

		ResultSet rs = null;
		int id;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT id FROM `users` WHERE login = ?;");
			stmt.setString(1, login);
			rs = stmt.executeQuery();
			rs.next();
			id = rs.getInt("id");

		} catch (SQLException e) {
			e.printStackTrace();
			return -1;

		} finally {
			close(rs);
			close(stmt);
		}
		return id;
	}
	
	
	public User pobierzUzytkownika(String login) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		User uzytkownik = new User();
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `users` WHERE login=? ");
			stmt.setString(1, login);

			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// haslem
			rs = stmt.executeQuery();
			rs.next();
			uzytkownik.setName(rs.getString("name"));
			uzytkownik.setLastName(rs.getString("lastname"));
			uzytkownik.setLogin(rs.getString("login"));
			uzytkownik.setPassword(rs.getString("password"));
			uzytkownik.setPhoneNumber(rs.getInt("phonenumber"));
			uzytkownik.setEmail(rs.getString("email"));
			uzytkownik.setType(rs.getString("type"));
		} catch (SQLException e) {
			System.out.println("blad");

		} finally {
			close(rs);
			close(stmt);
		}

		return uzytkownik;
	}
	
	/**
	 * 
	 * @param login
	 * @param haslo
	 * @param imie
	 * @param nazwisko
	 * @param email
	 * @param nrtel
	 * @param rodzaj
	 * @return
	 */
	public boolean zarejestruj(String login, String haslo, String imie, String nazwisko, String email,
			String numer_telefonu, String rodzaj) {
		PreparedStatement pstmt = null;
		try {
			// przygotowanie zapytania
			pstmt = con.prepareStatement(
					"INSERT INTO users(login, password, name, lastname, email, phonenumber, type) VALUES (?,?,?,?,?,?,?);");
			pstmt.setString(1, login);
			pstmt.setString(2, haslo);
			pstmt.setString(3, imie);
			pstmt.setString(4, nazwisko);
			pstmt.setString(5, email);
			pstmt.setString(6, numer_telefonu);
			pstmt.setString(7, rodzaj);
			// wykonanie zapytania
			pstmt.executeUpdate();
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			close(pstmt);
		}
		return true;
	}


	// zmiana danych uzytkownika
	public boolean edytujUstawienia(String imie, String nazwisko, String email, String numer_telefonu, String login) {

		boolean odp = true;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"UPDATE `uzytkownik` SET imie= ?,nazwisko=?, email=?, numer_telefonu=? WHERE login = ?");
			stmt.setString(1, imie);
			stmt.setString(2, nazwisko);
			stmt.setString(3, email);
			stmt.setString(4, numer_telefonu);
			stmt.setString(5, login);
			stmt.executeUpdate();

		} catch (SQLException e) {
			odp = false;
			System.out.println("TU JEST BLAD");
			return false;

		} finally {
			close(stmt);
		}
		return odp;
	}

	// zmiana danych uzytkownika, ADMIN
	public boolean zapiszEdycjeInformacji(String imie, String nazwisko, String email, String numer_telefonu,
			String login, String rodzaj_konta) {
		boolean odp = true;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"UPDATE uzytkownik SET imie= ?, nazwisko=?, email=?, numer_telefonu=?, rodzaj_konta=? WHERE login = ?");
			stmt.setString(1, imie);
			stmt.setString(2, nazwisko);
			stmt.setString(3, email);
			stmt.setString(4, numer_telefonu);
			stmt.setString(5, rodzaj_konta);
			stmt.setString(6, login);
			stmt.executeUpdate();
		} catch (SQLException e) {
			odp = false;
			return false;
		} finally {
			close(stmt);
		}
		return odp;
	}


	/**
	 * Metoda do logowania uzytkownika do aplikacji
	 * 
	 * @param login
	 * @param haslo
	 * @return 1 - jesli uzytkownik istnieje i haslo pasuje, -1 jesli brak
	 *         uzytkownika lub zle haslo
	 */
	public int zaloguj(String login, String password) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		int odp;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `users` WHERE login=? and password=?");
			stmt.setString(1, login);
			stmt.setString(2, password);

			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// haslem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");

			if (rs.getString("type").equals("user")) {
				odp = 5;
			} else {
				odp = 6;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("brak danych");
			odp = 3;
			return 3;
		} finally {
			close(rs);
			close(stmt);
		}
		return odp;
	}
	
	public Marker[] downloadAllMarkers() {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		ResultSet rs2 = null;
		PreparedStatement stmt2 = null;
		int amountOfMarkers;
		Marker marker[] = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT COUNT(*) FROM `markers`");
			rs = stmt.executeQuery();
			rs.next();
			amountOfMarkers = rs.getInt("COUNT(*)");
			marker = new Marker[amountOfMarkers];
			stmt2 = con.prepareStatement("SELECT * FROM `markers`");
			rs2 = stmt.executeQuery();
			System.out.println();
			for (int i = 0; i < amountOfMarkers; i++) {
				rs2.next();
				marker[i].setLocation(rs.getString("location"));
				marker[i].setName(rs.getString("name"));
			}

		} catch (SQLException e) {
			System.out.println("blad");

		} finally {
			close(rs);
			close(stmt);
			close(rs2);
			close(stmt2);
		}

		return marker;
	}


	
	public boolean czyIstniejeLogin(String nazwa) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `user` WHERE login=? ;");
			stmt.setString(1, nazwa);
			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// haslem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
			System.out.println("Istnieje");
		} catch (SQLException e) {
			odp = false;
			System.out.println("Nie istnieje");
			return false;

		} finally {
			close(rs);
			close(stmt);
		}
		System.out.println("Koniec");
		return odp;
	}

	public boolean czyIstniejeEmail(String nazwa) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE email=? ");
			stmt.setString(1, nazwa);
			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// haslem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {
			close(rs);
			close(stmt);
		}
		return odp;
	}

	public boolean czyIstniejeEmailEdycja(String email, String login) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE email=? and login=?");
			stmt.setString(1, email);
			stmt.setString(2, login);
			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// email
			rs = stmt.executeQuery();
			rs.next();

			System.out.println(rs.getString("login"));
		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {
			close(rs);
			close(stmt);
		}
		return odp;
	}

	public boolean czyIstniejeNrTelefonu(String nazwa) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE numer_telefonu=? ");
			stmt.setString(1, nazwa);
			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// numerem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {
			close(rs);
			close(stmt);
		}
		return odp;
	}

	public boolean czyIstniejeNrTelefonuEdycja(String numer_telefonu, String login) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE numer_telefonu=? and login=?");
			stmt.setString(1, numer_telefonu);
			stmt.setString(2, login);
			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// numerem i czy nalezy on do danego uzytkownika
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {
			close(rs);
			close(stmt);
		}
		return odp;
	}

	public boolean edytujHaslo(String login, String haslo) {
		boolean odp = true;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("UPDATE Uzytkownik SET haslo= ? WHERE login = ?");
			stmt.setString(1, haslo);
			stmt.setString(2, login);
			stmt.executeUpdate();

		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {

			close(stmt);
		}
		return odp;
	}

	public boolean aktualizujONas(String tresc) {
		boolean odp = true;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("UPDATE informacje SET tresc=? WHERE typ_informacji='o_nas'");
			stmt.setString(1, tresc);

			stmt.executeUpdate();

		} catch (SQLException e) {
			odp = false;
			e.printStackTrace();
			return false;

		} finally {

			close(stmt);
		}
		return odp;
	}

	public boolean usunUzytkownika(String login) {
		PreparedStatement stmt = null;
		boolean odp = true;
		String nieaktywny = "Nieaktywny";
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("UPDATE`uzytkownik` SET `rodzaj_konta` = ? WHERE `login` = ?");
			stmt.setString(1, nieaktywny);
			stmt.setString(2, login);
			stmt.executeUpdate();
		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {
			close(stmt);
		}
		return odp;
	}

	public int pobierzId() {

		ResultSet rs = null;
		int id;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT LAST_INSERT_ID() as id");
			rs = stmt.executeQuery();
			rs.next();
			id = rs.getInt("id");

		} catch (SQLException e) {
			e.printStackTrace();
			return -1;

		} finally {
			close(rs);
			close(stmt);
		}
		return id;
	}

	public ArrayList<User> pobierzUzytkownikowEmail() {
		ArrayList<User> uzytkownicy = new ArrayList<User>();
		ResultSet rs = null;
		User u;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select * from uzytkownik");
			rs = stmt.executeQuery();

			while (rs.next()) {
				u = new User();
				u.setEmail(rs.getString("email"));
				u.setType(rs.getString("rodzaj_konta"));
				uzytkownicy.add(u);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return uzytkownicy;
	}

	public static void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}