package com.sjinvest.sos.common.web.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * 공통 예외 처리 클래스
 * @author 남수현
 */
@ControllerAdvice
public class ControllerExceptionAdvice {
     @ExceptionHandler(Exception.class)
     public ModelAndView commonExceptionHandle(Exception exception) {
          ModelAndView modelAndView = new ModelAndView();
          modelAndView.setViewName("error/error_500");
          modelAndView.addObject("exception", exception);
          return modelAndView;
     }
}
