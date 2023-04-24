package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import entity.User;
import utils.JpaUtils;

public class UserDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	private EntityTransaction tran = em.getTransaction();
	@Override
	protected void finalize() throws Throwable {
		em.close();
	}
	
	public User create(User user) {
		try {
			tran.begin();
			em.persist(user);
			tran.commit();
			System.out.println("Thêm mới thành công!");
		} catch (Exception e) {
			e.printStackTrace();
	
			tran.rollback();
			System.out.println("Thêm mới thất bại!");
		} 
		return user;

	}

	public User update(User user) {	
		try {		
			tran.begin();		
			em.merge(user);	
			tran.commit();
			System.out.println("Cập nhật thành công!");
		} catch (Exception e) {
			tran.rollback();	
			System.out.println("Cập nhật thất bại!");
		}
		return user;

	}
	
	public void deleteAll() {
		
		EntityManager em = JpaUtils.getEntityManager();
		
		EntityTransaction tran = em.getTransaction();
	
		String jqpl = "Delete from User";
		
		try {
			tran.begin();
			em.createQuery(jqpl).executeUpdate();
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		}
	}
	
	public User delete(String id) throws Exception{
		
		User entity = null;
		tran.begin();
		try {
			entity = findById(id);
			if(entity != null) {
				em.remove(entity);
				System.out.println("Xóa thành công");
			}else {
				System.out.println("Không tìm thấy User");
			}
				
			tran.commit();
		} catch (Exception ex) {
			tran.rollback();
		}
		return entity;
	}
	
	public List<User> findAll(){
	
		String jpql = "SELECT o FROM User o";
	
		TypedQuery<User> query = em.createQuery(jpql, User.class);	

		return query.getResultList();
		
	}
	
	public List<User> findByRole(boolean role){


		String jpql = "SELECT o FROM User o WHERE o.admin=:role";

		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("role", role);
	
		return query.getResultList();
		
	}
	
	public List<User> findByKeyWord(String keyword){
		
		String jqpl = "SELECT o FROM User o WHERE o.fullname like :keyword";
	
		TypedQuery<User> query = em.createQuery(jqpl, User.class);
		query.setParameter("keyword", "%"+keyword+"%");
		
		return query.getResultList();
	}
	
	public User findOne(String id, String password){
		
		String jqpl = "SELECT o FROM User o WHERE o.id = :id AND o.password = :password";
		
		TypedQuery<User> query = em.createQuery(jqpl,User.class);
		
		query.setParameter("id", id);
		query.setParameter("password", password);
	
		return query.getSingleResult();
		
	}
	
	public User findById(String id) {
		User entity = em.find(User.class, id);
		return entity;
	}
	
	public List<User> findPage(int page, int size){
		
		String jpql = "SELECT o FROM User o";

		TypedQuery<User> query = em.createQuery(jpql, User.class);
		
		query.setFirstResult(page*size);
		
		query.setMaxResults(size);
		
		return query.getResultList();
		
	}
}
