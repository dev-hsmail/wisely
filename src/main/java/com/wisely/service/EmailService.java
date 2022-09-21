package com.wisely.service;

import com.wisely.dto.EmailDTO;

public interface EmailService {

	void sendMail(EmailDTO dto, String message);
	
}
