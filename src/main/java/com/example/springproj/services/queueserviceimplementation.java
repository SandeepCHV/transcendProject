package com.example.springproj.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.springproj.repository.queuerepository;

@Service
@Transactional
public class queueserviceimplementation implements queueservice{
	
	@Autowired
	queuerepository queue;
	
	@Override
	public List<String> getEnvNames(){
		return (List<String>)queue.findDistinctEnv();
	}
	
	@Override
	public List<String> getQueueNames(String envname){
		return (List<String>)queue.findQueueNames(envname);
	}
}
