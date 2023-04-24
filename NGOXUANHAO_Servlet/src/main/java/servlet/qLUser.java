package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import dao.VideoDAO;
import entity.User;
import entity.Video;

@WebServlet({ "/quanLyUser","/editUser","/createUser","/updateUser","/deleteUser" })
public class qLUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("quanLyUser")) {
			req.setAttribute("disSave", "disabled");
			this.doQuanLyUser(req, resp);
		}
		else if (uri.contains("editUser")) {
			req.setAttribute("disCreate", "disabled");
			this.doEdit(req, resp);
		}
		else if (uri.contains("createUser")) {
			req.setAttribute("disSave", "disabled");
			this.doCreate(req, resp);
		}
		else if (uri.contains("updateUser")) {
			req.setAttribute("disSave", "disabled");
			this.doSave(req, resp);
		}
		else if (uri.contains("deleteUser")) {
			req.setAttribute("disSave", "disabled");
			this.doRemove(req, resp);
		}
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);

	}

	private void doQuanLyUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO udao = new UserDAO();
		req.setAttribute("list", udao.findAll());
		
		req.setAttribute("views", "/views/quanLyUser.jsp");
		
		VideoDAO dao = new VideoDAO();
		
		req.setAttribute("listVideo", dao.findAll());

	}

	private void doEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		String id = req.getParameter("v");
		user = dao.findById(id);
		req.setAttribute("u", user);
	
		req.setAttribute("an", "readonly");
		this.doQuanLyUser(req, resp);
	
	}
	private void doCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			User entity = new User();

			BeanUtils.populate(entity, req.getParameterMap());

			UserDAO dao = new UserDAO();

			if (dao.findById(req.getParameter("id")) != null) {
				req.setAttribute("danger", "Username đã tồn tại!");	
			} else {
               
				dao.create(entity);
				req.setAttribute("success", "Thêm thành công!");
				this.doQuanLyUser(req, resp);
			}

		} catch (Exception e) {
			req.setAttribute("danger", "Lỗi thêm!");
			this.doQuanLyUser(req, resp);
		}
			
	
	}
	private void doSave(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			User entity = new User();
			UserDAO dao = new UserDAO();
			BeanUtils.populate(entity, req.getParameterMap());
			 User u = dao.findById(req.getParameter("id"));
				
             entity.setAvatar(u.getAvatar());
				dao.update(entity);
				req.setAttribute("success", "Cập nhật thành công!");
				this.doQuanLyUser(req, resp);


		} catch (Exception e) {
			req.setAttribute("danger", "Lỗi cập nhật!");
			this.doQuanLyUser(req, resp);
		}
			

	}
	private void doRemove(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		try {
			dao.delete(req.getParameter("id"));
			user = new User();
			req.setAttribute("message", "Xóa tài khoản thành công!");
			this.doQuanLyUser(req, resp);
		} catch (Exception e) {
			req.setAttribute("message", "Xóa tài khoản thất bại!");
			this.doQuanLyUser(req, resp);
		}
	}

}
