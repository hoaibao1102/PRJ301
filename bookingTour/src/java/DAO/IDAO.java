/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import java.util.List;

/**
 *
 * @author MSI PC
 */
public interface IDAO {
         boolean create(T entity);

    List<T> readAll();

    T readbyID(K id);

    boolean update(T entity);

    boolean delete(K id);

    List<T> search(String searchTerm);
}
