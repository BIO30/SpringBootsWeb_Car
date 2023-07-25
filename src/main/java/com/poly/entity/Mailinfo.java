package com.poly.entity;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mailinfo {
	@NotBlank
	private String from;
	@NotBlank
	private String to;
	private String[] cc;
	private String[] bcc;
	@NotBlank
	private String subject;
	@NotBlank
	private String body;
	private String[] attachments;
	
	public Mailinfo(String to, String subject, String body) {
		this.from = "FPT Polytechnic <hothuan20112003@gmail.com>";
		this.to = to;
		this.subject = subject;
		this.body = body;
	}
}