package com.klef.ep.services;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.klef.ep.models.Admin;


@Stateless
@TransactionManagement(TransactionManagementType.BEAN)
public class AdminServiceImpl implements AdminService{

	@Override
	public String addAdmin(Admin adm) {
			
		EntityManagerFactory emf = null;
		EntityManager em = null;
		try {
		    emf = Persistence.createEntityManagerFactory("jpa");
		    em = emf.createEntityManager();
		    em.getTransaction().begin();
		    
		    em.persist(adm);     // insert operation
		    em.getTransaction().commit();
		    
		    return "Record Inserted Successfully";
		} catch (Exception e) {
		    
		    if (em != null && em.getTransaction().isActive()) {
		        em.getTransaction().rollback(); // Rollback the transaction if it is still active
		    }
		    e.printStackTrace(); // Print the stack trace to see the error details
		    return "Username name already exists..Try Again..!";
		} finally {
		    if (em != null) {
		        em.close();
		    }
		    if (emf != null) {
		        emf.close();
		    }
		}

		
	}

	@Override
	public Admin adminLogin(String uname, String pwd) {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
	      	 EntityManager em = emf.createEntityManager();
	      	  
	         em.getTransaction().begin();
	         
	         Query qry = em.createQuery("  select a from Admin a where username=? and password=?   ");
		     qry.setParameter(1, uname);
		     qry.setParameter(2, pwd);
		     
		     Admin adm = null;
		     
		     if(qry.getResultList().size() > 0) 
		     {
		    	    adm = (Admin) qry.getSingleResult();
		     }
		     
		     em.close();
		     emf.close();
		   
		     return adm;
		
	}
	
	

}
