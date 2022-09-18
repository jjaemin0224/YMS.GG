package gg.yms.icia.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class SessionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandler call");
		if (request.getSession().getAttribute("id") == null) {
			System.out.println("비 로그인....");
			response.sendRedirect("mmLoginMv"); // home.jsp
			return false;
		}
		return true; // controller 진입가능
	}


}

/*
 * @Override public void postHandle(HttpServletRequest request,
 * HttpServletResponse response, Object handler, ModelAndView modelAndView)
 * throws Exception { // TODO Auto-generated method stub
 * System.out.println("postHandle call"); super.postHandle(request, response,
 * handler, modelAndView); }
 */
