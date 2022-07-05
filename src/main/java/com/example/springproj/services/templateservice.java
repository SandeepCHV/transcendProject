package com.example.springproj.services;

import java.util.List;

import com.example.springproj.model.messagetemplate;

public interface templateservice {
	
	public List<messagetemplate> getAllTemplates();
	public List<String> getAllSeriesNo();
	public List<String> getMessageNo(int seriesNo);
	public String getTemplate(int messageNo);
}
