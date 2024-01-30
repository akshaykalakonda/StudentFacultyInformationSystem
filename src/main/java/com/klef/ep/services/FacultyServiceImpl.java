package com.klef.ep.services;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.klef.ep.models.Admin;
import com.klef.ep.models.Faculty;

@Stateless
@TransactionManagement(TransactionManagementType.BEAN)
public class FacultyServiceImpl implements FacultyService{

	@Override
	public String addFaculty(Faculty emp) {
		EntityManagerFactory emf = null;
		EntityManager em = null;
		try {
		    emf = Persistence.createEntityManagerFactory("jpa");
		    em = emf.createEntityManager();
		    em.getTransaction().begin();
		    
		    em.persist(emp);     // insert operation
		    em.getTransaction().commit();
		    
		    return "Record Inserted Successfully with ID: "+emp.getId();
		} catch (Exception e) {
		    
		    if (em != null && em.getTransaction().isActive()) {
		        em.getTransaction().rollback(); // Rollback the transaction if it is still active
		    }
		    e.printStackTrace(); // Print the stack trace to see the error details
		    return "Username or ContactNo name already exists..Try Again..!";
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
	public List<Faculty> viewAllFaculties() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
        EntityManager em = emf.createEntityManager();
          
        em.getTransaction().begin();
         
         Query qry = em.createQuery("   select e from Faculty e "); // e is an alias of Employee class
         List<Faculty> emplist = qry.getResultList();
         
         em.close();
         emf.close();
         
         return emplist;
	}
	
	

	@Override
	public Faculty facultyLogin(int uname, String pwd) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
     	EntityManager em = emf.createEntityManager();
     	  
        em.getTransaction().begin();
        
        Query qry = em.createQuery("  select a from Faculty a where id=? and password=?   ");
	     qry.setParameter(1, uname);
	     qry.setParameter(2, pwd);
	     
	     Faculty fty = null;
	     
	     if(qry.getResultList().size() > 0) 
	     {
	    	    fty = (Faculty) qry.getSingleResult();
	     }
	     
	     em.close();
	     emf.close();
	   
	     return fty;
	}

	@Override
	public Faculty adminviewfac(int id) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
     	EntityManager em = emf.createEntityManager();
     	  
        em.getTransaction().begin();
        
        Query qry = em.createQuery("  select a from Faculty a where id=?    ");
	     qry.setParameter(1, id);
	     
	     
	     Faculty fty = null;
	     
	     if(qry.getResultList().size() > 0) 
	     {
	    	    fty = (Faculty) qry.getSingleResult();
	     }
	     
	     em.close();
	     emf.close();
	   
	     return fty;
	}

}
