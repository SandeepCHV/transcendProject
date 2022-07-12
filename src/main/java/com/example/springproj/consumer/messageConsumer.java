package com.example.springproj.consumer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

import com.example.springproj.model.SystemMessage;

@Component
public class messageConsumer {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(messageConsumer.class);
	
	@JmsListener(destination="CONSUMER.QUEUE")
	public void messageListener(SystemMessage systemMessage) {
		LOGGER.info("Message received. {}",systemMessage);
	}
}
