package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FavoriteDAO;
import dao.UserDAO;
import entity.User;
import entity.Video;
import utils.CookieUtils;
import utils.sendEmail;

@WebServlet({ "/login", "/register","/editAccount", "/editPassword", "/editAvatar","/forgotPassword","/logout" })
public class acount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FavoriteDAO fdao = new FavoriteDAO();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("login")) {
			this.doSignIn(req, resp);
		} else if (uri.contains("register")) {
			this.doSignUp(req, resp);
		}
		else if (uri.contains("editAccount")) {
			this.doEditAccount(req, resp);
		}
		else if (uri.contains("editAvatar")) {
			this.doEditAvatar(req, resp);
		}
		else if (uri.contains("editPassword")) {
			this.doEditPassword(req, resp);
		}
		else if (uri.contains("forgotPassword")) {
			this.doForgotPassword(req, resp);
		}
		else if (uri.contains("logout")) {
			this.doLogout(req, resp);
		}
	}

	private void doSignIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = CookieUtils.get("username", req);
		String password = CookieUtils.get("password", req);
		
		req.setAttribute("username", username);
		req.setAttribute("password", password);
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String id = req.getParameter("username");
			String pw = req.getParameter("password");
			String remember = req.getParameter("remember");
			try {
				UserDAO dao = new UserDAO();
				User user = dao.findById(id);
			
				if (!user.getPassword().equals(pw)) {
					req.setAttribute("message", "Sai mật khẩu");
				} else {
					
					req.getSession().setAttribute("user", user);
					
					User u = (User)req.getSession().getAttribute("user");
					List<Video> likeVideo = fdao.findVideoByUserLike(u);
					String likeid = "";
					for(Video v: likeVideo) {
						likeid +=v.getId()+"#";
					}
					req.setAttribute("likeid",likeid);
					
					int hours = (remember == null) ? 0 : 30*24;
					CookieUtils.add("username", id, hours, resp);
					CookieUtils.add("password", pw, hours, resp);
					
					resp.sendRedirect("home");

					return;

				}
			} catch (Exception e) {
				req.setAttribute("message", "Sai tên đăng nhập!");
			}
		}
		req.getRequestDispatcher("/views/dangNhap.jsp").forward(req, resp);
	
	}

	private void doSignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				User entity = new User();

				entity.setId(req.getParameter("Id"));
				entity.setFullname(req.getParameter("Fullname"));
				entity.setEmail(req.getParameter("Email"));
				entity.setPassword(req.getParameter("Password"));
				entity.setAdmin(false);

				String repeat = req.getParameter("Repeat");
				UserDAO dao = new UserDAO();

				if (dao.findById(req.getParameter("Id")) != null) {
					req.setAttribute("danger", "Username đã tồn tại!");
				} else if (req.getParameter("Password").equals(repeat)) {
					dao.create(entity);
					sendEmail sendEmail = new sendEmail();
					sendEmail.SendMail(req.getParameter("Email"), 
							          "Chào", "Chào " + req.getParameter("Fullname")+"!");
					req.setAttribute("success", "Đăng ký thành công!");
					req.getRequestDispatcher("/views/dangKy.jsp").forward(req, resp);
				} else {
					req.setAttribute("danger", "Mật khẩu không trùng khớp!");
				}

			} catch (Exception e) {
				req.setAttribute("danger", "Lỗi đăng ký!");
			}
		}
		req.getRequestDispatcher("/views/dangKy.jsp").forward(req, resp);
	}
	private void doEditAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User entity = (User) req.getSession().getAttribute("user");
		String method = req.getMethod();
		if(method.equalsIgnoreCase("POST")) { 
			try {
		
				entity.setFullname(req.getParameter("Fullname"));
				entity.setEmail(req.getParameter("Email"));

				UserDAO dao = new UserDAO();
				dao.update(entity);
				req.setAttribute("success", "Cập nhật tài khoản thành công!");
			} catch (Exception e) {
				req.setAttribute("danger", "Lỗi cập nhật tài khoản!");
			}
		}
		req.setAttribute("views", "/views/doiThongTin.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}
	private void doEditAvatar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User entity = (User) req.getSession().getAttribute("user");
		String method = req.getMethod();
		if(method.equalsIgnoreCase("POST")) { 
			try {
		
				entity.setAvatar(req.getParameter("avt"));

				UserDAO dao = new UserDAO();
				dao.update(entity);
				req.setAttribute("success", "Cập nhật tài khoản thành công!");
			} catch (Exception e) {
				req.setAttribute("danger", "Lỗi cập nhật tài khoản!");
			}
		}
		req.setAttribute("views", "/views/doiThongTin.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}
	private void doEditPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User entity = (User) req.getSession().getAttribute("user");
		String method = req.getMethod();
		if(method.equalsIgnoreCase("POST")) { 
			String currentPassword = req.getParameter("currentPassword");
			String password = req.getParameter("password");
			String confirmPassword = req.getParameter("confirmPassword");
			try {
		if(!password.equals(confirmPassword)) {
			req.setAttribute("danger", "Mật khẩu không trùng khớp");
		}else if(!currentPassword.equals(entity.getPassword())){
			req.setAttribute("danger", "Mật khẩu không đúng");
		}else {
			entity.setPassword(req.getParameter("password"));

			UserDAO dao = new UserDAO();
			dao.update(entity);
			req.setAttribute("success", "Cập nhật mật khẩu thành công!");	
		}
		
				
			} catch (Exception e) {
				req.setAttribute("danger", "Lỗi cập nhật tài khoản!");
			}
		}
		req.setAttribute("views", "/views/doiThongTin.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}
	private void doForgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String username = req.getParameter("username");
			String email = req.getParameter("email");
			try {
				UserDAO dao = new UserDAO();
				User user = dao.findById(username);
		if(!user.getEmail().equals(email)) {
					req.setAttribute("danger", "Địa chỉ email không chính xác!");	
				}else {
					sendEmail sendEmail = new sendEmail();
					sendEmail.SendMail(req.getParameter("email"), 
							          "Chào " + user.getFullname(), "Mật khẩu tài khoản của bạn là: " + user.getPassword()+".");
					req.setAttribute("success", "Đã gửi!");
				}
			} catch (Exception e) {
				req.setAttribute("danger", "Sai tên đăng nhập!");
			}
		
		}
		req.getRequestDispatcher("/views/quenMK.jsp").forward(req, resp);
	}
	private void doLogout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.getSession().setAttribute("user", null);
	
		resp.sendRedirect("home");
	}

}
