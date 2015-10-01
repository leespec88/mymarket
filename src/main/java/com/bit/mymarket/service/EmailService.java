package com.bit.mymarket.service;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.bit.mymarket.component.SMTPAuthenticator;

@Service
public class EmailService {
	
	public void sendEmail(String receiver){
		
		Properties p = new Properties();
		 
		p.put("mail.smtp.user", "leespec88@gmail.com"); // Google����@gmail.com���� ����
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable","true");
		p.put( "mail.smtp.auth", "true");
	 
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465"); 
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try {
			   Authenticator auth = new SMTPAuthenticator();
			   
			   Session session = Session.getInstance(p, auth);
			   
			   session.setDebug(true); // ������ ������ �� ���� ��Ȳ�� �ֿܼ� ����Ѵ�.
			 
			   MimeMessage msg = new MimeMessage(session);
			   
			   String message = "MyMarket �� ������ �ּż� �����մϴ�.";
			   
			   msg.setSubject("MyMarket ���� ���� Email �߼�");
			   
			   Address fromAddr = new InternetAddress("leespec88@gmail.com"); // ������ ����� �����ּ�
			   
			   msg.setFrom(fromAddr);
			   
			   //Address toAddr = new InternetAddress("smjjal8828@naver.com");  // �޴� ����� �����ּ�
			   Address toAddr = new InternetAddress(receiver);  // �޴� ����� �����ּ�
			   
			   msg.addRecipient(Message.RecipientType.TO, toAddr); 
			   
			   msg.setContent(message, "text/plain;charset=KSC5601");
			   
			   System.out.println("Message: " + msg.getContent());
			   
			   Transport.send(msg);
			   
			   System.out.println("Gmail SMTP������ �̿��� ���Ϻ����� ����");
			  }
			  catch (Exception mex) { // Prints all nested (chained) exceptions as well 
			   
				  System.out.println("I am here??? ");
			   
				  mex.printStackTrace(); 
			 
			  } 
			
	}
}
