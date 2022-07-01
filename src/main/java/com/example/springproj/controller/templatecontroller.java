package com.example.springproj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.springproj.model.messagetemplate;
import com.example.springproj.services.templateservice;

@Controller
@RequestMapping(value="/template")
public class templatecontroller {
	
	@Autowired
	templateservice temp;
	
	@ResponseBody
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView list(){
		ModelAndView model = new ModelAndView("template_list");
	    //List<messagetemplate> templateList = temp.getAllTemplates();
	    List<String> templateList = temp.getAllSeriesNo();
	    model.addObject("templateList", templateList);
	    for(String x:templateList)
	    	System.out.println(x);
	    return model;
	}
	
	@ResponseBody
    @RequestMapping(value = "/getMessage", method = RequestMethod.POST)
    public List<String> getMessage(@RequestParam String seriesId) {
        List<String> messageList = temp.getMessageNo(Integer.parseInt(seriesId));
        return messageList;
    }
}

//<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
//pageEncoding="ISO-8859-1"%>
//<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
//<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>   
//
//<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
//<html>
//<head>
//<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
//<title>Template List</title>
//<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
//<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
//<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
//</head>
//<c:forEach items="${templateList}" var="template" >
//<tr>
// <td>${template.id}</td>
// <td>${template.seriesnumber}</td>
// <td>${template.messagenumber}</td>
// <td>${template.template}</td>
// <td>${template.templatename}</td>
//</tr>
//</c:forEach>