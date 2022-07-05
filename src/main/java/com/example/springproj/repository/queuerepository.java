package com.example.springproj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.springproj.model.queuedetails;

public interface queuerepository extends CrudRepository<queuedetails, Integer>{
	
	@Query("SELECT DISTINCT a.envname FROM queuedetails a")
	List<String> findDistinctEnv();
	
	@Query("SELECT a.queuename FROM queuedetails a WHERE a.envname = :envname")
	List<String> findQueueNames(String envname);

}
