package iuh.fit.vistalhotelwebsite.service;

import java.util.List;

public interface GenericService<T, ID> {
    boolean create(T t);
    boolean update(T t);
    boolean delete(ID id);
    T findById(ID id);
    List<T> getAll();
    List<T> searchByIdAndName(String idField, String nameField, String idValue, String nameValue);
}
