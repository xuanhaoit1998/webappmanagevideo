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
import dao.ShareDAO;
import dao.VideoDAO;
import entity.User;
import entity.Video;
import utils.sendEmail;
import entity.Favorite;
import entity.Share;

@WebServlet({ "/home", "/watch","/shareWatch","/likeWatch", "/unlikeWatch","/likeIndex", "/shareIndex","/unlikeIndex" })
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideoDAO dao = new VideoDAO();
	private FavoriteDAO fdao = new FavoriteDAO();
	private ShareDAO sdao = new ShareDAO();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("home")) {
			this.doHome(req, resp);
		} else if (uri.contains("watch")) {
			this.doVideo(req, resp);
		}
		else if (uri.contains("unlikeIndex")) {
			this.doUnlike(req, resp);
			resp.sendRedirect(req.getContextPath()+"/home");
		}
		else if (uri.contains("unlikeWatch")) {
			this.doUnlike(req, resp);
			this.doVideo(req, resp);
		}
		else if (uri.contains("likeIndex")) {
			this.doLike(req, resp);
			resp.sendRedirect(req.getContextPath()+"/home");
		}
		else if (uri.contains("shareIndex")) {
			this.doShare(req, resp);
			resp.sendRedirect(req.getContextPath()+"/home");
		}
		else if (uri.contains("shareWatch")) {
			this.doShare(req, resp);
			this.doVideo(req, resp);
		}
		else if (uri.contains("likeWatch")) {
			this.doLike(req, resp);
			this.doVideo(req, resp);
		}


	}

	private void doHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int page = 0;
		try {
			page = Integer.parseInt(req.getParameter("page")) - 1;
		} catch (Exception ex) {
			page = 0;
		}
		VideoDAO dao = new VideoDAO();
		req.setAttribute("listItem", getVideo(page));
		req.setAttribute("page", page + 1);
		req.setAttribute("totalPage", dao.getTotalPage());
		req.setAttribute("selectHome","class=\"selected\"");
		User u = (User)req.getSession().getAttribute("user");
		if(u != null) {
			List<Video> likeVideo = fdao.findVideoByUserLike(u);
			String likeid = "";
			for(Video v: likeVideo) {
				likeid += v.getId()+"#";
			}
			req.setAttribute("likeid",likeid);
		}
		req.setAttribute("link", "http://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/watch?v=");
		
		
		req.setAttribute("views", "/views/index.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);

	}

	private void doVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idVideo = req.getParameter("v");
		Video v = dao.getVideobyId(idVideo);

		Cookie[] c = req.getCookies();
		Cookie lichsu = null;
		for (int i = 0; i < c.length; i++) {
			if (c[i].getName().equals("lichsu")) {
				lichsu = c[i];
			}
		}
		if (lichsu == null) {
			lichsu = new Cookie("lichsu", v.getId());
			Video views = dao.getVideobyId(idVideo);
			views.setViews(views.getViews()+1);
			dao.update(views);
		} else {
			if (!lichsu.getValue().contains(v.getId())) {
				Video views = dao.getVideobyId(idVideo);
				views.setViews(views.getViews()+1);
				dao.update(views);
				lichsu.setValue(lichsu.getValue() + "#" + v.getId());
			}
				
		}
		resp.addCookie(lichsu);

		String[] ls = lichsu.getValue().split("#");
		List<String> listLS = new ArrayList<String>();
		for (String id : ls) {
			listLS.add(id);
		}
		req.setAttribute("lichsu", dao.getVideo(listLS));
		User u = (User)req.getSession().getAttribute("user");
		req.setAttribute("watch", v);
		if(u != null) {
			List<Video> likeVideo = fdao.findVideoByUserLike(u);
			String likeid = "";
			for(Video a: likeVideo) {
				likeid += a.getId()+"#";
			}
			req.setAttribute("likeid",likeid);
		}
		req.setAttribute("link", "http://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/watch?v=");
		req.setAttribute("views", "/views/xemVideo.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);

	}
	private void doLike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u = (User)req.getSession().getAttribute("user");
		
		String idVideo = req.getParameter("v");
		Video v = dao.getVideobyId(idVideo);
		Date likeDate = new Date();
		Favorite fav = new Favorite(u, v, likeDate);
		fdao.create(fav);
	
	}
	private void doShare(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		User u = (User)req.getSession().getAttribute("user");
		
		String idVideo = req.getParameter("v");
		String linkVideo = req.getParameter("link");
		String emailTo = req.getParameter("emailTo");
		Video v = dao.getVideobyId(idVideo);
		Date shareDate = new Date();
		Share s = new Share(u, v, shareDate,emailTo);
		sdao.create(s);
		sendEmail sendEmail = new sendEmail();
		sendEmail.SendMail(emailTo, "Chào", linkVideo);
		
		
		
	}

	private void doUnlike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u = (User)req.getSession().getAttribute("user");
		String idVideo = req.getParameter("v");
		
		fdao.remove(u.getId(), idVideo);

	
	}
	public List<Video> getVideo(int page) {
		return dao.getVideoPaging(page);
	}

}
