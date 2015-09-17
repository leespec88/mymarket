package com.bit.mymarket;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolverComposite;
import org.springframework.web.method.support.ModelAndViewContainer;

/**
 * HandlerMethodArgumentResolver 는 사용자 요청이 Controller에 도달하기 전에 그 요청의 파라미터들을 수정할
 * 수 있도록 해준다. 
 * 주의 : HandlerMethodArgumentResolver는 컨트롤러의 파라미터가 java.util.Map이면 동작하지 않음.
 * 
 * @author "krogoth112"
 *
 */
public class CustomMapArgumentResolver extends
		HandlerMethodArgumentResolverComposite {
	/* parameter 형식이 CommandMap클래스인지 확인하는 메소드 */
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		// TODO Auto-generated method stub
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}

	/* resolverArgument 메서드는 파라미터와 기타 정보를 받아서 실제 객체를 반환한다. */
	@Override
	public Object resolveArgument(MethodParameter parameter,
			ModelAndViewContainer mavContainer, NativeWebRequest webRequest,
			WebDataBinderFactory binderFactory) throws Exception {
		CommandMap commandMap = new CommandMap(); // request에 담겨있는 파라미터를 Map에
													// 담아주는 역할을 하는 클래스

		HttpServletRequest request = (HttpServletRequest) webRequest
				.getNativeRequest();
		Enumeration<?> enumeration = request.getParameterNames();

		String key = null;
		String[] values = null;
		while (enumeration.hasMoreElements()) {
			key = (String) enumeration.nextElement();
			values = request.getParameterValues(key);
			if (values != null) {
				commandMap.put(key, (values.length > 1) ? values : values[0]);//request에 담겨있는 모든 키(key)와 값(value)을 commandMap에 저장
			}
		}
		return commandMap;
	}

}
