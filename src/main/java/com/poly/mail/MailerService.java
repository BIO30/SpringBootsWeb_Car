package com.poly.mail;

import com.poly.entity.Mailinfo;

import jakarta.mail.MessagingException;

public interface MailerService {
	
	void send(Mailinfo mail) throws MessagingException;
	void send(String to, String subject, String body) throws MessagingException;
	void queue(Mailinfo mail);
	void queue(String to, String subject, String body);
}
