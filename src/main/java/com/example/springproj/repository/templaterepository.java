package com.example.springproj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
//import org.springframework.data.repository.query.Param;

import com.example.springproj.model.messagetemplate;

public interface templaterepository extends CrudRepository<messagetemplate, Integer>{
	@Query("SELECT DISTINCT a.seriesnumber FROM messagetemplate a")
    List<String> findDistinctSeriesNo();
	
	@Query("SELECT a.messagenumber FROM messagetemplate a WHERE a.seriesnumber = :seriesNo")
	List<String> findMessageNumbers(int seriesNo);
	
	@Query("SELECT a.template FROM messagetemplate a WHERE a.messagenumber = :messageNo")
	String findTemplate(int messageNo);
}
