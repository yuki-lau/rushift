package cn.edu.zju.ccnt.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

/**
 * 拦截所有请求，除登录页，只有登录后拥有用户Session的用户才可以继续访问页面
 * @author yuki
 *
 */
public class UserSessionFilter implements Filter {
	
	private String LOGIN_PAGE;
	private String LOGIN_ACTION;
	private String VALID_PREFIX;
	
	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest hReq = (HttpServletRequest)request;
		HttpServletResponse hResp = (HttpServletResponse)response;

		HttpSession session = hReq.getSession();
		String requestURI = hReq.getRequestURI();
		String contextPath = hReq.getContextPath() + "/";
		String processURI = requestURI.substring(contextPath.length()).toUpperCase();
		
//		System.out.println(requestURI);
//		System.out.println(contextPath);
//		System.out.println(processURI);
//		System.out.println();
		
		if(session == null || StringUtils.isEmpty((String)session.getAttribute("username"))){
			
			if(processURI.startsWith(LOGIN_PAGE) 
					|| processURI.startsWith(LOGIN_ACTION)
					|| processURI.startsWith(VALID_PREFIX)){
				chain.doFilter(request, response);
			}
			else{
				hResp.sendRedirect(contextPath + LOGIN_PAGE.toLowerCase());
			}
		}
		else {
			chain.doFilter(request, response);
		}

	}

	public void init(FilterConfig config) throws ServletException {

		this.LOGIN_PAGE = config.getInitParameter("LOGIN_PAGE").toUpperCase();
		this.LOGIN_ACTION = config.getInitParameter("LOGIN_ACTION").toUpperCase();
		this.VALID_PREFIX = config.getInitParameter("VALID_PREFIX").toUpperCase();
	}

}
