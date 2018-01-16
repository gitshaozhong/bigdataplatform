/**
 *  Copyright (c) 2012-2015 dhc
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.dhc.common.web.filter.gzip;

import com.dhc.common.web.utils.WebUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * GZIP拦截器.
 * 
 *  
 *   
 * 
 */
public class GZIPFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		if (req instanceof HttpServletRequest) {
			HttpServletRequest request = (HttpServletRequest) req;
			HttpServletResponse response = (HttpServletResponse) res;
			WebUtils.checkAccetptGzip(request);
			if (WebUtils.checkAccetptGzip(request)) {
				GZIPResponseWrapper wrappedResponse = new GZIPResponseWrapper(
						response);
				chain.doFilter(req, wrappedResponse);
				wrappedResponse.finishResponse();
				return;
			}
			chain.doFilter(req, res);
		}
	}

	public void init(FilterConfig filterConfig) {
		// noop
	}

	public void destroy() {
		// noop
	}
}
