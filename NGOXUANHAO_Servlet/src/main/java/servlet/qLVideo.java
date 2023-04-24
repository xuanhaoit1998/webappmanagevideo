package servlet;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import dao.VideoDAO;
import entity.Video;

@MultipartConfig
@WebServlet({ "/quanLyVideo", "/editVideo", "/createVideo", "/updateVideo", "/deleteVideo" })

public class qLVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Video video = new Video();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("quanLyVideo")) {
			req.setAttribute("disSave", "disabled");
			this.doVideo(req, resp);
		} else if (uri.contains("editVideo")) {
			req.setAttribute("disCreate", "disabled");
			this.doEdit(req, resp);
		} else if (uri.contains("createVideo")) {
			req.setAttribute("disSave", "disabled");
			this.doCreate(req, resp);
		} else if (uri.contains("updateVideo")) {
			req.setAttribute("disSave", "disabled");
			this.doSave(req, resp);
		} else if (uri.contains("deleteVideo")) {
			req.setAttribute("disSave", "disabled");
			this.doRemove(req, resp);
		}
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);

	}

	private void doVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO udao = new UserDAO();
		req.setAttribute("list", udao.findAll());	

		VideoDAO dao = new VideoDAO();
		
		req.setAttribute("listVideo", dao.findAll());
		
		req.setAttribute("views", "/views/quanLyVideo.jsp");

	}

	private void doEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO dao = new VideoDAO();
		String id = req.getParameter("v");
		video = dao.getVideobyId(id);
		req.setAttribute("u", video);

		req.setAttribute("readonly", "readonly");

		this.doVideo(req, resp);
	}

	private void doCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Part part = req.getPart("poster");
		
		String anh = part.getSubmittedFileName();
		try {	
			Video video = new Video();
			
			VideoDAO dao = new VideoDAO();

			BeanUtils.populate(video, req.getParameterMap());		
			
			if (dao.getVideobyId(req.getParameter("id")) != null) {
				req.setAttribute("danger", "Video đã tồn tại!");
			}else if (anh == null||anh.equals("")) {
				video.setPoster("noSignall.jpg");
				dao.create(video);
				req.setAttribute("success", "Thêm thành công!");

				this.doVideo(req, resp);	
			} 
			else {
				video.setPoster(anh);
				dao.create(video);
				req.setAttribute("success", "Thêm thành công!");

				this.doVideo(req, resp);
			}

		} catch (Exception e) {
			req.setAttribute("danger", "Lỗi thêm!");
			this.doVideo(req, resp);
		}

		this.doVideo(req, resp);
	}

	private void doSave(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Part part = req.getPart("poster");
		
		String anh = part.getSubmittedFileName();
		try {
			if (anh == null||anh.equals("")) {

				Video video = new Video();
				VideoDAO dao = new VideoDAO();
				BeanUtils.populate(video, req.getParameterMap());
				Video v = dao.getVideobyId(video.getId());
				video.setViews(v.getViews());
				video.setPoster(v.getPoster());
				dao.update(video);

				req.setAttribute("success", "Cập nhật thành công!");
				this.doVideo(req, resp);
			} else {
				Video video = new Video();
				VideoDAO dao = new VideoDAO();
				BeanUtils.populate(video, req.getParameterMap());
				Video v = dao.getVideobyId(video.getId());
				video.setViews(v.getViews());
				video.setPoster(anh);
				dao.update(video);

				req.setAttribute("success", "Cập nhật thành công!");
				this.doVideo(req, resp);
		}

		} catch (Exception e) {
			req.setAttribute("danger", "Lỗi cập nhật!");
			this.doVideo(req, resp);
		}

		this.doVideo(req, resp);
	}

	private void doRemove(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO dao = new VideoDAO();
		try {
			dao.delete(req.getParameter("id"));
			video = new Video();
			req.setAttribute("success", "Xoá video thành công!");
			this.doVideo(req, resp);
		} catch (Exception e) {
			req.setAttribute("danger", "Xóa video thất bại!");
			this.doVideo(req, resp);
		}
	}

	public List<Video> getVideo(int page) {
		VideoDAO dao = new VideoDAO();
		return dao.getVideoPaging(page);
	}

}
