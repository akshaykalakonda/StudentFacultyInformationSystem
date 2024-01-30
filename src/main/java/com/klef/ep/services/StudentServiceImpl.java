package com.klef.ep.services;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.klef.ep.models.Faculty;
import com.klef.ep.models.Student;

@Stateless
@TransactionManagement(TransactionManagementType.BEAN)
public class StudentServiceImpl implements StudentService{

	@Override
	public String AddStudent(Student student) {
		EntityManagerFactory emf = null;
		EntityManager em = null;
		try {
		    emf = Persistence.createEntityManagerFactory("jpa");
		    em = emf.createEntityManager();
		    em.getTransaction().begin();
		    
		    em.persist(student);     // insert operation
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
	public List<Student> viewAllStudents() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
        EntityManager em = emf.createEntityManager();
          
        em.getTransaction().begin();
         
         Query qry = em.createQuery("   select e from Student e "); // e is an alias of Employee class
         List<Student> emplist = qry.getResultList();
         
         em.close();
         emf.close();
         
         return emplist;
	}

	@Override
	public Student adminviewstud(int id) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
     	EntityManager em = emf.createEntityManager();
     	  
        em.getTransaction().begin();
        
        Query qry = em.createQuery("  select s from Student s where id=?    ");
	     qry.setParameter(1, id);
	     
	     
	     Student fty = null;
	     
	     if(qry.getResultList().size() > 0) 
	     {
	    	    fty = (Student) qry.getSingleResult();
	     }
	     
	     em.close();
	     emf.close();
	   
	     return fty;
	}

	@Override
	public long getcount() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
     	EntityManager em = emf.createEntityManager();
     	  
        em.getTransaction().begin();
        
        Query qry = em.createNativeQuery("  select count(*) from Student ");
        Long totalCount = (Long) qry.getSingleResult();
        return totalCount;
	}
	

}
