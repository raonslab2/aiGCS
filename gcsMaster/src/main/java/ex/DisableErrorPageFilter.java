package ex;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DisableErrorPageFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 필터 초기화 코드 (필요시)
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        try {
            chain.doFilter(request, response);
        } catch (Exception e) {
            // 특정 경로에 대한 예외 처리
            if (httpRequest.getRequestURI().startsWith("/Cesium-1.118")) {
                httpResponse.sendError(HttpServletResponse.SC_NOT_FOUND);
            } else {
                throw e;
            }
        }
    }

    @Override
    public void destroy() {
        // 필터 종료 코드 (필요시)
    }
}
