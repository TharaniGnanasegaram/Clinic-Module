package com.clinic.ClinicModuleException;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "No resource found fot the provided Id")
public class ResourceNotFoundException extends Exception {

	private static final long serialVersionUID = 1L;

}
