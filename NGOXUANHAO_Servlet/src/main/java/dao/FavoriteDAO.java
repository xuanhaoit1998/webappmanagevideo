package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entity.Favorite;
import entity.User;
import entity.Video;
import utils.JpaUtils;


public class FavoriteDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	protected void finalize() throws Throwable {
		em.close();
	}
	public Favorite create(Favorite entity) {
		em.getTransaction().begin();
		try {
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception ex) {
			em.getTransaction().rollback();
		}
		return entity;
	}

	public Favorite update(Favorite entity) {
		em.getTransaction().begin();
		try {
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception ex) {
			em.getTransaction().rollback();
		}
		return entity;
	}

	public Favorite remove(String id) {
		Favorite entity = null;
		em.getTransaction().begin();
		try {
			entity = findById(id);
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception ex) {
			em.getTransaction().rollback();
		}
		return entity;
	}
	public Favorite remove(String idUser, String idVideo) {
		Favorite entity = null;
		em.getTransaction().begin();
		try {
			TypedQuery<Favorite> query = em.createQuery("FROM Favorite where user.id = :idUser AND video.id = :idVideo", Favorite.class);
			query.setParameter("idUser", idUser);
			query.setParameter("idVideo", idVideo);
			entity = query.getSingleResult();
			if(entity != null)
				em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception ex) {
			em.getTransaction().rollback();
		}
		return entity;
	}

	public Favorite findById(String id) {
		Favorite entity = em.find(Favorite.class, id);
		return entity;
	}

	public List<Favorite> findAll() {
		TypedQuery<Favorite> query = em.createNamedQuery("findAll", Favorite.class);
		return query.getResultList();
	}
	public List<Video> findVideoByUserLike(User u) {
		TypedQuery<Video> query = em.createQuery("SELECT f.video FROM Favorite f WHERE f.user.id = :id and active = 1", Video.class);
		query.setParameter("id", u.getId());
		return query.getResultList();
	}
}
