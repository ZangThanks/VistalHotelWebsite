package iuh.fit.vistalhotelwebsite.service.impl;

import iuh.fit.vistalhotelwebsite.dao.GenericDAO;
import iuh.fit.vistalhotelwebsite.service.GenericService;

import java.util.List;

public class GenericServiceImpl<T, ID> implements GenericService<T, ID> {
    private GenericDAO<T, ID> dao;

    public GenericServiceImpl(GenericDAO<T, ID> dao) {
        this.dao = dao;
    }

    @Override
    public boolean create(T t) {
        return dao.create(t);
    }

    @Override
    public boolean update(T t) {
        return dao.update(t);
    }

    @Override
    public boolean delete(ID id) {
        return dao.delete(id);
    }

    @Override
    public T findById(ID id) {
        return dao.findById(id);
    }

    @Override
    public List<T> getAll() {
        return dao.getAll();
    }

    @Override
    public List<T> searchByIdAndName(String idField, String nameField, String idValue, String nameValue) {
        return dao.searchByIdAndName(idField, nameField, idValue, nameValue);
    }
}
