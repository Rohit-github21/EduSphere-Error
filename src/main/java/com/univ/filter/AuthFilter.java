package com.univ.filter;


import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class AuthFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req =(HttpServletRequest) request;
		HttpServletResponse res =(HttpServletResponse) response;
		
		String uri = req.getRequestURI();
		HttpSession session = req.getSession(false);
		
		boolean isLoggedIn = (session != null && session.getAttribute("loggedInStudent") != null);
		
		   if (
		            uri.endsWith("/home") ||
		            uri.endsWith("/services") ||
		            uri.endsWith("/contact") ||
		            uri.endsWith("/login") ||
		            uri.endsWith("/admin-dashboard")  ||
		            uri.endsWith("/register") ||
		            uri.contains("/resources/")
		           
		        ) {
		            chain.doFilter(request, response);
		            return;
		        }
		
		   if (isLoggedIn) {
	            chain.doFilter(request, response);
	        }else {
	            res.sendRedirect(req.getContextPath() + "/login");
	        }
	}

}
