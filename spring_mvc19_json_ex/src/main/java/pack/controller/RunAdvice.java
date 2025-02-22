package pack.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Component
@Aspect
public class RunAdvice {
	
	@Around("execution(public String buser())")
	public Object trace(ProceedingJoinPoint joinPoint) throws Throwable{
		
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		HttpSession session = request.getSession();
    	
		String sawon_name = (String)session.getAttribute("sawon_name");
    	
         if(sawon_name == null || sawon_name.equals("")){
            return "login";
         }else{
        	Object object = joinPoint.proceed();
      		return object;
         }
	  
	}
}
