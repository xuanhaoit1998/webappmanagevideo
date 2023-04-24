package filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;

@WebFilter(filterName = "filter2" ,urlPatterns = { "/likeIndex", "/likeWatch", "/shareIndex","/likeWatch" ,"/likeList","/editAccount","/shareWatch" })
public class AuthFilter implements HttpFilter {
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

		String uri = req.getRequestURI();
		User user = (User) req.getSession().getAttribute("user");
		String error = "";
		if (user == null) { // chưa đăng nhập
			error = resp.encodeURL("Vui lòng đăng nhập!");
		} else if (!user.getAdmin() && uri.contains("/edit")) {// không phải admin
			req.setAttribute("message", "Bạn không phải là admin!");
			req.getRequestDispatcher("/views/dangNhap.jsp").forward(req, resp);
		}
		if (!error.isEmpty()) { // truy cập không hợp lệ
			req.getSession().setAttribute("securi", uri);
			req.setAttribute("message", "Bạn chưa đăng nhập!");
			req.setAttribute("check", "userNull");
			req.getRequestDispatcher("/views/dangNhap.jsp").forward(req, resp);
		} else { // truy cập hợp lệ
			chain.doFilter(req, resp);
			
			
		}

	}
}
