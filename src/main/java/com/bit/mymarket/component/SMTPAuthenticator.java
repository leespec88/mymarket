package com.bit.mymarket.component;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
	public PasswordAuthentication getPasswordAuthentication() {
		   return new PasswordAuthentication("leespec88", "pbvsjhkvoxdjvbui"); // Google id, pwd, ����) @gmail.com �� �����ϼ���
		 } 
}
