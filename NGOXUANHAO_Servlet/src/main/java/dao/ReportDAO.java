package dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import entity.Report;
import entity.Video;
import utils.JpaUtils;


public class ReportDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	
	public List<Report> thongKeLuotThich(){
		TypedQuery<Report> query = em.createQuery("SELECT new Report(f.video.title, COUNT(f.video), MAX(f.likeDate), MIN(f.likeDate)) FROM Favorite f GROUP BY f.video.title", Report.class);
		return query.getResultList();
		
	}
	public List<Integer> selectYear(){
		String jpql = "SELECT year(o.likeDate) FROM Favorite o GROUP BY year(o.likeDate)";
		TypedQuery<Integer> query = em.createQuery(jpql,Integer.class);
		List<Integer> list = query.getResultList();
		return list;
	}
	
	public List<Video> thongKeLuotXem(Date fromDate, Date toDate){
		TypedQuery<Video> query = em.createQuery("SELECT f.video FROM Favorite f WHERE f.likeDate BETWEEN :min AND :max",Video.class);
		query.setParameter("min", fromDate);
		query.setParameter("max", toDate);
		return query.getResultList();
	}
	
	public List<Object[]> findVideoByName(String name) {
		TypedQuery<Object[]> query = em.createQuery("SELECT f.video.id,f.video.title, COUNT(*) FROM Share f WHERE f.video.title LIKE :name GROUP BY f.video.id,f.video.title", Object[].class);
		query.setParameter("name", "%"+name+"%");
		return query.getResultList();
	}
     @SuppressWarnings("unchecked")
     public List<Report> tongHop(Integer year){
		
		StoredProcedureQuery query = em.createNamedStoredProcedureQuery("Report.favoriteByYear");
		query.setParameter("Year", year);
		List<Report> list = query.getResultList();
		return list;
		
		
	}
     public List<Object[]> findUserByVideo(String id) {
 		TypedQuery<Object[]> query = em.createQuery("SELECT f.user.id,f.user.fullname, f.user.email , f.likeDate FROM Favorite f WHERE f.video.id = :idVideo", Object[].class);
 		query.setParameter("idVideo", id);
 		return query.getResultList();
 	}
     public List<Object[]> findUserShareVideo(String id) {
 		TypedQuery<Object[]> query = em.createQuery("SELECT sh.user.id, sh.user.email ,sh.email , sh.shareDate FROM Share sh WHERE sh.video.id = :idVideo", Object[].class);
 		query.setParameter("idVideo", id);
 		return query.getResultList();
 	}
}
