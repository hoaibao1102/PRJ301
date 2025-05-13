/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.BookDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author MSI PC
 */
public class BookDAO implements IDAO<BookDTO, String> {

    @Override
    public boolean create(BookDTO entity) {
        return false;
    }

    @Override
    public List<BookDTO> readAll() {
        return null;
    }

    @Override
    public BookDTO readbyID(String id) {
        return null;
    }

    @Override
    public boolean update(BookDTO entity) {
        return false;

    }

    @Override
    public boolean delete(String id) {
        return false;

    }

    @Override
    public List<BookDTO> search(String searchTerm) {
        return null;
    }
    
    public List<BookDTO> searchByTitle(String title){
        String sql = "SELECT * FROM tblBooks WHERE title LIKE ?";
        List<BookDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,"%"+title+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                BookDTO book = new BookDTO(rs.getString("BookID"),
                                            rs.getString("Title"), 
                                            rs.getString("Author"), 
                                            rs.getInt("PublishYear"), 
                                            rs.getDouble("Price"),
                                            rs.getInt("Quantity"));
                list.add(book);
            }
            return list;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}
