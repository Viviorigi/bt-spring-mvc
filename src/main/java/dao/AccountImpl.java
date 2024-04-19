package dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import entities.Account;
import entities.Category;


@Repository
public class AccountImpl implements AccountDAO {
	@Autowired
	SessionFactory sessionFactory;
	// phương thức lấy Account theo username
	@Override
	public Account getAccount(String username) {
		Account account=null;
		Session session=sessionFactory.openSession();	
		Query query=session.createQuery("from Account where username=:username");
		query.setParameter("username", username);
		try {
			account=(Account)query.getSingleResult();
		}catch (Exception e) {
			
		}finally {
			session.close();
		}
		return account;
	}
	@Override
	public void createAccount(Account acc) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(acc);
		session.getTransaction().commit();
		session.close();
	}
	@Override
	public void updateAccount(Account acc) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.update(acc);
		session.getTransaction().commit();
		session.close();
	}
	@Override
	public List<Account> getAll() {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Account> result=session.createQuery("from Account").list();
		session.getTransaction().commit();
		session.close();
		return result;
	}
}
