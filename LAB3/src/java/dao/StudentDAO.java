/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import controller.UpdateStudent;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;

/**
 *
 * @author fxxki
 */
public class StudentDAO extends DBContext {

    public ArrayList<Student> getList() {
        String sql1 = " select * from Student ";
        try {
            ArrayList<Student> list = new ArrayList<>();
            PreparedStatement stm = connection.prepareStatement(sql1);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getDate(4));
                list.add(s);

            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void insert(Student s) {
        try {
            String sql = "insert into Student(name, gender, dob) values (?, ?, ?)";
            try ( PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, s.getName());
                ps.setBoolean(2, s.isGender());
                ps.setDate(3, new java.sql.Date(s.getDob().getTime()));
                ps.execute();
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void update(Student s) {
        try {
            String sql = "UPDATE [Student] SET [name] = ?, [gender] = ?, [dob] = ? WHERE [id] = ?";
            try ( PreparedStatement pm = connection.prepareStatement(sql)) {
                pm.setString(1, s.getName());
                pm.setBoolean(2, s.isGender());
                pm.setDate(3, new java.sql.Date(s.getDob().getTime()));
                pm.setInt(4, s.getId());
                pm.execute();
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int id) {
        try {
            String sql = "DELETE FROM Student WHERE Id = ?";
            PreparedStatement pm = connection.prepareStatement(sql);
            pm.setInt(1, id);
            pm.execute();
            pm.close();

        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Student getDetail(int id) {
        String sql1 = " select * from Student where id = ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql1);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getDate(4));
                return s;

            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }
    public static void main(String[] args) {
        System.out.println( new StudentDAO().getDetail(6).getName());
    }
}
