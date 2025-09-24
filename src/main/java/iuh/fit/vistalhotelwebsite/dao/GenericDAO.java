package iuh.fit.vistalhotelwebsite.dao;

import iuh.fit.vistalhotelwebsite.util.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;

import java.util.ArrayList;
import java.util.List;

public abstract class GenericDAO<T, ID> {
    protected EntityManager em;
    protected Class<T> clazz;

    public GenericDAO(Class<T> clazz) {
        this.clazz = clazz;
        this.em = JPAUtil.getEntityManager();
    }

    public GenericDAO(EntityManager em, Class<T> clazz) {
        this.em = em;
        this.clazz = clazz;
    }

    public synchronized List<T> getAll() {
        String jpql = "SELECT t FROM " + clazz.getSimpleName() + " t";
        return em.createQuery(jpql, clazz).getResultList();
    }

    public synchronized boolean create(T t) {
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(t);
            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return false;
        }
    }

    public synchronized T findById(ID id) {
        return em.find(clazz, id);
    }
    public synchronized boolean update(T t){
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(t);
            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return false;
        }
    }
    public synchronized boolean delete(ID id){
        EntityTransaction tx = em.getTransaction();
        try{
            tx.begin();
            T t = em.find(clazz, id);
            if(t != null){
                em.remove(t);
                tx.commit();
                return true;
            }
        } catch (Exception e) {
            if(tx.isActive()){
                tx.rollback();
                e.printStackTrace();
            }
        }
        return false;
    }

    public synchronized List<T> searchByIdAndName(String idField, String nameField,
                                     String idValue, String nameValue) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<T> cq = cb.createQuery(clazz);
        Root<T> root = cq.from(clazz);

        List<Predicate> predicates = new ArrayList<>();

        if (idValue != null && !idValue.isEmpty()) {
            predicates.add(cb.equal(root.get(idField), idValue));
        }
        if (nameValue != null && !nameValue.isEmpty()) {
            predicates.add(cb.like(root.get(nameField), "%" + nameValue + "%"));
        }
        cq.select(root).where(predicates.toArray(new Predicate[0]));

        return em.createQuery(cq).getResultList();
    }




}
