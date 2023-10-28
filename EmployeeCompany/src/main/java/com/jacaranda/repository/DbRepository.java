package com.jacaranda.repository;

import java.util.List;

import org.hibernate.Session;

import com.jacaranda.util.BdUtil;

public class DbRepository {

	public static <E> E find(Class<E> c, int id) throws Exception {
		Session session; 
		E result = null;
		try{
			session = BdUtil.getSessionFactory().openSession();
		}catch(Exception e){
			throw new Exception("Error en la base de datos");
		}
		
		try {
			result = session.find(c, id);
		}catch(Exception e) {
			
		}
		
		return result; 
	}
	
	@SuppressWarnings("unchecked")
	public static <E> List<E> findAll(Class<E> c) throws Exception{
		Session session = null;
		List<E> resultList = null;
		try {
			session = BdUtil.getSessionFactory().openSession();
		}catch(Exception e) {
			throw new Exception ("Error en la base de datos");
		}
		
		try {
			resultList = (List<E>)session.createSelectionQuery("From " + c.getName()).getResultList();
		}catch(Exception e) {
			e.printStackTrace();
			throw new Exception("Error en la base de datos");
		}
		return resultList;
	}
}
