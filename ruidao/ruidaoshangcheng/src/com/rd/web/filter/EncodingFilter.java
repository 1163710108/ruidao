package com.rd.web.filter;

import java.io.IOException;
import javax.servlet.*;
public class EncodingFilter implements Filter {
	private String targetEncoding = "ISO-8859-1";
    //private String targetEncoding = "UTF-8";
	public void init(FilterConfig config) throws ServletException {
		this.targetEncoding = config.getInitParameter("encoding");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
		throws IOException, ServletException {
		request.setCharacterEncoding(targetEncoding);
		response.setCharacterEncoding(targetEncoding);
		chain.doFilter(request, response);  
		return;
	}
	public void destroy() {}
}

