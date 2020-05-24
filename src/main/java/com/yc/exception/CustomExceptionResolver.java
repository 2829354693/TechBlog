package com.yc.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomExceptionResolver implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
                                         Exception ex) {
		
		CustomException customException = null;
		
		if (ex instanceof CustomException) {
			customException = (CustomException)ex;
		} else {
			customException = new CustomException("未知错误！请与管理员联系，QQ：2829354693");
		}
		
		String message = customException.getMessage();
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("message", message);
		
		modelAndView.setViewName("error1");
		
		return modelAndView;
	}

}
