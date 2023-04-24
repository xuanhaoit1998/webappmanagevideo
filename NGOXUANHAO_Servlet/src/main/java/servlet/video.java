package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VideoDAO;
import entity.Video;
import utils.sendEmail;
import dao.FavoriteDAO;
import dao.ShareDAO;
import entity.Share;
import entity.User;

@WebServlet({ "/likeList", "/unlike", "/share"})
public class video extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideoDAO dao = new VideoDAO();
	private FavoriteDAO fdao = new FavoriteDAO();
	private ShareDAO sdao = new ShareDAO();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("likeList")) {
			this.doLikelist(req, resp);
		}
		
		else if (uri.contains("unlike")) {
			this.doUnlike(req, resp);
		}
		else if (uri.contains("share")) {
			this.doShare(req, resp);
		}
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);

	}

	private void doLikelist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		User u = (User)req.getSession().getAttribute("user");
		List<Video> likeVideo = fdao.findVideoByUserLike(u);
	
		req.setAttribute("listItem", likeVideo);
		req.setAttribute("selectFavorite","class=\"selected\"");
		req.setAttribute("views", "/views/trangYeuThich.jsp");
		req.setAttribute("link", "http://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/watch?v=");
	}

	private void doUnlike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u = (User)req.getSession().getAttribute("user");
		String idVideo = req.getParameter("v");
		fdao.remove(u.getId(), idVideo);
		
		this.doLikelist(req, resp);
	
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
		this.doLikelist(req, resp);
	}
	public List<Video> getVideo(int page) {
		return dao.getVideoPaging(page);
	}

}
