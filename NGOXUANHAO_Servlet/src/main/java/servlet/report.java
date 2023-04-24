package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FavoriteDAO;
import dao.ReportDAO;
import dao.VideoDAO;
import entity.User;
import entity.Video;
import entity.Favorite;

@WebServlet({ "/thongKeLuotThich", "/thongKeNguoiThich","/thongKeNguoiShare" })
public class report extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideoDAO dao = new VideoDAO();
	private FavoriteDAO fdao = new FavoriteDAO();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("thongKeLuotThich")) {
			this.doThongKe1(req, resp);
		} else if (uri.contains("thongKeNguoiThich")) {
			this.doThongKe2(req, resp);
		}
		else if (uri.contains("thongKeNguoiShare")) {
			this.doThongKe3(req, resp);
		}
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);

	}

	private void doThongKe1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReportDAO dao = new ReportDAO();
		VideoDAO daoV = new VideoDAO();
	
		req.setAttribute("years", dao.selectYear());
		
		req.setAttribute("videos", daoV.videoFavorites());
		

		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			
		req.setAttribute("years", dao.selectYear());
			Integer year = Integer .valueOf(req.getParameter("year"));

			req.setAttribute("items", dao.tongHop(year));
			
//			req.setAttribute("test", dao.findUserByVideo(req.getParameter("video")));
		}
	
		req.setAttribute("views", "/views/thongKeThich.jsp");

	}

	private void doThongKe2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReportDAO dao = new ReportDAO();
		VideoDAO daoV = new VideoDAO();
	
		
		req.setAttribute("videos", daoV.videoFavorites());
		

		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			
			req.setAttribute("test", dao.findUserByVideo(req.getParameter("video")));
		}
	
		req.setAttribute("views", "/views/thongKeNguoiThich.jsp");

	}
	private void doThongKe3(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReportDAO dao = new ReportDAO();
		VideoDAO daoV = new VideoDAO();
	
		
		req.setAttribute("videos", daoV.videoShared());
		

		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			
			req.setAttribute("share", dao.findUserShareVideo(req.getParameter("video")));
			
		}
	
		req.setAttribute("views", "/views/thongKeChiaSe.jsp");

	}
	public List<Video> getVideo(int page) {
		return dao.getVideoPaging(page);
	}

}
