package com.bit.mymarket.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.servlet.ModelAndView;

@Aspect
public class LoginCheck {

	//@Pointcut("execution(* com.bit.mymarket.controller.ItemsController.index(..))")
	public void indexFormLogin() {
	}
	 
	//@Around("indexFormLogin()")
	@Around("execution(* com.bit.mymarket.controller.ItemsController.index(..))")
	public ModelAndView indexFormAspect(ProceedingJoinPoint joinPoint) throws Throwable {
	    
		HttpServletRequest req = null;
	    ModelAndView mav = new ModelAndView();
		
	    Object[] ob = joinPoint.getArgs();
	    if (ob[0] instanceof HttpServletRequest) {
	        req = (HttpServletRequest) ob[0];
	    }
	    System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	    HttpSession session = req.getSession();
	    System.out.println(session.getAttribute("authUser"));
	    if (session.getAttribute("authUser") == null) {
	    	mav.setViewName("user/loginform");
	    } else {
	        mav = (ModelAndView)joinPoint.proceed();
	    }
	    
	    return mav;
	}
	
}
