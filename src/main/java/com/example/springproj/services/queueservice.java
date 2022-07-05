package com.example.springproj.services;

import java.util.List;

public interface queueservice {
	
	public List<String> getEnvNames();
	
	public List<String> getQueueNames(String envname);
	
}
