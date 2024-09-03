package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.demo.interceptor.BeforeActionInterceptor;
import com.example.demo.interceptor.NeedLoginInterceptor;
import com.example.demo.interceptor.NeedLogoutInterceptor;

@Configuration
public class MyWebMVCConfigurer implements WebMvcConfigurer {

	@Autowired
	BeforeActionInterceptor beforeActionInterceptor;

	@Autowired
	NeedLoginInterceptor needLoginInterceptor;

	@Autowired
	NeedLogoutInterceptor needLogoutInterceptor;


		public void addInterceptors(InterceptorRegistry registry) {

			InterceptorRegistration ir;

			ir = registry.addInterceptor(beforeActionInterceptor);
			ir.addPathPatterns("/**");
			ir.addPathPatterns("/favicon.ico");
			ir.excludePathPatterns("/resource/**");
			ir.excludePathPatterns("/error");

			ir = registry.addInterceptor(needLoginInterceptor);
			ir.addPathPatterns("/usr/member/doLogout");
			
			ir.addPathPatterns("/usr/member/myPage");
			ir.addPathPatterns("/usr/member/checkPw");
			ir.addPathPatterns("/usr/member/doCheckPw");
			ir.addPathPatterns("/usr/map/front");

			ir = registry.addInterceptor(needLogoutInterceptor);
			ir.addPathPatterns("/usr/member/login");
			ir.addPathPatterns("/usr/member/doLogin");
			ir.addPathPatterns("/usr/member/join");
			ir.addPathPatterns("/usr/member/doJoin");

	}

}