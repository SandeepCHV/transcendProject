package com.example.springproj.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.springproj.model.messagetemplate;
import com.example.springproj.repository.templaterepository;

@Service
@Transactional
public class templateserviceimplementation implements templateservice{
	
	@Autowired
	templaterepository temp;
	
	@Override
	public List<messagetemplate> getAllTemplates(){
		return (List<messagetemplate>)temp.findAll();
	}
	
	@Override
	public List<String> getAllSeriesNo(){
		return (List<String>)temp.findDistinctSeriesNo();
	}
	
	@Override
	public List<String> getMessageNo(int seriesNo){
		System.out.println("seriesNo: " + seriesNo);
		return (List<String>)temp.findMessageNumbers(seriesNo);
	}
	
	@Override
	public String getTemplate(int messageNo) {
		System.out.println("messageNo: "+messageNo);
		return (String)temp.findTemplate(messageNo);
	}
}

//<select class="form-control" name="example" id="example">
//	<option value="NONE">----Select----</option>
//<option th:each="seriesNo : ${templateList}" th:value="${seriesNo.seriesnumber}"
//	th:text="${seriesNo.seriesnumber}">
//</option>
//</select>

//<tbody>
//<tr th:each="temp: ${templateList}">
//	<td th:text="${temp.id}" />
//	<td th:text="${temp.seriesnumber}" />
//	<td th:text="${temp.messagenumber}" />
//	<td th:text="${temp.template}" />
//	<td th:text="${temp.templatename}" />
//</tr>
//</tbody>

//
//<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
//<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


//$(document).ready(function(){
//	$('#example').change(function(){
//		var seriesId = $(this).val();
//		alert(seriesId);
//	});
//});
