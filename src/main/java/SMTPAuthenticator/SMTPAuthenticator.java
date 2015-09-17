package SMTPAuthenticator;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
	 public PasswordAuthentication getPasswordAuthentication() {
		   return new PasswordAuthentication("leespec88", "pbvsjhkvoxdjvbui"); // Google id, pwd, 주의) @gmail.com 은 제외하세요
		 } 
}
