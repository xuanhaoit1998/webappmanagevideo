package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import entity.Video;
import utils.JpaUtils;


public class VideoDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	private EntityTransaction tran = em.getTransaction();
	
	public Video create(Video video) {
		try {
			tran.begin();
			em.persist(video);
			tran.commit();
			System.out.println("Thêm mới thành công!");
		} catch (Exception e) {
			e.printStackTrace();
	
			tran.rollback();
			System.out.println("Thêm mới thất bại!");
		} 
		return video;

	}
	public Video update(Video video) {	
		try {		
			tran.begin();		
			em.merge(video);	
			tran.commit();
			System.out.println("Cập nhật thành công!");
		} catch (Exception e) {
			tran.rollback();	
			System.out.println("Cập nhật thất bại!");
		}
		return video;

	}
	public Video delete(String id) throws Exception{
		
		Video entity = null;
		tran.begin();
	
			entity = getVideobyId(id);
			if(entity != null) {
				em.remove(entity);
				System.out.println("Xóa thành công");
			}else {
				System.out.println("Không tìm thấy User");
			}
				
			tran.commit();
		
		return entity;
	}
	public Video getVideobyId(String id) {
		Video v = em.find(Video.class, id);
		return v;
	}
	
	public List<Video> findAll(){

		TypedQuery<Video> query = em.createQuery("From Video",Video.class);
		List<Video>list=query.getResultList();
		return list;
		
	}

	public List<Video> getVideoPaging(int page) {
		TypedQuery<Video> query = em.createQuery("FROM Video WHERE active = 1 ORDER BY views DESC", Video.class);
		query.setFirstResult(page * 12);
		query.setMaxResults(12);
		List<Video>list=query.getResultList();
		return list;
	}

	public Long getTotalPage() {
		TypedQuery<Long> query = em.createQuery("SELECT COUNT(*) FROM Video WHERE active = 1", Long.class);
		return (long) Math.ceil(query.getSingleResult() / 12.0);
	}


	public List<Video> getVideo(List<String> idVideos) {
		TypedQuery<Video> query = em.createQuery("FROM Video WHERE id in (:idvideos)", Video.class);
		query.setParameter("idvideos", idVideos);
	
		return query.getResultList();
	}
	@SuppressWarnings("unchecked")
	public List<Video> videoFavorites(){
		
		Query query = em.createNamedQuery("Video.VideoLike");
		List<Video> list = query.getResultList();
		return list;
	}
@SuppressWarnings("unchecked")
public List<Video> videoShared(){
		
		Query query = em.createNamedQuery("Video.VideoShare");
		List<Video> list = query.getResultList();
		return list;
	}
}
