package bhf.controllers;

import java.util.ArrayList;

import org.apache.commons.codec.digest.DigestUtils;

import bhf.controllers.ControllerDataBase;
import bhf.objects.User;

public class ControllerLogIn {
	private ControllerDataBase spbd = new ControllerDataBase();

	public int uwierzytelnij(String login, String haslo) {
		User uzytkownik = spbd.pobierzUzytkownika(login);
		String znak = "`~!@#$%^&*()_-+=<,.>?;:'{}][|/";

		System.out.println(uzytkownik.toString());
		System.out.println(uzytkownik.getType());
		if (login == null || login.equals("")) {
			return 1;
		}
		if (haslo == null || haslo.equals("")) {
			return 2;
		}
		try{
			if (uzytkownik.getType().equals("Nieaktywny")) {
				System.out.println("WRTF");
				return 4;
			}
		}
		catch(NullPointerException e){
			
		}

		for (int i = 0; i < znak.length(); i++) {
			for (char c : login.toCharArray())
				if (c == znak.charAt(i))
					return -1;
		}

		haslo = DigestUtils.sha1Hex(haslo);
		System.out.println();
		int odp = spbd.zaloguj(login, haslo);
		System.out.println(odp);
		return odp;
	}

	public User getUzytkownik(String login) {
		User uzytkownik = spbd.pobierzUzytkownika(login);
		return uzytkownik;
	}
}
