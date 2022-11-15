package dao;

import entity.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author BLC
 */
public class BookDAO {

    public ArrayList<Book> getListBook() {

        ArrayList<Book> listBook = new ArrayList<>();

        try {

            Connection con = DBContext.getConnection();
            String query = "SELECT * FROM books;";
            Statement st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {

                Book book = new Book(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9));
                listBook.add(book);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return listBook;
    }

    public ArrayList<Book> getListBook_1() {
        ArrayList<Book> listBook = new ArrayList<>();

        String query = "select * from books inner join authors on  books.author_id=  authors.author_id inner join genre on books.genre_id = genre.genre_id;";
        Statement st;
        try {
            Connection con = DBContext.getConnection();
            st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Book book = new Book(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(11),
                        rs.getString(15));
                listBook.add(book);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listBook;
    }

    public int insertBook(Book book) {
        int newID=0;
        try {
            String sqlstm = "INSERT INTO books(title, author_id, genre_id , price, quantity, yor, description ,book_status) VALUE(?,?,?,?,?,?,?,?)";

            Connection con = DBContext.getConnection();
            PreparedStatement pst = con.prepareStatement(sqlstm, PreparedStatement.RETURN_GENERATED_KEYS);

            pst.setString(1, book.getTitle());
            pst.setInt(2, book.getAuthor_id());
            pst.setInt(3, book.getGenre_id());
            pst.setInt(4, book.getPrice());
            pst.setInt(5, book.getQuantity());
            pst.setInt(6, book.getYor());
            pst.setString(7, book.getDescription());
            pst.setInt(8, book.getBook_status());

            pst.executeUpdate();

            ResultSet res = pst.getGeneratedKeys();
            
            while (res.next()) {
                newID=res.getInt(1);
                System.out.println("Generated key: ----------" +newID );
            }

            pst.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }
        return newID;
    }

    public void updateBook(Book book) {
        try {
            Connection con = DBContext.getConnection();

            String query = "UPDATE books SET title = ?, author_id = ?, genre_id = ?, price = ?, quantity = ?, yor = ?, description = ?, book_status=? WHERE book_id = ?";
            PreparedStatement pst = con.prepareStatement(query);

            pst.setInt(9, book.getBook_id());
            pst.setString(1, book.getTitle());
            pst.setInt(2, book.getAuthor_id());
            pst.setInt(3, book.getGenre_id());
            pst.setInt(4, book.getPrice());
            pst.setInt(5, book.getQuantity());
            pst.setInt(6, book.getYor());
            pst.setString(7, book.getDescription());
            pst.setInt(8, book.getBook_status());

            pst.executeUpdate();

            pst.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public Book getBookByID(int id) {
        Book book = null;
        try {
            Connection con = DBContext.getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM books WHERE book_id = ?");
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                book = new Book(id,
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9));
            }
            con.close();
            pst.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return book;
    }

    public void disableBook(int id) {

        try {
            Connection con = DBContext.getConnection();

            String query = "UPDATE books SET book_status = 0 WHERE book_id = ?";
            String query1 = "UPDATE books SET book_status = 1 WHERE book_id = ?";

            int status = this.getBookByID(id).getBook_status();
            PreparedStatement pst;
            if (status == 1) {
                pst = con.prepareStatement(query);
                pst.setInt(1, id);
            } else {
                pst = con.prepareStatement(query1);
                pst.setInt(1, id);
            }

            pst.executeUpdate();
            pst.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

    }

}
