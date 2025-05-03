/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dao.UserDAO;
import dto.UserDTO;
import java.util.List;

/**
 *
 * @author MSI PC
 */
public class UserTest {
    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        
//        //insert
//        for (int i = 0; i < 10; i++) {
//             UserDTO u = new UserDTO("se180"+i,"Le Van"+i, "us","khong_co_pass"+i);
//             userDAO.create(u);
//        }
        
//        //update
//        UserDTO u2 = new UserDTO("se1801","Le Van nhat", "us","dadoiduoc1lan");
//        userDAO.update(u2);
        
//        //delete
//        for (int i = 0; i < 5; i++) {
//             String a = "se180";
//             userDAO.delete(a+i);
//        }

//         // select all
//        List<UserDTO> L1 = userDAO.readAll();
//        for (UserDTO u: L1) {
//            System.out.println(u);
//        }


            // select where
            System.out.println(userDAO.readbyID("se1806"));
    }
}
