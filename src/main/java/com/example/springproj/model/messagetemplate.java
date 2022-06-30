package com.example.springproj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="springproj")
public class messagetemplate {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="seriesnumber")
	private int seriesnumber;
	
	@Column(name="messagenumber")
	private int messagenumber;
	
	@Column(name="template")
	private String template;
	
	@Column(name="templatename")
	private String templatename;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(int seriesnumber) {
		this.seriesnumber = seriesnumber;
	}

	public int getMessagenumber() {
		return messagenumber;
	}

	public void setMessagenumber(int messagenumber) {
		this.messagenumber = messagenumber;
	}

	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}

	public String getTemplatename() {
		return templatename;
	}

	public void setTemplatename(String templatename) {
		this.templatename = templatename;
	}
	
}
