package com.example.springproj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.springproj.model.SystemMessage;
//import com.example.springproj.model.messagetemplate;
import com.example.springproj.services.queueservice;
import com.example.springproj.services.templateservice;

@Controller
@RequestMapping(value="/template")
public class templatecontroller {
	
	String a = "";
	String b = "";
	
	@Autowired
	templateservice temp;
	
	@Autowired
	queueservice queue;
	
	@Autowired
	private JmsTemplate jmsTemplate;
	
	@ResponseBody
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView list(){
		ModelAndView model = new ModelAndView("template_list");
	    //List<messagetemplate> templateList = temp.getAllTemplates();
	    List<String> templateList = temp.getAllSeriesNo();
	    List<String> envList = queue.getEnvNames();
	    model.addObject("templateList", templateList);
	    model.addObject("envList", envList);
	    for(String x:templateList)
	    	System.out.println(x);
	    return model;
	}
	
	@ResponseBody
    @RequestMapping(value = "/getMessage", method = RequestMethod.POST)
    public List<String> getMessage(@RequestParam String seriesId) {
        List<String> messageList = temp.getMessageNo(Integer.parseInt(seriesId));
        for(String x:messageList)
        	System.out.println(x);
        return messageList;
    }
	
	@ResponseBody
    @RequestMapping(value = "/getTemplate", method = RequestMethod.POST)
    public String getTemplate(@RequestParam String messageId) {
        String template = temp.getTemplate(Integer.parseInt(messageId));
        return template;
    }
	
	@ResponseBody
    @RequestMapping(value = "/getQueue", method = RequestMethod.POST)
    public List<String> getQueue(@RequestParam String envname) {
        List<String> queues = queue.getQueueNames(envname);
        return queues;
    }
	
	@ResponseBody
	@RequestMapping(value="/getEnvQueue", method = RequestMethod.POST)
	public void changeQueue(@RequestParam String env, @RequestParam String queue)
	{
		a = "CONSUMER.QUEUE";
		b = "dynamicQueues/"+queue+"."+env;
		System.out.println(a+"\n"+b);
	}
	
	@ResponseBody
	@PostMapping("/publishMessage")
	public ResponseEntity<String> publishMessage(@RequestBody SystemMessage systemMessage){
		try {
			jmsTemplate.convertAndSend(b, systemMessage);
			return new ResponseEntity<>("Sent", HttpStatus.OK);
		}
		catch(Exception e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public ModelAndView add( @RequestParam String template){
		ModelAndView model = new ModelAndView("submit");
		model.addObject("message", template);
		return model;
	}

}
